<%@ page language="java" pageEncoding="GBK"%>
    <div id="footer">
        <div class="section">
        	<p class="copyright tc"><span>����ֲ�ﱣ��վ��Ȩ����</span></p>
            <p class="support tc">
                <span>�й�ũҵ��ѧ����֧��</span>
                <span><a href="#">�����ʷ�������Ϣ�������޹�˾</a>����<span>
            </p>
        </div>
    </div>
</div>
<!-- end container -->
<script type="text/javascript">
// ҳ����ؾ�ִ�еĴ��롣�ŵ�ҳ��ĵײ���ÿ��ҳ�涼��ִ��
/*$("input[datatype='int']").each(function(){
	$(this).on("keyup blur",function(){
		var val = $(this).val();
		var cs = val.replace(/[^0-9]/g, '');
		$(this).val(cs);
	});
});*/
// ����ֻ����������
$("body").delegate("input[datatype='int']", "keyup blur", function() {
	var val = $(this).val();
	var cs = val.replace(/[^0-9]/g, '');
	$(this).val(cs);
});
</script>
</body>
</html>
