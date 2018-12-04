package mt.database;

import java.io.*;
import java.util.*;

/**
 * <p>Title:��ȡϵͳ���ݿ����� </p> *
 * <p>Description: ϵͳ���ݿ����÷�����config.properties�ļ���
 * ��������У�driver
 *           url
 *           user
 *           password
 *           dataSource *
 * </p>
 * <p>Copyright: Copyright (c) 2007 �����ʷ�������Ϣ�������޹�˾</p>
 *
 * <p>Company: �����ʷ�������Ϣ�������޹�˾</p>
 *
 * @author not attributable
 * @version 2.0
 */

class Configuration {
    static Properties props;
    public Configuration() {
        if (props != null) {
            System.gc();
            return;
        }
        try {
//            FileInputStream input = new FileInputStream("config.properties");
            //InputStream input = getClass().getResourceAsStream("..\\..\\com\\config.properties");
        	InputStream input = getClass().getClassLoader().getResourceAsStream("com/config.properties");
            props = new Properties();
            props.load(input);
            input.close();
        } catch (Exception e) {
            new mt.tools.customException(e, this.toString());
        }
    }
    public String get(String property){
        return props.getProperty(property);
    }
    public static void main(String[] argus){
        Configuration config = new Configuration();
    }
}
