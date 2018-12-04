package mt.project.share;

import java.io.Serializable;

public class User implements Serializable  {
  public String userName;//用户名
  public String userPassword;//密码
  public String userId;//用户ID
  public String loginId;//用户登陆名
  public String userUnit;//用户部门编码
  public String userUnitServer;//用户部门统计字头
  public String userDepartmentServer;//用户部门前三位
  public String pbsm;//系统预设，办税码前四位
  public String userDepartmentName;//用户部门名称
  public String userSearchArea;//用户数据查询范围
  public String userSearchAreaBm;//用户数据查询范围编码
  public String userSearchAreaTjzt;//用户数据查询范围统计字头
  public String sfcb;//是否在当前任务中显示催报信息
  public String sfcj;//是否在当前任务中显示催缴信息
  public String sfspsw;//是否在当前任务中显示审批事务
  public String sfxs;
  public String sphsfs;//系统预设，征管数据按完税证或汇总缴款书统计
  public String userZw;//用户职务
  public String userZwmc;//用户职务名称
  public String userBh;//用户编号
  public String userDepartmentNature;//部门性质
  public String userPzdw;//票证单位dpz00
}
