package mt;
/**
 *
 * <p>Title: mt包版本号</p>
 *
 * <p>Description: 当前版本2.0</p>
 *
 * <p>Copyright: Copyright (c) 2007 北京际峰天翔信息技术有限公司</p>
 *
 * <p>Company: 北京际峰天翔信息技术有限公司</p>
 *
 * @author not attributable
 * @version 2.0
 */
public class MtVersion {
    //当前版本号
    public static final String version = "2.0";
    /**
     * 校验其他mt包下的类的版本
     * @param vs String
     * @return boolean
     */
    public static boolean checkVersion(String vs){
        return vs.equalsIgnoreCase(version);
    }
}
