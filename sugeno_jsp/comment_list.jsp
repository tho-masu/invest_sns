<table class="comment_list">
  <tr>
   <td class="point_top">
    コメント一覧
   </td>
  </tr>
 </table>

 <%--コメントとコメントした人の名前やアイコン --%>
<table class="article_table">
 <%--一人目コメント --%>
 <tr>
   <td colspan="3" valign="middle"  class="function_cell">
     <div class="top_article">
       <%--フォローしたユーザのアイコン、クリックでそのユーザのページへ --%>
       <div class="top_icon_home">
         <a href=""><img src="<%=request.getContextPath() %>/img/user_icon/default_icon.png" width="50px" height="50px"></a>
       </div>
       <%--フォローしたユーザの名前クリックでそのユーザのページへ --%>
       <p class="top_name_home"><a href="">xxxxnamexxxx</a></p>

       <%--追加(削除ボタン) --%>
       <form class="comment_delete" action="<%=request.getContextPath() %>/masui_jsp/delete_comment" method="POST">
         <input type="hidden" name="pk_comment" value="<%--=cbean.getPk_comment() --%>">
     	 <input type="hidden" name="fk_user" value="<%--=cbean.getFk_user() --%>">
		 <%--<input type="submit" name="btn" value="削除"> --%>
		 <input type="image" src="<%=request.getContextPath()%>/img/function_icon/delete.png" width="20px" height="20px">
	   </form>
	   <%--追加ここまで --%>

       <div class="top_article_home">
         <div>1997-10-10</div>
         <article>xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
          xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
         </article>
        </div>
     </div>
   </td>
 </tr>
 <%--一人目終了 --%>
 <%--二人目コメント --%>
 <tr>
   <td colspan="3" valign="middle"  class="function_cell">
     <div class="top_article">
       <%--フォローしたユーザのアイコン、クリックでそのユーザのページへ --%>
       <div class="top_icon_home">
         <a href=""><img src="<%=request.getContextPath() %>/img/user_icon/default_icon.png" width="50px" height="50px"></a>
       </div>
       <%--フォローしたユーザの名前クリックでそのユーザのページへ --%>
       <p class="top_name_home"><a href="">xxxxnamexxxx</a></p>

       <%--追加(削除ボタン) --%>
       <form class="comment_delete" action="<%=request.getContextPath() %>/masui_jsp/delete_comment" method="POST">
         <input type="hidden" name="pk_comment" value="<%--=cbean.getPk_comment() --%>">
     	 <input type="hidden" name="fk_user" value="<%--=cbean.getFk_user() --%>">
		 <%--<input type="submit" name="btn" value="削除"> --%>
		 <input type="image" src="<%=request.getContextPath()%>/img/function_icon/delete.png" width="20px" height="20px">
	   </form>

       <div class="top_article_home">
         <div>1997-10-10</div>
         <article>xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
          xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
         </article>
        </div>
     </div>
   </td>
 </tr>
 <%--二人目終了 --%>
</table>



