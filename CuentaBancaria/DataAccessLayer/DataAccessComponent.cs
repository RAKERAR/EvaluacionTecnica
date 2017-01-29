using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.Common;
using System.Data.OracleClient;
using Microsoft.Practices.EnterpriseLibrary.Caching;
using Microsoft.Practices.EnterpriseLibrary.Caching.Expirations;
using Microsoft.Practices.EnterpriseLibrary.Data;

namespace DataAccessLayer
{
    public abstract class DataAccesComponent
    {
        /// <summary>
        /// 
        /// </summary>
        private readonly string _providerName;

        /// <summary>
        /// 
        /// </summary>
        private static Database _database;

        /// <summary>
        /// 
        /// </summary>
        private readonly bool _isOracleFactory;


        public string Stringconnection
        {
            get { return _database.ConnectionStringWithoutCredentials; }
        }

        public DataAccesComponent()
        {
            Cache = CacheFactory.GetCacheManager();
            _isOracleFactory = (Instance.DbProviderFactory is OracleClientFactory);
        }

        private string ProviderName
        {
            get { return _providerName; }
        }

        public DataAccesComponent(string DbProviderName)
        {
            Cache = CacheFactory.GetCacheManager();
            _isOracleFactory = (Instance.DbProviderFactory is OracleClientFactory);
            _providerName = DbProviderName;
        }


        private Database Instance
        {
            get
            {
                _database = string.IsNullOrEmpty(ProviderName) ? DatabaseFactory.CreateDatabase() : DatabaseFactory.CreateDatabase(ProviderName);
                return _database;
            }
        }

        private bool _enabledCaching = true;

        protected virtual bool EnableCaching
        {
            get { return _enabledCaching; }
            set { _enabledCaching = value; }
        }

        protected CacheManager Cache;

        private void AddOracleCursorParameter(DbCommand cmd)
        {
            OracleParameter parameter = new OracleParameter("o_cursor", OracleType.Cursor);
            parameter.Direction = ParameterDirection.Output;
            cmd.Parameters.Add(parameter);
        }

        protected void Fill(DataSet ds, string TableName, DbCommand cmd)
        {
            if (_isOracleFactory)
            {
                AddOracleCursorParameter(cmd);
            }
            Instance.LoadDataSet(cmd, ds, TableName);
        }

        protected void Fill(DataSet ds, DbCommand cmd)
        {
            if (_isOracleFactory)
            {
                AddOracleCursorParameter(cmd);
            }
            Instance.LoadDataSet(cmd, ds, "Default");
        }

        /// <summary>
        /// Gets the cache data set.
        /// </summary>
        /// <param name="key">The key  <see cref="System.String"/>.</param>
        /// <param name="cmd">The CMD  <see cref="System.Data.Common.DbCommand"/>.</param>
        /// <param name="duration">The cache duration in seconds.</param>
        /// <returns>
        /// return System.Data.DataSet <see cref="System.Data.DataSet"/>.
        /// </returns>
        protected DataSet GetCacheDataSet(string key, DbCommand cmd, int duration)
        {
            DataSet result = (DataSet)Cache[key];
            if (result != null)
            {
                return result;
            }
            result = GetDataSet(cmd);
            Cache.Add(key, result, CacheItemPriority.Normal, null, new AbsoluteTime(TimeSpan.FromSeconds(duration)));
            return result;
        }

        protected DataSet GetDataSet(DbCommand cmd)
        {
            if (_isOracleFactory)
            {
                int index = cmd.Parameters.Add(new OracleParameter("o_cursor", OracleType.Cursor));
                cmd.Parameters[index].Direction = ParameterDirection.Output;
            }
            cmd.CommandTimeout = 0;
            DataSet ds = new DataSet();
            Instance.LoadDataSet(cmd, ds, "loaded");
            return ds;
        }

        protected DataSet GetDataSet(DbCommand cmd, DataSet ds, string tableName)
        {
            if (_isOracleFactory)
            {
                int index = cmd.Parameters.Add(new OracleParameter("o_cursor", OracleType.Cursor));
                cmd.Parameters[index].Direction = ParameterDirection.Output;
            }
            Instance.LoadDataSet(cmd, ds, tableName);
            return ds;
        }

        protected void AddOracleCursorParameter(DbCommand cmd, string paramName)
        {
            int index = cmd.Parameters.Add(new OracleParameter(paramName, OracleType.Cursor));
            cmd.Parameters[index].Direction = ParameterDirection.Output;
        }

        protected DbCommand GetStoredProcCommand(string command)
        {
            return Instance.GetStoredProcCommand(command);
        }

        protected DbCommand GetStoredProcCommand(string command, params object[] parameterValues)
        {
            return Instance.GetStoredProcCommand(command, parameterValues);
        }

        protected DbCommand GetSqlStringCommand(string query)
        {
            return Instance.GetSqlStringCommand(query);
        }

        public object GetParameterValue(DbCommand command, string name)
        {
            return Instance.GetParameterValue(command, name);
        }

        public void AddInParameter(DbCommand command, string name, DbType dbType)
        {
            Instance.AddInParameter(command, name, dbType);
        }

        internal void AddInParameter(DbCommand command, string name, DbType dbType, object value)
        {
            Instance.AddInParameter(command, name, dbType, value);
        }

        internal void AddInParameter(DbCommand command, string name, DbType dbType, string sourceColumn, DataRowVersion sourceVersion)
        {
            Instance.AddInParameter(command, name, dbType, sourceColumn, sourceVersion);
        }

        internal void AddOutParameter(DbCommand command, string name, DbType dbType, int size)
        {
            Instance.AddOutParameter(command, name, dbType, size);
        }

        internal int Execute(DbCommand cmd, DbParameter p)
        {
            cmd.Parameters.Add(p);
            return this.Instance.ExecuteNonQuery(cmd);
        }

        internal void AddParameter(DbCommand command, string name, DbType dbType, ParameterDirection direction, string sourceColumn, DataRowVersion sourceVersion, object value)
        {
            Instance.AddParameter(command, name, dbType, direction, sourceColumn, sourceVersion, value);
        }

        protected int Execute(DbCommand cmd)
        {
            return Instance.ExecuteNonQuery(cmd);
        }

        protected object ExecuteScalar(DbCommand cmd)
        {
            return Instance.ExecuteScalar(cmd);
        }

        internal object FindInCache(DbCommand cmd)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(cmd.CommandText);
            for (int i = 0; i < cmd.Parameters.Count; i++)
            {
                sb.Append(cmd.Parameters[i].Value.ToString());
            }
            return Cache[sb.ToString()];
        }

        internal void SaveInCache(DbCommand cmd, object ds, int duration)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(cmd.CommandText);
            for (int i = 0; i < cmd.Parameters.Count; i++)
            {
                if (cmd.Parameters[i].ParameterName != "o_cursor")
                {
                    sb.Append(cmd.Parameters[i].Value.ToString());
                }
            }
            Cache.Add(sb.ToString(), ds, CacheItemPriority.Normal, null, new AbsoluteTime(TimeSpan.FromMinutes(duration)));
        }

        public static void RemoveOfCache(string key)
        {
            CacheManager cache = CacheFactory.GetCacheManager();
            if (cache.Contains(key))
            {
                cache.Remove(key);
            }
        }
    }
}
