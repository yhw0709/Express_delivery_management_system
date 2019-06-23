from django import forms

from user.models import User


class UserLoginForm(forms.Form):
    username = forms.CharField(required=True, max_length=20, min_length=2,
                               error_messages={
                                   'required': '用户名必填',
                                   'max_length': '用户名不能超过20个字符',
                                   'min_length': '用户名不能少于5个字符'
                               })
    password = forms.CharField(required=True, min_length=2, max_length=20,
                               error_messages={
                                   'required': '密码必填',
                                   'max_length': '密码不能超过20个字符',
                                   'min_length': '密码不能少于5个字符'
                               })

    def clean(self):
        user = User.objects.filter(username=self.cleaned_data.get('username')).first()
        if not user:
            raise forms.ValidationError({'username': '未注册的用户名'})
        return self.cleaned_data


class UserRegisterForm(forms.Form):
    """
    用户注册验证表单
    """
    username = forms.CharField(required=True, max_length=20, min_length=2,
                               error_messages={
                                   'required': '用户名必填',
                                   'max_length': '用户名不能超过20个字符',
                                   'min_length': '用户名不能少于5个字符'
                               })
    password = forms.CharField(required=True, min_length=2, max_length=20,
                               error_messages={
                                   'required': '密码必填',
                                   'max_length': '密码不能超过20个字符',
                                   'min_length': '密码不能少于8个字符'
                               })
    com_password = forms.CharField(required=True, min_length=2, max_length=20,
                                   error_messages={
                                    'required': '确认密码必填',
                                    'max_length': '确认密码不能超过20个字符',
                                    'min_length': '确认密码不能少于8个字符'
                                   })

    def clean(self):
        username = self.cleaned_data.get('username')
        password = self.cleaned_data.get('password')
        com_password = self.cleaned_data.get('com_password')
        user = User.objects.filter(username=username)
        if user:
            raise forms.ValidationError({'username': '用户名重复'})
        if password != com_password:
            raise forms.ValidationError({'com_password': '两次密码不一致'})

        return self.cleaned_data


class UserOrderCreateForm(forms.Form):
    def clean(self):
        return self.cleaned_data
