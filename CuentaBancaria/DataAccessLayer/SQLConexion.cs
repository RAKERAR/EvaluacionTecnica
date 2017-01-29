using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.Common;


namespace DataAccessLayer
{

    internal sealed class StoreProcedure : DataAccesComponent
    {
        /// <summary>
        /// 
        /// </summary>
        private readonly DbCommand command;

        /// <summary>
        /// 
        /// </summary>
        private StringBuilder sb;

        /// <summary>
        /// 
        /// </summary>
        private readonly string _name;

        /// <summary>
        /// 
        /// </summary>
        private readonly int _duration;

        /// <summary>
        /// 
        /// </summary>
        private readonly string _key;

        /// <summary>
        /// Gets the command <see cref="System.Data.Common.DbCommand"/>.
        /// </summary>
        /// <value>The command <see cref="System.Data.Common.DbCommand"/>.</value>
        public DbCommand Command
        {
            get { return (command); }
        }

        /// <summary>
        /// Gets the name <see cref="System.String"/>.
        /// </summary>
        /// <value>The name <see cref="System.String"/>.</value>
        public string Name
        {
            get { return _name; }
        }

        public string CacheKey
        {
            get { return _key; }
        }

        /// <summary>
        /// Gets the duration <see cref="System.Int32"/>.
        /// </summary>
        /// <value>The duration <see cref="System.Int32"/>.</value>
        public int Duration
        {
            get { return _duration; }
        }

        /// <summary>
        /// Initializes a new instance of the <see cref="StoreProcedure"/> class.
        /// </summary>
        /// <param name="name">The name  <see cref="System.String"/>.</param>
        internal StoreProcedure(string name)
        {
            _name = name;
            command = base.GetStoredProcCommand(name);
        }

        /// <summary>
        /// Initializes a new instance of the <see cref="StoreProcedure"/> class.
        /// </summary>
        /// <param name="name">The name  <see cref="System.String"/>.</param>
        /// <param name="duration">The cache duration in seconds.</param>
        internal StoreProcedure(string name, int duration)
        {
            _name = name;
            command = base.GetStoredProcCommand(name);
            _duration = duration;
        }

        /// <summary>
        /// Initializes a new instance of the <see cref="StoreProcedure"/> class.
        /// </summary>
        /// <param name="name">The name  <see cref="System.String"/>.</param>
        /// <param name="providerName">Name of the provider.</param>
        internal StoreProcedure(string name, string providerName)
            : base(providerName)
        {
            _name = name;
            command = base.GetStoredProcCommand(name);
        }

        /// <summary>
        /// Initializes a new instance of the <see cref="StoreProcedure"/> class.
        /// </summary>
        /// <param name="name">The name  <see cref="System.String"/>.</param>
        /// <param name="key">The key  <see cref="System.String"/>.</param>
        /// <param name="duration">The cache duration in seconds.</param>
        internal StoreProcedure(string name, string key, int duration)
        {
            _name = name;
            command = base.GetStoredProcCommand(name);
            _key = key;
            _duration = duration;
        }


        /// <summary>
        /// Initializes a new instance of the <see cref="StoreProcedure"/> class.
        /// </summary>
        /// <param name="name">The name  <see cref="System.String"/>.</param>
        /// <param name="duration">The cache duration in seconds.</param>
        /// <param name="providerName">Name of the provider.</param>
        internal StoreProcedure(string name, int duration, string providerName)
            : base(providerName)
        {
            _name = name;
            command = base.GetStoredProcCommand(name);
            _duration = duration;
        }

        /// <summary>
        /// Initializes a new instance of the <see cref="StoreProcedure"/> class.
        /// </summary>
        /// <param name="name">The name  <see cref="System.String"/>.</param>
        /// <param name="key">The key  <see cref="System.String"/>.</param>
        /// <param name="duration">The duration  <see cref="System.Int32"/>.</param>
        /// <param name="providerName">The cache duration in seconds.</param>
        public StoreProcedure(string name, string key, int duration, string providerName)
            : base(providerName)
        {
            _name = name;
            command = base.GetStoredProcCommand(name);
            _key = key;
            _duration = duration;
        }

        /// <summary>
        /// Executes this instance.
        /// </summary>
        /// <returns></returns>
        internal int Execute()
        {
            return base.Execute(command);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="p"></param>
        /// <returns></returns>
        internal int Execute(DbParameter p)
        {
            return base.Execute(this.command, p);
        }

        /// <summary>
        /// Executes the scalar.
        /// </summary>
        /// <returns>
        /// return System.Object <see cref="System.Object"/>.
        /// </returns>
        internal object ExecuteScalar()
        {
            return base.ExecuteScalar(command);
        }

        /// <summary>
        /// Gets the data set.
        /// </summary>
        /// <returns>
        /// return System.Data.DataSet <see cref="System.Data.DataSet"/>.
        /// </returns>
        internal DataSet GetDataSet()
        {
            if (Duration < 1)
            {
                return GetDataSet(command);
            }
            return GetCacheDataSet(string.IsNullOrEmpty(CacheKey) ? CreateCacheKey() : CacheKey, command, Duration);
        }

        /// <summary>
        /// Loads the specified ds.
        /// </summary>
        /// <param name="ds">The ds  <see cref="System.Data.DataSet"/>.</param>
        /// <param name="tableName">Name of the table.</param>
        internal void Load(DataSet ds, string tableName)
        {
            GetDataSet(command, ds, tableName);
        }

        /// <summary>
        /// Adds the oracle cursor parameter.
        /// </summary>
        /// <param name="name">The name  <see cref="System.String"/>.</param>
        public void AddOracleCursorParameter(string name)
        {
            base.AddOracleCursorParameter(command, name);
        }

        /// <summary>
        /// Creates the cache key.
        /// </summary>
        /// <returns>
        /// return System.String <see cref="System.String"/>.
        /// </returns>
        private string CreateCacheKey()
        {
            sb = new StringBuilder();
            sb.Append(Name);
            for (int i = 0; i < command.Parameters.Count; i++)
            {
                sb.Append(":" + command.Parameters[i].Value);
            }
            return sb.ToString();
        }

        /// <summary>
        /// Adds the in parameter.
        /// </summary>
        /// <param name="name">The name  <see cref="System.String"/>.</param>
        /// <param name="dbType">Type of the db.</param>
        internal void AddInParameter(string name, DbType dbType)
        {
            base.AddInParameter(command, name, dbType);
        }

        /// <summary>
        /// Adds the in parameter.
        /// </summary>
        /// <param name="name">The name  <see cref="System.String"/>.</param>
        /// <param name="dbType">Type of the db.</param>
        /// <param name="value">The value  <see cref="System.Object"/>.</param>
        internal void AddInParameter(string name, DbType dbType, object value)
        {
            base.AddInParameter(command, name, dbType, value);
        }

        /// <summary>
        /// Adds the in parameter.
        /// </summary>
        /// <param name="name">The name  <see cref="System.String"/>.</param>
        /// <param name="dbType">Type of the db.</param>
        /// <param name="sourceColumn">The source column  <see cref="System.String"/>.</param>
        /// <param name="sourceVersion">The source version  <see cref="System.Data.DataRowVersion"/>.</param>
        internal void AddInParameter(string name, DbType dbType, string sourceColumn, DataRowVersion sourceVersion)
        {
            base.AddInParameter(command, name, dbType, sourceColumn, sourceVersion);
        }

        /// <summary>
        /// Adds the out parameter.
        /// </summary>
        /// <param name="name">The name  <see cref="System.String"/>.</param>
        /// <param name="dbType">Type of the db.</param>
        /// <param name="size">The size  <see cref="System.Int32"/>.</param>
        internal void AddOutParameter(string name, DbType dbType, int size)
        {
            base.AddOutParameter(command, name, dbType, size);
        }

        /// <summary>
        /// Adds the parameter.
        /// </summary>
        /// <param name="name">The name  <see cref="System.String"/>.</param>
        /// <param name="dbType">Type of the db.</param>
        /// <param name="direction">The direction  <see cref="System.Data.ParameterDirection"/>.</param>
        /// <param name="sourceColumn">The source column  <see cref="System.String"/>.</param>
        /// <param name="sourceVersion">The source version  <see cref="System.Data.DataRowVersion"/>.</param>
        /// <param name="value">The value  <see cref="System.Object"/>.</param>
        internal void AddParameter(string name, DbType dbType, ParameterDirection direction, string sourceColumn, DataRowVersion sourceVersion, object value)
        {
            base.AddParameter(command, name, dbType, direction, sourceColumn, sourceVersion, value);
        }

        /// <summary>
        /// Gets the parameter value.
        /// </summary>
        /// <param name="name">The name  <see cref="System.String"/>.</param>
        /// <returns>
        /// return System.Object <see cref="System.Object"/>.
        /// </returns>
        public object GetParameterValue(string name)
        {
            return base.GetParameterValue(command, name);
        }
    }
}
