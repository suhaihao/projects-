<%@ page language="java" pageEncoding="GBK"%>
    <div id="footer">
        <div class="section">
        	<p class="copyright tc"><span>北京植物保护站版权所有</span></p>
            <p class="support tc">
                <span>中国农业大学技术支撑</span>
                <span><a href="#">北京际峰天翔信息技术有限公司</a>开发<span>
            </p>
        </div>
    </div>
</div>
<!-- end container -->
<script type="text/javascript">
// 页面加载就执行的代码。放到页面的底部，每个页面都会执行
/*$("input[datatype='int']").each(function(){
	$(this).on("keyup blur",function(){
		var val = $(this).val();
		var cs = val.replace(/[^0-9]/g, '');
		$(this).val(cs);
	});
});*/
// 限制只能输入数字
$("body").delegate("input[datatype='int']", "keyup blur", function() {
	var val = $(this).val();
	var cs = val.replace(/[^0-9]/g, '');
	$(this).val(cs);
});
</script>
</body>
</html>
