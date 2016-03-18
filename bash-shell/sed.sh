#basic_line_number=$(grep -n class=\"form-horizontal\" ./test.html|cut -d: -f1)

#error_html_line_number=$(($basic_line_number - 2))
#echo $basic_line_number
#echo $error_html_line_number

#sed ' ${error_html_line_number} a test' login-template.html
#sed ' 2305 a test' test.html
#sed -e "2305 a test.html" -i test.html


#span_badge_line=$(grep -n "span id=\"badge\"" ./new-login.html |cut -d: -f1)
#img_line=$(( $span_badge_line + 1 ))
#echo $img_line
#base64_img=$(echo "data:image/png;base64,$(base64 -w 0 ctc-long-console.png)")
##base64_img="<img src=\"${base64_img}\" alt=\"new logo\"/>"
#base64_img="<img src=\"$(echo "data:image/png;base64,$(base64 -w 0 ctc-long-console.png)")\" alt=\"new logo\"/>"
#echo $base64_img
#sed -e "$img_line,1d" -i new-login.html
#sed -e "$img_line i $base64_img" -i new-login.html


#sed -e "${img_line}s/src.*\" a/src="chagned" a/g" -i new-login.html

#sed -e "/oauthConfig/r login_conf.txt" -i master-config.yaml

function base_line(){
    echo $(grep -n "$1" ./new-login.html | cut -d':' -f1)

}


# Add error tag into new-login.html
#base_line=$(grep -n "col-sm-7 col-md-6 col-lg-5 login" ./new-login.html | cut -d':' -f1)
#error_tag_insert_line=$(($base_line - 2))

#sed -e "${error_tag_insert_line}r  ./error_tag.txt" -i ./new-login.html

#Change essential field values
#form_tag_line=$(base_line 'class="form-horizontal"')
#sed "${form_tag_line},$(($form_tag_line + 3)) d" -i ./new-login.html

#sed -e "$((${form_tag_line}-1))r  ./form_tag.txt"  -i ./new-login.html

# Change User/Password field values
#<input type="text" class="form-control" id="inputUsername" placeholder="" tabindex="1" autofocus="autofocus" type="text" name="username" value="">
#
#..
#
#<input type="password" class="form-control" id="inputPassword" placeholder="" tabindex="2" type="password" name="password" value="">
#
#<input type="text" class="form-control" id="inputUsername" placeholder="" tabindex="1" autofocus="autofocus" type="text" name="{{ .Names.Username}}" value="{{ .Values.Username }}"> 
#
#..
#
# <input type="password" class="form-control" id="inputPassword" placeholder="" tabindex="2" type="password"  name="{{ .Names.Password }}"  value=""> 

username_tag_line=$(base_line 'name="username"')
password_tag_line=$(base_line 'name="password"')

sed -e "${username_tag_line}s/name=\"username\"/name=\"{{ .Names.Username}}\"/g"  new-login.html
sed -e "${username_tag_line}s/value=/value=\"{{ .Values.Username }}\"/g"  new-login.html

sed -e "${password_tag_line}s/name=\"password\"/name=\"{{ .Names.Password }}\"/g"  new-login.html





