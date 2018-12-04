package mt.database;

import java.io.*;
import java.util.*;

/**
 * <p>Title:读取系统数据库配置 </p> *
 * <p>Description: 系统数据库配置放置在config.properties文件中
 * 具体的项有：driver
 *           url
 *           user
 *           password
 *           dataSource *
 * </p>
 * <p>Copyright: Copyright (c) 2007 北京际峰天翔信息技术有限公司</p>
 *
 * <p>Company: 北京际峰天翔信息技术有限公司</p>
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
