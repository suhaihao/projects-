package mt;
/**
 *
 * <p>Title: mt���汾��</p>
 *
 * <p>Description: ��ǰ�汾2.0</p>
 *
 * <p>Copyright: Copyright (c) 2007 �����ʷ�������Ϣ�������޹�˾</p>
 *
 * <p>Company: �����ʷ�������Ϣ�������޹�˾</p>
 *
 * @author not attributable
 * @version 2.0
 */
public class MtVersion {
    //��ǰ�汾��
    public static final String version = "2.0";
    /**
     * У������mt���µ���İ汾
     * @param vs String
     * @return boolean
     */
    public static boolean checkVersion(String vs){
        return vs.equalsIgnoreCase(version);
    }
}
