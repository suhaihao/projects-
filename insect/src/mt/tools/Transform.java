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

  //��������Ĵ�д�����ֶ�
  private String dataMode = "";
  private static char[] MONEY = {
      'Ǫ', '��', 'ʰ', '��', 'Ǫ', '��', 'ʰ', '��', 'Ǫ',
      '��', 'ʰ', 'Ԫ', '��', '��'};

  //��֤��ȡ���ַ��͵ĺϷ���
  public String numberToMoney(String number) {
    double money = Double.parseDouble(number);
    if (money < 0) {
    System.out.println("����Ϊ����!");
      dataMode = "��";
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

  //�������͵���ת��Ϊ���ֵ�
  public char[] moneyToChars(String money) {
    char[] char1 = null, chars = null;
    int index = 0;
    char1 = money.toCharArray();
    for (int i = 0; i < char1.length; i++) {
      if (char1[i] == '.') {
        index = i;
      }
    }
    //����ǧ�ھͲ��ܴ���
    if (index > 12) {
      System.out.println("�����������Χ̫�����������룡");

    }
    chars = new char[index + 3];
    for (int i = 0; i < index + 3; i++) {
      chars[i] = char1[i];
      //��ѭ��������ת��
      switch (chars[i]) {
        case '0':
          chars[i] = '��';
          break;
        case '1':
          chars[i] = 'Ҽ';
          break;
        case '2':
          chars[i] = '��';
          break;
        case '3':
          chars[i] = '��';
          break;
        case '4':
          chars[i] = '��';
          break;
        case '5':
          chars[i] = '��';
          break;
        case '6':
          chars[i] = '½';
          break;
        case '7':
          chars[i] = '��';
          break;
        case '8':
          chars[i] = '��';
          break;
        case '9':
          chars[i] = '��';
          break;
      }
    }
    return chars;
  }

  //����ǧ,��,ʮ,��,��Ԫ,��,�ֵ�
  public String[] uniteCharsAndMONEY(char[] chars) {
    String[] moneyChars = new String[chars.length - 1];
    char[] tmp = new char[2];
    //����С����֮ǰ�Ĳ���
    for (int i = 0; i < moneyChars.length - 2; i++) {
      tmp[0] = chars[i];
      tmp[1] = MONEY[14 + i - moneyChars.length];
      if (tmp[0] == '��' && MONEY[14 + i - moneyChars.length] != '��'
          && MONEY[14 + i - moneyChars.length] != '��'
          && MONEY[14 + i - moneyChars.length] != 'Ԫ') {
        tmp[1] = ' ';
      }
      moneyChars[i] = new String(tmp).trim();
    }
    //����С����֮��Ĳ���
    for (int i = moneyChars.length - 2; i < moneyChars.length; i++) {

      tmp[0] = chars[i + 1];
      tmp[1] = MONEY[14 - moneyChars.length + i];
      if (tmp[0] == '��') {
        tmp[1] = ' ';
      }
      moneyChars[i] = new String(tmp).trim();
    }
    return moneyChars;
  }

  //���ڼ�ǧ,��,ʮ,��,��Ԫ,��,�ֵ��ֶ�ʱ�Ƿֶμӵģ�����Ҫƴװ������
  public StringBuffer append(String[] moneyChars) {
    boolean flag = true;
    StringBuffer sb = new StringBuffer();
    for (int i = 0; i < moneyChars.length; i++) {
      if (!moneyChars[i].equals("��")) {
        sb.append(moneyChars[i]);
        flag = true;
      }
      if (moneyChars[i].equals("��") && flag) {
        sb.append(moneyChars[i]);
        flag = false;
      }
    }
    return sb;
  }

  //��Ҫ����ȥ������ġ��㡱
  public String neaten(StringBuffer sb) {
    String money_cn = null;
    boolean flag = true;
    for (int i = 0; i < sb.toString().toCharArray().length - 1; i++) {
      if (sb.charAt(i) == '��' && sb.charAt(i + 1) == '��') {
        sb = sb.deleteCharAt(i);
      }
    }
    if (sb.charAt(sb.toString().toCharArray().length - 1) == '��') {
      sb = sb.deleteCharAt(sb.toString().toCharArray().length - 1);
    }
    for (int i = 0; i < sb.toString().toCharArray().length - 1; i++) {
      if (sb.charAt(i) == '��' && sb.charAt(i + 1) == '��'
          || sb.charAt(i) == '��' && sb.charAt(i + 1) == '��'
          || sb.charAt(i) == '��' && sb.charAt(i + 1) == 'Ԫ') {
        sb = sb.deleteCharAt(i);
      }
    }
    for (int i = 0; i < sb.toString().toCharArray().length - 1; i++) {
      if (sb.charAt(i) == '��' && sb.charAt(i + 1) == '��') {
        sb = sb.deleteCharAt(i + 1);
      }
    }
    money_cn = new String(dataMode + sb);
    if (money_cn.endsWith("Ԫ")) {
      money_cn += "��";
    }
    return money_cn;
  }

  //main����
  public static void main(String[] args) {
    String num = null;
    System.out.println("�����������֣�ע���ʽ����ȷ�ԣ�");
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
