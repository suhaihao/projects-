package mt.database;

/**
 * <p>Title: 基本数据库连接</p>
 * <p>Description: 具体有三种连接方式
 * </p>
 * <p>Copyright: Copyright (c) 2007 北京际峰天翔信息技术有限公司</p>
 *
 * <p>Company: 北京际峰天翔信息技术有限公司</p>
 *
 * @author not attributable
 * @version 2.0
 */
import java.sql.*;
import javax.naming.*;
import javax.sql.*;


public class DbConnection {
    public Connection con;
    public static final String JDBC_CONNECT_MODE = "1";
    public static final String NO_AUTO_COMMIT = "1";
    public static final String DATASOURCE_CONNECT_MODE = "2";
    public static final String AUTO_COMMIT = "0";
    public static final String QUERY_JDBC_CONNECT_MODE = "3";
    public DbConnection() {
    }

    public DbConnection(String connectMode, String commitMode) {//固定应用
        if (connectMode.equals(JDBC_CONNECT_MODE)) { //jdbc连接
            setConnectJdbc(0);
        } else if (connectMode.equals(QUERY_JDBC_CONNECT_MODE)) { //queryjdbc连接
            setConnectJdbc(1);
        } else if (connectMode.equals(DATASOURCE_CONNECT_MODE)) { //datasource连接
            setConnectDataSource();
        }
        if (commitMode.equals(NO_AUTO_COMMIT)) { //提交模式
            setNoCommit();
        }
    }
    private void setConnectJdbc(int urlType) {
        Configuration config = new Configuration();
        try {
            Class.forName(config.get("classForName"));
            if(con!=null){
                rollClose();
            }
            switch (urlType) {
            case 0:
                con = DriverManager.getConnection(config.get("url"),
                                                  config.get("user"),
                                                  config.get("password"));
                break;
            case 1:
                con = DriverManager.getConnection(config.get("queryUrl"),
                                                  config.get("user"),
                                                  config.get("password"));
                break;
            }

        } catch (ClassNotFoundException e) {
            new mt.tools.customException(e, this.toString());
        } catch (SQLException e1) {
            new mt.tools.customException(e1, this.toString());
        } catch (Exception e2) {
            new mt.tools.customException(e2, this.toString());
        }
    }
    private void setConnectDataSource() {
        try {
            Configuration config = new Configuration();
            Context ctx = new InitialContext();
            DataSource ds = (DataSource) ctx.lookup(config.get("datasource"));
            if(con!=null){
                rollClose();
            }
            con = ds.getConnection();
        } catch (Exception e3) {
            new mt.tools.customException(e3, this.toString());
        }
    }

    public void setConnectDataSource(String datasource) {
        try {
            Configuration config = new Configuration();
            Context ctx = new InitialContext();
            DataSource ds = (DataSource) ctx.lookup(config.get(datasource));
            if(con!=null){
                rollClose();
            }
            con = ds.getConnection();
        } catch (Exception e3) {
            new mt.tools.customException(e3, this.toString());
        }
    }
    public void setNoCommit() {
        try {
            con.setAutoCommit(false);
        } catch (SQLException e11) {
            new mt.tools.customException(e11, this.toString());
        }
    }
    public void setConnectJdbc(String url) {
        Configuration config = new Configuration();
        try {
            Class.forName(config.get("classForName"));
            if(con!=null){
                rollClose();
            }
            con = DriverManager.getConnection(url, config.get("user"),
                                              config.get("password"));
        } catch (ClassNotFoundException e) {
            new mt.tools.customException(e, this.toString());
        } catch (SQLException e1) {
            new mt.tools.customException(e1, this.toString());
        } catch (Exception e2) {
            new mt.tools.customException(e2, this.toString());
        }
    }

    public void setConnectJdbc(String user,String password) {
        Configuration config = new Configuration();
        try {
            Class.forName(config.get("classForName"));
            if(con!=null){
                rollClose();
            }
            con = DriverManager.getConnection(config.get("url"),user,
                                              password);
        } catch (ClassNotFoundException e) {
            new mt.tools.customException(e, this.toString());
        } catch (SQLException e1) {
            new mt.tools.customException(e1, this.toString());
        } catch (Exception e2) {
            new mt.tools.customException(e2, this.toString());
        }
    }
    public void setConnectJdbc(String url, String user, String password) {
        Configuration config = new Configuration();
        try {
            Class.forName(config.get("classForName"));
            if(con!=null){
                rollClose();
            }
            con = DriverManager.getConnection(url, user, password);

        } catch (ClassNotFoundException e) {
            new mt.tools.customException(e, this.toString());
        } catch (SQLException e1) {
            new mt.tools.customException(e1, this.toString());
        } catch (Exception e2) {
            new mt.tools.customException(e2, this.toString());
        }
    }
    public void close() {
        try {
            con.close();
        } catch (SQLException e4) {
            new mt.tools.customException(e4, this.toString());
        } finally {
            try {
                con.close();
            } catch (SQLException e44) {
                new mt.tools.customException(e44, this.toString());
            }
        }
    }
    public void rollClose() {
        try {
            con.rollback();
            close();
        } catch (SQLException e) {
            new mt.tools.customException(e, this.toString());
        }
    }
    public void rollback() {
        try {
            con.rollback();
        } catch (SQLException e) {
            new mt.tools.customException(e, this.toString());
        }
    }
    public void commitClose() {
        try {
            con.commit();
            close();
        } catch (SQLException e) {
            new mt.tools.customException(e, this.toString());
        }
    }
    public void commit() {
        try {
            con.commit();
        } catch (SQLException e) {
            new mt.tools.customException(e, this.toString());
        }
    }
}
