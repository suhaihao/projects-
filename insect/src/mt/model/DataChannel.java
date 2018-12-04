package mt.model;

import mt.controller.FormData;
import mt.database.Pjdo;
import mt.database.extend.ExecuteConnection;
import mt.tools.CustString;

public class DataChannel {
    public final int UPDATESUCESS = 0;
    public final int UPDATEFAILURE = -1;
    public ExecuteConnection ec;
    public Pjdo pjdo;
    public String[] attachCol;
    public String[] attachVal;
    private String querySqlSelect = "";
    public String querySqlWhere = "";
    private String querySqlOrder = "";
    public String sqlselect = "";
    public String sqlwhole = "";
    public String sqlorder = "";
    public DataChannel() {
        ec = new ExecuteConnection();
        pjdo = new Pjdo(ec);
    }

    public DataChannel(ExecuteConnection ec) {
        this.ec = ec;
        pjdo = new Pjdo(this.ec);
    }


    public String getQuerySql(FormData fd, char charForward) {
        String sql = "", temp = "";
        String[] tempTableName = new String[1];
        DataTable[] dt;
        String[] col = new String[1];
        String[] val = new String[1];

        tempTableName = (String[]) fd.dataObject.tableName.toArray(
                tempTableName);
        for (int i = 0; i < tempTableName.length; i++) { //有几张表
            dt = (DataTable[]) fd.dataObject.tableDataColl.get(tempTableName[i]);

            for (int i1 = 0; i1 < dt.length; i1++) { //每张表有几条记录
                col = new mt.tools.CustArray().analyseArray((String[]) dt[i1].
                        col.
                        toArray(col), dt.length, i1);
                val = new mt.tools.CustArray().analyseArray((String[]) dt[i1].
                        val.
                        toArray(val), dt.length, i1);
                temp = createSql(col, val, charForward, tempTableName[i]);
                sql = (new CustString()).joinUseAnd(sql, temp);
            }
            sqlselect = sql;
            if (querySqlOrder.trim().length() > 0) {
                sqlorder = sqlorder.trim().length() == 0 ? querySqlOrder :
                           querySqlOrder + "、" + sqlorder;
            }
            sql = sql + sqlorder;
        }
        sqlwhole = sql;
        return sql;
    }

    public int dataInDataBase(FormData fd, char charForward) {
        int updateRow = this.UPDATESUCESS;
        String[] tempTableName = new String[0];
        DataTable[] dt;
        String[] col = new String[1];
        String[] val = new String[1];

        tempTableName = (String[]) fd.dataObject.tableName.toArray(
                tempTableName);
        for (int i = 0; i < tempTableName.length; i++) { //有几张表
            if (updateRow == -1) {
                break;
            }
            dt = (DataTable[]) fd.dataObject.tableDataColl.get(tempTableName[i]);

            for (int i1 = 0; i1 < dt.length; i1++) { //每张表有几条记录
                col = (String[]) dt[i1].col.toArray(col);
                val = (String[]) dt[i1].val.toArray(val);

                sqlselect = createSql(col, val, charForward, tempTableName[i]);
                if (querySqlOrder.trim().length() > 0) {
                    sqlorder = sqlorder.trim().length() == 0 ? querySqlOrder :
                               querySqlOrder + "、" + sqlorder;
                }

                sqlwhole = sqlorder.trim().length() > 0 ?
                           sqlselect + " order by " + sqlorder : sqlselect;
//                System.out.println(sqlwhole);
                try {
                    switch (charForward) {
                    case 'I':
                    case 'U':
                    case 'D':
                        updateRow = pjdo.execute(sqlwhole);
                        break;
                    case 'Q':
                        updateRow = pjdo.pageQuery(sqlwhole);
                        break;
                    }
                } catch (Exception e) {
                    updateRow = this.UPDATEFAILURE;
                    e.printStackTrace();
                }
            }
        }
        return updateRow;
    }


    public void executeDiv(String sql) {
        pjdo.pageQuery(sql);
    }

    private String createSql(String[] col, String[] val, char charForward,
                             String tableName) {
        String cols = "";
        String vals = "";
        String sql = "";
        String updateSql = "";
        String whereSql = "";
        String qSql = "";
        CustString cs = new CustString();
        for (int i2 = 0; i2 < col.length; i2++) { //每条记录有几字段
            cols = cs.analyseSqlInsert(cols, cs.splitColumn(col[i2], 1));
            vals = cs.analyseSqlInsert(vals, analyseSyntax(col[i2], val[i2]));
            updateSql = cs.analyseSqlUpdate(updateSql,
                                            cs.splitColumn(col[i2], 1),
                                            analyseSyntax(col[i2], val[i2]));

            if (cs.splitColumn(col[i2], 3).toUpperCase().equals("P")) {
                whereSql = cs.analyseSqlWhere(whereSql,
                                              cs.splitColumn(col[i2], 1),
                                              analyseSyntax(col[i2], val[i2]),
                                              "=");
            }
            qSql = cs.analyseSqlWhere(qSql, cs.splitColumn(col[i2], 1),
                                      analyseSyntax(col[i2], val[i2]),
                                      cs.splitColumn(col[i2], 3));
            if (i2 == 0) { //处理附加数据    // attachData
                if (attachCol == null) {} else {
                    for (int i = 0; i < attachCol.length; i++) {

                        if (!((String[]) attachCol[i].split(":"))[0].
                            toUpperCase().equals(tableName.toUpperCase())) {
                            continue;
                        }

                        cols = cs.analyseSqlInsert(cols,
                                cs.splitColumn(attachCol[i], 1));
                        vals = cs.analyseSqlInsert(vals,
                                analyseSyntax(attachCol[i], attachVal[i]));

                        updateSql = cs.analyseSqlUpdate(updateSql,
                                cs.splitColumn(attachCol[i], 1),
                                analyseSyntax(attachCol[i], attachVal[i]));

                        if (cs.splitColumn(attachCol[i], 3).toUpperCase().
                            equals("P")) {
                            whereSql = cs.analyseSqlWhere(whereSql,
                                    cs.splitColumn(attachCol[i], 1),
                                    analyseSyntax(attachCol[i],
                                                  attachVal[i]), "=");
                        }
                    }
                }
            }
        }
        switch (charForward) {
        case 'I':
            sql = " insert into " + tableName + "(\n";
            sql += cols + " \n";
            sql += ") \n";
            sql += "values( \n";
            sql += vals + " \n";
            sql += ")";
            break;
        case 'U':
            sql = " update " + tableName + "\n";
            sql += " set " + updateSql + "\n";
            if (whereSql.trim().length() > 0) {
                sql += " where " + whereSql;
            }
            break;
        case 'D':
            sql = " delete from " + tableName + " \n";
            if (whereSql.trim().length() > 0) {
                sql += " where " + whereSql;
            }
            break;
        case 'Q':
            String swhere = "";
            String sselect = "";

            sselect = " select * from " + tableName + " \n"; //标准
            if (querySqlSelect.trim().length() > 0) { //自定义
                sselect = querySqlSelect;
            }
            if (qSql.trim().length() > 0) {
                swhere = qSql;
            }

            if (swhere == null) {
                swhere = "";
            }

            if (querySqlWhere.trim().length() > 0) {
                swhere = swhere.trim().length() == 0 ? querySqlWhere :
                         querySqlWhere + " and " + swhere;
            }

            sql = sselect;
            sql += swhere.trim().length() == 0 ? " " : " where " + swhere;
            break;
        }
        return sql;
    }

    private String analyseSyntax(String col, String val) {
String returnString = "";
        CustString cs = new CustString();

        if (val == null || val.equals("")) {
            switch (cs.splitColumn(col, 3).toUpperCase().charAt(0)) {
            case 'P':
                returnString = "'" +
                               new mt.database.analyseTable(cs.
                        splitColumn(col, 0)).getSequence() + "'";
                return returnString;
            default:
                return "";
            }
        }
        if (cs.splitColumn(col, 2).toUpperCase().equals("STR")) {
            returnString = "'" + val + "'";
        }
        if (cs.splitColumn(col, 2).toUpperCase().equals("LON")) {
            returnString += val;
        }
        if (cs.splitColumn(col, 2).toUpperCase().equals("DOU")) {
            returnString += val;
        }
        if (cs.splitColumn(col, 2).toUpperCase().equals("DAT")) {
            returnString += "to_date('" + val + "','yyyy-mm-dd hh:mi:ss')";
        }
        if (cs.splitColumn(col, 2).toUpperCase().equals("DAY")) {
            returnString += "to_date('" + val + "','yyyy-mm-dd')";
        }
        if (cs.splitColumn(col, 2).toUpperCase().equals("MD5")) {
            returnString += "'" + cs.Md5(val) + "'";
        }
        return returnString;
    }

    public void setQuerySqlSelect(String qSql) {
        querySqlSelect = qSql;
    }

    public void setQuerySqlWhere(String qSql) {
        querySqlWhere = qSql;
    }

    public void setQuerySqlOrder(String qSql) {
        querySqlOrder = qSql;
    }

    public void close() {
        pjdo.close();
        ec.close();
    }
}
