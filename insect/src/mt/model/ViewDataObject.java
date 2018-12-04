package mt.model;

public class ViewDataObject {
  public DataObject dao;
  public ViewDataObject(DataObject dao) {
    this.dao=dao;
  }

  public  void view() {
    String[] tableNames=new String[1];
    String[] tableRows=new String[1];
    tableNames=(String[])dao.tableName.toArray(tableNames);
    tableRows=(String[])dao.tableRows.toArray(tableRows);
//    System.out.println("表名-------------------");

    DataTable[] dt=new DataTable[1];
    String[] col=new String[1];
    String[] val=new String[1];
    for (int i=0; i <tableNames.length; i++){
//        System.out.print(tableNames[i]+"    ");
//        System.out.println("记录长度："+tableRows[i]);
        try {
            dt = (DataTable[]) dao.tableDataColl.get(tableNames[i]);
        }catch(Exception e){
            break;
        }
        for (int i1=0;i1 < dt.length;i1++){
             col=(String[])dt[i1].col.toArray(col)  ;
             val=(String[])dt[i1].val.toArray(val)  ;
//             System.out.println("No:" + i1 );
             for (int i2=0;i2 <col.length;i2++){
//                 System.out.print(col[i2]+"   ");
//                 System.out.println(val[i2]+"   ");
             }
       }

    }
  }
}
