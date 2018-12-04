package mt.tools;
/**
 *
 * <p>Title:用于合并数组等 </p>
 *
 * <p>Description: </p>
 *
 * <p>Copyright: Copyright (c) 2005</p>
 *
 * <p>Company: </p>
 *
 * @author not attributable
 * @version 1.0
 */
public class CustArray {
  public CustArray() {
  }

  public byte[] arrayAdd(byte[] array1,byte[] array2){
       int allLength;
//       int array1length;
       allLength=array1.length +array2.length;
       byte[] returnByte=new byte[allLength];
       for (int i=0;i < array1.length; i++){
               returnByte[i]=array1[i];
       }
       for (int i=0;i < array2.length; i++){
               returnByte[array1.length + i ]=array2[i];
       }
  return    returnByte;
  }

  public String[] analyseArray(String str[],int intLength,int xh){
//     int i= str.length / intLength;
//     int i2=0;
//     String temp[]=new String[i];
//     for (int i1=0;i1 < str.length; i1++){
//         if  (i1 % intLength==xh){
//             temp[i2]= str[i1];
//             i2++;
//         }
//     }
     return str;
 }

 public int indexOf(byte[] array1,byte[] array2,int startpos){
     int pos=-1;
     int state=0;
    b1: for (int i1=startpos;i1 < array1.length; i1++){
      b2:for (int i2=0;i2 < array2.length; i2++){
           if ( array1[i1] !=array2[i2]){
              state=0;
              break b2;
           }else{
             if (state==0) { pos=i1;  }
             state+=1;
             if (state==array2.length)  {
                 break b1;
             }
           }
       }
     }
    return pos;
}

public int indexOf(byte[] array1,byte[] array2){
  return  indexOf(array1,array2,0);
}

 public byte[] substr(byte[] array1,int startIndex,int endIndex)
 {    byte[] returnArray=new byte[endIndex - startIndex];
      int ireturn=0;
      for (int i=startIndex;i < endIndex; i++){
          returnArray[ireturn]=array1[i];
             ++ireturn;
      }
      return returnArray;
 }

// public String[] analyseArray(String str[],int xh){
//   int i= str.length / intLength;
//   int i2=0;
//   String temp[]=new String[i];
//   for (int i1=0;i1 < str.length; i1++){
//       if  (i1 % intLength==xh){
//           temp[i2]= str[i1];
//           i2++;
//       }
//   }
//   return temp;
//}


}
