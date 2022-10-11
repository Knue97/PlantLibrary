<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style>
button {
  display: block;
  float: right;
  line-height: 24pt;
  padding: 0 20px;
  border: none;
  background: #fff;
  color: #2e8b57;
  font-weight: bold;
  letter-spacing: 2px;
  transition: .2s all ease-in-out;
  border-bottom: 2px solid transparent;
  outline: none; }

</style>
<script>
function onMouseEnter() {
		if ($(".box-header img").attr('class') == 'writeno')

			$(".box-header img").attr("src", $(".box-header img").attr("src").replace("write_empty", "write_full"));
		else
			$(".box-header img").attr("src", $(".box-header img").attr("src").replace("write_full", "write_empty"));
		
	}

	function onMouseLeave() {
		if ($(".box-header img").attr('class') == 'writeno')
			
			$(".box-header img").attr("src", $(".box-header img").attr("src").replace("write_full", "write_empty"));
		else
			$(".box-header img").attr("src", $(".box-header img").attr("src").replace("write_empty", "write_full"));

	}
</script>