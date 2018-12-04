package mt.tools;

public class Transform {
  public String returnData;
  public Transform(String number) {
    try {
      String money = this.numberToMoney(number);
      char[] chars = this.moneyToChars(money);
      String[] moneyChars = this.uniteCharsAndMONEY(chars);
      StringBuffer sb = this.append(moneyChars);
      returnData = this.neaten(sb);
//      System.out.println(returnData);
    }
    catch (NumberFormatException nfe) {
//      System.out.println(nfe);
    }
    catch (Exception ne) {
//      System.out.println(ne);
    }

  }

  //用来输出的大写金额的字段
  private String dataMode = "";
  private static char[] MONEY = {
      '仟', '佰', '拾', '亿', '仟', '佰', '拾', '万', '仟',
      '佰', '拾', '元', '角', '分'};

  //验证获取的字符型的合法性
  public String numberToMoney(String number) {
    double money = Double.parseDouble(number);
    if (money < 0) {
    System.out.println("金额不能为负数!");
      dataMode = "负";
      number = number.substring(1);
    }
    boolean flag = true;
    int k = 0;
    for (int i = 0; i < number.length(); i++) {

      if ( (number.charAt(i) == '0') && flag) {
        k++;
      }
      if (number.charAt(i) != '0') {
        flag = false;
      }
    }
    number = number.substring(k, number.length());
    if (number.indexOf(".") == -1) {
      number = number + ".00";
    }
    if (number.endsWith(".")) {
      number = number + "00";
    }
    if (number.indexOf(".") == number.length() - 2) {
      number = number + "0";
    }
    return number;
  }

  //把数字型的数转换为汉字的
  public char[] moneyToChars(String money) {
    char[] char1 = null, chars = null;
    int index = 0;
    char1 = money.toCharArray();
    for (int i = 0; i < char1.length; i++) {
      if (char1[i] == '.') {
        index = i;
      }
    }
    //超过千亿就不能处理
    if (index > 12) {
      System.out.println("您输入的数范围太大！请重新输入！");

    }
    chars = new char[index + 3];
    for (int i = 0; i < index + 3; i++) {
      chars[i] = char1[i];
      //次循环即用来转换
      switch (chars[i]) {
        case '0':
          chars[i] = '零';
          break;
        case '1':
          chars[i] = '壹';
          break;
        case '2':
          chars[i] = '贰';
          break;
        case '3':
          chars[i] = '叁';
          break;
        case '4':
          chars[i] = '肆';
          break;
        case '5':
          chars[i] = '伍';
          break;
        case '6':
          chars[i] = '陆';
          break;
        case '7':
          chars[i] = '柒';
          break;
        case '8':
          chars[i] = '捌';
          break;
        case '9':
          chars[i] = '玖';
          break;
      }
    }
    return chars;
  }

  //加上千,百,十,亿,万，元,角,分等
  public String[] uniteCharsAndMONEY(char[] chars) {
    String[] moneyChars = new String[chars.length - 1];
    char[] tmp = new char[2];
    //处理小数点之前的部分
    for (int i = 0; i < moneyChars.length - 2; i++) {
      tmp[0] = chars[i];
      tmp[1] = MONEY[14 + i - moneyChars.length];
      if (tmp[0] == '零' && MONEY[14 + i - moneyChars.length] != '亿'
          && MONEY[14 + i - moneyChars.length] != '万'
          && MONEY[14 + i - moneyChars.length] != '元') {
        tmp[1] = ' ';
      }
      moneyChars[i] = new String(tmp).trim();
    }
    //处理小数点之后的部分
    for (int i = moneyChars.length - 2; i < moneyChars.length; i++) {

      tmp[0] = chars[i + 1];
      tmp[1] = MONEY[14 - moneyChars.length + i];
      if (tmp[0] == '零') {
        tmp[1] = ' ';
      }
      moneyChars[i] = new String(tmp).trim();
    }
    return moneyChars;
  }

  //由于加千,百,十,亿,万，元,角,分等字段时是分段加的，所以要拼装起来。
  public StringBuffer append(String[] moneyChars) {
    boolean flag = true;
    StringBuffer sb = new StringBuffer();
    for (int i = 0; i < moneyChars.length; i++) {
      if (!moneyChars[i].equals("零")) {
        sb.append(moneyChars[i]);
        flag = true;
      }
      if (moneyChars[i].equals("零") && flag) {
        sb.append(moneyChars[i]);
        flag = false;
      }
    }
    return sb;
  }

  //主要用来去除多余的“零”
  public String neaten(StringBuffer sb) {
    String money_cn = null;
    boolean flag = true;
    for (int i = 0; i < sb.toString().toCharArray().length - 1; i++) {
      if (sb.charAt(i) == '零' && sb.charAt(i + 1) == '零') {
        sb = sb.deleteCharAt(i);
      }
    }
    if (sb.charAt(sb.toString().toCharArray().length - 1) == '零') {
      sb = sb.deleteCharAt(sb.toString().toCharArray().length - 1);
    }
    for (int i = 0; i < sb.toString().toCharArray().length - 1; i++) {
      if (sb.charAt(i) == '零' && sb.charAt(i + 1) == '亿'
          || sb.charAt(i) == '零' && sb.charAt(i + 1) == '万'
          || sb.charAt(i) == '零' && sb.charAt(i + 1) == '元') {
        sb = sb.deleteCharAt(i);
      }
    }
    for (int i = 0; i < sb.toString().toCharArray().length - 1; i++) {
      if (sb.charAt(i) == '亿' && sb.charAt(i + 1) == '万') {
        sb = sb.deleteCharAt(i + 1);
      }
    }
    money_cn = new String(dataMode + sb);
    if (money_cn.endsWith("元")) {
      money_cn += "整";
    }
    return money_cn;
  }

  //main方法
  public static void main(String[] args) {
    String num = null;
    System.out.println("请您输入数字，注意格式的正确性！");
    java.io.BufferedReader in = new java.io.BufferedReader(
        new java.io.InputStreamReader(System.in));
    try {
      num = in.readLine();
    }
    catch (java.io.IOException e) {
//      System.out.println(e);
    }
    new Transform(num);
  }
}
