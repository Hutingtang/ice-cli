/**
 * @file IceBusiness.ice
 * @brief   
 * @author cxl, www.nazhiai.com, <xiaolong.chen@nazhiai.com>
 * @version 3.20180829
 * @date 2018-08-29
 *
 */
#pragma once


module business
{
    /**
     * @brief ҵ��ӿڶ���
     */
    interface IBusiness
    {
        /**
         * @brief  LicenseCheck ��Ȩ��ɼ�顣
         * @since  V3.20191206
         *
         * @param code ��Ʒ������Ϣ��
            example: 
            {
                "product_code": "1,0",  ����,string,��Ʒ���š�
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void LicenseCheck(string code, out string result);

        /**
         * @brief  Login �û���¼��
         * @since  V3.20180922
         * @update V3.20181127 �û�Ȩ��
         * @update V3.20200508 �����û�������֯id
         * @update V3.20200713 ����ģ����Ȩ��Ϣ
         *
         * @param login �û���Ϣ��
            example: 
            {
                "username": "n1",           ����,string,��¼����
                "password": "md5 encrypted" ����,string,MD5���ܵ����롣
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ�Ľ��
            {
                "code": 0,
                "info":
                {
                    "user_id": 3,
                    "username": "xx",
                    "level":0,
                    "role_id":1,
                    "privilege":"",
                    "organ_id":1,
                    "org_id":1,
                    "model_auth_info":{};     // ģ����Ȩ��Ϣ
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
            for model_auth_info:
            {
                "wechat_push": 1,           int,����,΢������, 0: ����, 1: �ر�
                "visitor_device": 1,        int,����,�ÿͻ�����, 0: ����, 1: �ر�
                "sigin": 1,                 int,����,ǩ��, 0: ����, 1: �ر�
                "welcome": 1,               int,����,ӭ��, 0: ����, 1: �ر�
                "attendance": 1,            int,����,����, 0: ����, 1: �ر�
                "retrieve": 1,              int,����,��������, 0: ����, 1: �ر�
                "super_retrieve": 1,        int,����,�߼�����, 0: ����, 1: �ر�
            }
         */
        void Login(string login, out string result);

        /**
         * @brief  AddUser ����û�
         * @since  V3.20180922
         * @update V3.20181227 �����û�����
         * @update V3.20181227 ���ӽ�ɫid
         * @update V3.20200102 �����û�id
         * @update V3.20200421 �����û���������ID
         * @update V3.20200427 �����û�������ĵص�ID�б�
         *
         * @param user �û���Ϣ��
            example: 
            {
                "username": "n1",           ����,string,��¼�û�����Ҫ���������Ż������ַ���!@#$%^&*([{}])_+|~-=\`;:'",<.>/?
                "password": "md5 encrypted",����,string,��¼���룬MD5���ܵ����롣
                "operator": "admin",        ����,string,�����ߣ�Ҳ�Ǵ����ߣ�����ǰ��¼���û���
                "level":0,                  ����,int,�˻�����,1:�߼�����Ա,2:����Ա,3:��ͨ�û�)
                "role_id":1,                ����,int,�û���ɫid
                "organ_id":1,               ����,int,�û���������id(ָ��֯ID)
                "org_id":1,                 ����,int,�û���������id(ָ��֯ID)
                "siteid_list":"xx,xx",      ѡ��,string,�û�����ĵص�id�б�,��","�ָ�
                "site_list":"xx,xx",        ѡ��,string,�û�����ĵص�id�б�,��","�ָ�
                "remark": "xxx"             ѡ��,string,��ע��
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0, "info": {"user_id": 1}}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void AddUser(string user, out string result);

        /**
         * @brief  UpdateUser �����û�
         * @since  V3.20180922
         * @update V3.20181227 �û�����
         * @update V3.20181227 ��ɫid
         * @update V3.20200421 �����û���������ID
         * @update V3.20200427 �����û�������ĵص�ID�б�
         *
         * @param user �û���Ϣ��
            example: 
            {
                "user_id": 3,               ����,int,�û�id��
                "username": "xx",           ѡ��,string,�û�������Ҫ���������Ż������ַ���!@#$%^&*([{}])_+|~-=\`;:'",<.>/?
                "password": "md5 encrypted",ѡ��,string,MD5���ܵ����룬�޸�����ʱʹ�á�
                "old_password": "fsadsda",  ѡ��,string,MD5���ܵ����룬�޸�����ʱʹ�ã�������֤��
                "level":0,                  ѡ��,int,�˻�����,1:�߼�����Ա,2:����Ա,3:��ͨ�û�)
                "role_id":1,                ѡ��,int,�û���ɫid
                "organ_id":1,               ����,int,�û���������id(ָ��֯ID)
                "org_id":1,                 ����,int,�û���������id(ָ��֯ID)
                "siteid_list":"xx,xx",      ѡ��,string,�û�����ĵص�id�б�,��","�ָ�
                "site_list":"xx,xx",        ѡ��,string,�û�����ĵص�id�б�,��","�ָ�
                "operator": "admin",        ����,string,�����ߣ�����ǰ��¼���û���
                "remark": "xxx"             ѡ��,string,��ע��
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void UpdateUser(string user, out string result);

        /**
         * @brief  DeleteUser ɾ���û�
         * @since  V3.20180922
         *
         * @param user �û���Ϣ��
            example: 
            {
                "user_id": 3,           ����,int,�û�id��
                "operator": "admin"     ����,string,�����ߣ�����ǰ��¼���û���
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0} ���ض�Ӧ�Ľ��
            ʧ�� - ִ��ʧ�� {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void DeleteUser(string user, out string result);

        /**
         * @brief  QueryUserList ��ѯ�û��б�
         * @since  V3.20180922
         * @update V3.20181227  �˻�����
         * @update V3.20181227  ��ɫid
         * @update V3.20200421 �����û���������ID������
         * @update V3.20200427 �����û�������ĵص�ID�б�
         * @update V3.20200427 �����û���������ID�б�
         *
         * @param cond ��ѯ������
            example: 
            {
                "page_no": 2,       ����,int,ҳ��
                "page_size": 10,    ����,int,ÿҳ����
                "operator": "admin",����,string,������
                "query_cond": {
                    "username": "xx",   ѡ��,string,�û���
                    "level":0,          ѡ��,int,�˻�����,1:�߼�����Ա,2:����Ա,3:��ͨ�û�)
                    "role_id":1,        ѡ��,int,�û���ɫid
                }
            }
         * @param result       �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ�Ľ��
            {
                "code": 0,
                "info": {
                    "page_no": 2,
                    "page_size": 10,
                    "total_count": 32,
                    "items": [
                        {
                            "user_id": 2,
                            "username": "xx",
                            "level":0,
                            "role_id":1,
                            "role_name","solider",
                            "organ_id":1,                   //�˺�������֯id
                            "organ_name":"",                //�˺�������֯����
                            "org_id":1,                     //�˺�������֯id
                            "organization":"",              //�˺�������֯����
                            "siteid_list":"xx,xx",          //�˺ſɹ���ĵص�id�б�
                            "site_list":"xx,xx",            //�˺ſɹ���ĵص�id�б�
                            "groupid_list":"xx,xx",         //�˺�������id�б�
                            "remark": "cxvx",
                            "creator": "sfd",
                            "create_time": "2018-03-23 00:12:12"
                        }
                    ]
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void QueryUserList(string cond, out string result);

        /**
         * @brief  AddRole ��ӽ�ɫ
         * @since  V1.20181226
         * @update V3.20200102 ���ؽ�ɫid
         *
         * @param role ��ɫ��Ϣ
            example:
            {
                "role_name":"soldier",  ����,string,��ɫ
                "privilege":"{}",       ����,json-string,json��ʽ�������ֶ�
                "organ_id":1,           ����,int,��֯id
                "org_id":1,             ����,int,��֯id
                "operator": "admin",    ����,string,�����ߣ�Ҳ�Ǵ����ߣ�����ǰ��¼���û���
                "remark":""             ѡ��,string,��ɫ��ע��Ϣ    
            }
                �ֶΡ�privilege��ȡֵ:
                {
                    "library":0,        �׿����Ȩ��,0:��Ȩ��,1:��Ȩ��
                    "person":0,         ��Ա����Ȩ��,0:��Ȩ��,1:��Ȩ��
                    "group":0,          �������Ȩ��,0:��Ȩ��,1:��Ȩ��
                    "camera":0,         ����ͷ����Ȩ��,0:��Ȩ��,1:��Ȩ��
                    "task":0,           �������Ȩ��,0:��Ȩ��,1:��Ȩ��
                    "user":0,           �û�����Ȩ��,0:��Ȩ��,1:��Ȩ��
                    "access":0,         �Ž�����Ȩ��,0:��Ȩ��,1:��Ȩ��
                    "rollcall":0,       ��Ա����Ȩ��,0:��Ȩ��,1:��Ȩ��
                    "dynamic_control":0,��̬���� Ȩ��,0:��Ȩ��,1:��Ȩ��
                    "group_alarm":0,    ���Ÿ澯Ȩ��,0:��Ȩ��,1:��Ȩ��
                    "patrol_alarm":0,   Ѳ���澯Ȩ��,0:��Ȩ��,1:��Ȩ��
                    "system_config":0,  ϵͳ����Ȩ��,0:��Ȩ��,1:��Ȩ��
                    "map":0             ��ͼ����Ȩ��,0:��Ȩ��,1:��Ȩ��
                }
        * @param result �ɹ���ʧ��,��:
            �ɹ� - {"code": 0, "info": {"role_id": 1}}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
        */
        void AddRole(string role, out string result);

        /**
         * @brief  UpdateRole ���½�ɫ
         * @since  V1.20181226
         *
         * @param role ��ɫ��Ϣ
            example:
            {
                "role_id":1,            ����,int,��ɫid
                "role_name":"solider",  ѡ��,string,��ɫ
                "privilege":"{}",       ѡ��,json-string,json��ʽ�������ֶ�
                "organ_id":1,           ����,int,��֯id
                "org_id":1,             ����,int,��֯id
                "operator":"admin",     ����,string,�����ߣ�����ǰ��¼���û���
                "remark":"test"         ѡ��,string,��ע��Ϣ
            }
            �ֶΡ�privilege��ȡֵ:
                {
                    "library":0,        �׿����Ȩ��,0:��Ȩ��,1:��Ȩ��
                    "person":0,         ��Ա����Ȩ��,0:��Ȩ��,1:��Ȩ��
                    "group":0,          �������Ȩ��,0:��Ȩ��,1:��Ȩ��
                    "camera":0,         ����ͷ����Ȩ��,0:��Ȩ��,1:��Ȩ��
                    "task":0,           �������Ȩ��,0:��Ȩ��,1:��Ȩ��
                    "user":0,           �û�����Ȩ��,0:��Ȩ��,1:��Ȩ��
                    "access":0,         �Ž�����Ȩ��,0:��Ȩ��,1:��Ȩ��
                    "rollcall":0,       ��Ա����Ȩ��,0:��Ȩ��,1:��Ȩ��
                    "dynamic_control":0,��̬���� Ȩ��,0:��Ȩ��,1:��Ȩ��
                    "group_alarm":0,    ���Ÿ澯Ȩ��,0:��Ȩ��,1:��Ȩ��
                    "patrol_alarm":0,   Ѳ���澯Ȩ��,0:��Ȩ��,1:��Ȩ��
                    "system_config":0,  ϵͳ����Ȩ��,0:��Ȩ��,1:��Ȩ��
                    "map":0             ��ͼ����Ȩ��,0:��Ȩ��,1:��Ȩ��
                }
        * @param result �ɹ���ʧ��,��:
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}  
        */
        void UpdateRole(string role, out string result);

        /**
         * @brief  DeleteRole ɾ����ɫ
         * @since  V1.20181226
         *
         * @param role ��ɫ��Ϣ
            example:
            {
                "role_id":1,        ����,int,��ɫid
                "operator":"admin"  ����,string,�����ߣ�����ǰ��¼���û���
            }
        * @param result �ɹ���ʧ��,��:
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}   
        */
        void DeleteRole(string role, out string result);

        /**
         * @brief  QueryRoleList ��ѯ��ɫ�б�
         * @since  V1.20181226
         *
         * @param role ��ɫ��Ϣ
            example
            {
                "page_no": 1,           ����,int,ҳ��
                "page_size": 10,        ����,int,ÿҳ����
                "operator": "admin",    ����,string,������
                "query_cond": {
                    "role_name":"solider",   ѡ��,string,��ɫ
                    "organid_list":""        ѡ��,string,��֯id�б�
                }
            }
        * @param result �ɹ���ʧ��,��:
            �ɹ� - ���ض�Ӧ�Ľ��
            {
                "code":0,
                "info":
                {
                    "page_no":1,
                    "page_size":10,
                    "total_count":20,
                    "items":[
                        {
                            "role_id":1,
                            "role_name":"solider",
                            "privilege":"",
                            "organ_id":1,
                            "organ_name":"",
                            "org_id":1,
                            "organization":"",
                            "user_list","user1,user2"
                            "creator":"admin",
                            "create_time":"2018-12-26 15:08:00",
                            "remark":""
                        }
                    ]
                }
            }
        */
        void QueryRoleList(string role, out string result);


        /**
        -----------------------------------------------------------------------
         ��֯������Ϣ����
        -----------------------------------------------------------------------
        **/
        /**
         * @brief  AddOrganization ��ӻ���
         * @since  V3.20200508
         *
         * @param organinfo ������Ϣ
            example:
            {
                "operator": "admin"     ����,string,�����ߣ�Ҳ�Ǵ����ߣ�����ǰ��¼���û���
                "organ_name":"xxx",     ����,string,��������
                "attribute":"{}",       ѡ��,json-string,json��ʽ�������ֶ� ����
            }
                �ֶΡ�attribute��ȡֵ:
                {
                }
        * @param result �ɹ���ʧ��,��:
            �ɹ� - {"code": 0, "info": {"organ_id": 1, "org_id":1}}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
        */
        void AddOrganization(string organinfo, out string result);

        /**
         * @brief  UpdateOrganization ���»���
         * @since  V3.20200508
         *
         * @param organinfo ������Ϣ
            example:
            {
                "operator":"admin"      ����,string,�����ߣ�����ǰ��¼���û�
                "organ_id":1,           ����,int,����id
                "org_id":1,             ����,int,����id
                "organ_name":"xxx",     ѡ��,string,��������
                "organization":"xxx",   ѡ��,string,��������
                "attribute":"{}",       ѡ��,json-string,json��ʽ�������ֶ� ����
            }
                �ֶΡ�attribute��ȡֵ:
                {
                }
        * @param result �ɹ���ʧ��,��:
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}  
        */
        void UpdateOrganization(string organinfo, out string result);
        
        /**
         * @brief  EnableOrganization ʹ����֯����
         * @since  V3.20200508
         *
         * @param organinfo ������Ϣ
            example: 
            {
                "organ_id": 1,      ����, int, ����id
                "org_id": 1,        ����, int, ����id
                "enabled": true,    ����, bool,ʹ��״̬,false:ͣ��,true:����
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void EnableOrganization(string organinfo, out string result);

        /**
         * @brief  DeleteOrganization ɾ������
         * @since  V3.20200508
         *
         * @param organinfo ������Ϣ
            example:
            {
                "operator":"admin"  ����,string,�����ߣ�����ǰ��¼���û���
                "organ_id":1,       ����,int,����id
                "org_id":1,         ����,int,����id
            }
        * @param result �ɹ���ʧ��,��:
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}   
        */
        void DeleteOrganization(string role, out string result);

        /**
         * @brief  QueryOrganizationList ��ѯ������Ϣ�б�
         * @since  V3.20200508
         *
         * @param organinfo ������Ϣ��ѯ����
            example
            {
                "page_no": 1,           ����,int,ҳ��
                "page_size": 10,        ����,int,ÿҳ����
                "operator": "admin",    ����,string,������
                "query_cond": {
                    "organ_id":xxx,       ѡ��,string,����id
                    "organ_name":"xxx",   ѡ��,string,��������,֧��ģ��ƥ���ѯ
                    "org_id":xxx,         ѡ��,string,����id
                    "organization":"xxx", ѡ��,string,��������,֧��ģ��ƥ���ѯ
                }
            }
        * @param result �ɹ���ʧ��,��:
            �ɹ� - ���ض�Ӧ�Ľ��
            {
                "code":0,
                "info":
                {
                    "page_no":1,
                    "page_size":10,
                    "total_count":20,
                    "items":[
                        {
                            "organ_id":0,               //����id
                            "organ_name":"xxx",         //��������
                            "org_id":0,                 //����id
                            "organization":"xxx",       //��������
                            "site_count" : 100,         //�����ص�����
                            "enabled": true,            //ʹ��״̬,false:ͣ��,true:����
                            "attribute":"{}",           //json-string,json��ʽ�������ֶ� ����
                            "creator":"admin",
                            "create_time":"YYYY-mm-dd HH:MI:SS",
                            "site_list": [ {"id": 1, "name": "xx"} ]   //�ص��б�,[{id,name},...]
                        }
                    ]
                }
            }
        */
        void QueryOrganizationList(string organinfo, out string result);

        /**
         * @brief  UpdateOrganAuthorization ������֯��Ȩ��Ϣ
         * @since  V3.20200604
         *
         * @param auth ��Ȩ��Ϣ
            example
            {
                "id": 1,                ����,int,��¼id
                "auth_camera": 1,       ѡ��,int,����ͷ��Ȩ��,-1:��ʾ������,��ϵͳ��Ȩ����Ϊ����
                "auth_face_device": 1,  ѡ��,int,�����Ž���Ȩ��,-1:��ʾ������,��ϵͳ��Ȩ����Ϊ����
                "remark": "",           ѡ��,string,��ע��Ϣ
            }
        * @param result �ɹ���ʧ��,��:
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
        */
        void UpdateOrganAuthorization(string role, out string result);

        /**
         * @brief  QueryOrganAuthorizationList ��ѯ��֯��Ȩ��Ϣ�б�
         * @since  V3.20200604
         * @update V3.20200713 ����ϵͳ��Ȩ��Ϣ
         *
         * @param cond ��֯��Ȩ��Ϣ��ѯ����
            example
            {
                "page_no": 1,           ����,int,ҳ��
                "page_size": 10,        ����,int,ÿҳ����
                "org_id": 1,            ѡ��,��֯id
                "query_cond": {
                    "name":"xxx",       ѡ��,string,��֯��,ģ��ƥ��
                }
            }
        * @param result �ɹ���ʧ��,��:
            �ɹ� - ���ض�Ӧ�Ľ��
            {
                "code":0,
                "info":
                {
                    "page_no": 1,
                    "page_size": 10,
                    "total_count": 20,
                    "others": {
                        "auth_camera": 1,                   // ����ͷ��Ȩ��,-1��ʾ������,��ϵͳ��Ȩ����Ϊ����
                        "auth_camera_used": 1,              // �Ѱ�����ͷ
                        "auth_face_device": 1,              // �����Ž���Ȩ��,-1:��ʾ������,��ϵͳ��Ȩ����Ϊ����
                        "auth_face_device_used": 1,         // �Ѱ������Ž��豸
                        "auth_feature": 1,                  // ��Ȩ����ֵ,-1:��ʾ������,��ϵͳ��Ȩ����Ϊ����
                        "auth_feature_used": 1,             // ��ʹ������ֵ
                    },
                    "items":[
                        {
                            "id": 1,                        // ��¼id
                            "org_id":0,                     // ��֯id
                            "organization":"xxx",           // ��֯��
                            "auth_camera": 1,               // ����ͷ��Ȩ��,-1��ʾ������,��ϵͳ��Ȩ����Ϊ����
                            "auth_camera_used": 1,          // �Ѱ�����ͷ
                            "auth_face_device": 1,          // �����Ž���Ȩ��,-1:��ʾ������,��ϵͳ��Ȩ����Ϊ����
                            "auth_face_device_used": 1,     // �Ѱ��Ž�
                            "auth_feature": 1,              // ��Ȩ����ֵ
                            "auth_feature_used": 1,         // ��ʹ������ֵ
                            "remark": "",                   // ��ע��Ϣ
                            "create_time": "",              // ����ʱ��
                        }
                    ]
                }
            }
        */
        void QueryOrganAuthorizationList(string cond, out string result);

        /**
        -----------------------------------------------------------------------
         �ص���Ϣ����
        -----------------------------------------------------------------------
        **/
        /**
         * @brief  AddSite ��ӵص���Ϣ
         * @since  V3.20200508
         *
         * @param siteinfo �ص���Ϣ
            example:
            {
                "operator": "admin"     ����,string,�����ߣ�Ҳ�Ǵ����ߣ�����ǰ��¼���û���
                "organ_id":xxx,         ����,int,������֯ID
                "org_id":xxx,           ����,int,������֯ID
                "site_name":"xxx",      ����,string,�ص�����
                "attribute":"{}",       ѡ��,json-string,json��ʽ�������ֶ� ����
            }
                �ֶΡ�attribute��ȡֵ:
                {
                }
        * @param result �ɹ���ʧ��,��:
            �ɹ� - {"code": 0, "info": {"site_id": 1}}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
        */
        void AddSite(string siteinfo, out string result);

        /**
         * @brief  UpdateSite ���µص�
         * @since  V3.20200508
         *
         * @param siteinfo �ص���Ϣ
            example:
            {
                "operator":"admin"      ����,string,�����ߣ�����ǰ��¼���û�
                "site_id":1,            ����,int,�ص�id
                "site_name":"xxx",      ѡ��,string,�ص�����
                "sitename":"xxx",      ѡ��,string,�ص�����
                "attribute":"{}",       ѡ��,json-string,json��ʽ�������ֶ� ����
                
            }
                �ֶΡ�attribute��ȡֵ:
                {
                }
        * @param result �ɹ���ʧ��,��:
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}  
        */
        void UpdateSite(string siteinfo, out string result);
        
        /**
         * @brief  EnableSite ʹ�ܵص�
         * @since  V3.20200508
         *
         * @param siteinfo �ص���Ϣ
            example: 
            {
                "site_id":1,        ����, int, �ص�id
                "enabled": true,    ����, bool,ʹ��״̬,false:ͣ��,true:����
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void EnableSite(string siteinfo, out string result);

        /**
         * @brief  DeleteSite ɾ���ص�
         * @since  V3.20200508
         *
         * @param siteinfo �ص���Ϣ
            example:
            {
                "operator":"admin"      ����,string,�����ߣ�����ǰ��¼���û�
                "site_id":1,            ����,int,�ص�id
            }
        * @param result �ɹ���ʧ��,��:
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}   
        */
        void DeleteSite(string siteinfo, out string result);

        /**
         * @brief  QuerySiteList ��ѯ�ص���Ϣ�б�
         * @since  V3.20200508
         *
         * @param siteinfo �ص���Ϣ��ѯ����
            example
            {
                "page_no": 1,           ����,int,ҳ��
                "page_size": 10,        ����,int,ÿҳ����
                "operator": "admin",    ����,string,������
                "query_cond": {
                    "organ_id":xxx,       ѡ��,int,����id
                    "organ_name":"xxx",   ѡ��,string,��������,֧��ģ��ƥ���ѯ
                    "site_id":xxx,        ѡ��,int,�ص�id
                    "site_name":"xxx",    ѡ��,string,�ص�����,֧��ģ��ƥ���ѯ
                    "org_id":xxx,         ѡ��,int,����id
                    "organization":"xxx", ѡ��,string,��������,֧��ģ��ƥ���ѯ
                    "sitename":"xxx",     ѡ��,string,�ص�����,֧��ģ��ƥ���ѯ
                }
            }
        * @param result �ɹ���ʧ��,��:
            �ɹ� - ���ض�Ӧ�Ľ��
            {
                "code":0,
                "info":
                {
                    "page_no":1,
                    "page_size":10,
                    "total_count":20,
                    "items":[
                        {
                            "site_id":xxx,              //�ص�id
                            "site_name":"xxx",          //�ص�����
                            "sitename":"xxx",           //�ص�����
                            "organ_id":0,               //����id
                            "org_id":0,                 //����id
                            "organ_name":"xxx",         //��������
                            "organizaiton":"xxx",       //��������
                            "enabled": true,            //ʹ��״̬,false:ͣ��,true:����
                            "attribute":"{}",           //json-string,json��ʽ�������ֶ� ����
                            "creator":"admin",
                            "create_time":"YYYY-mm-dd HH:MI:SS"
                        }
                    ]
                }
            }
        */
        void QuerySiteList(string siteinfo, out string result);
        
        /**
         -----------------------------------------------------------------------
         Ȩ�޷������
         -----------------------------------------------------------------------
        **/
        /**
         * @brief  AddPermissionGroup ���Ȩ�޷���
         * @since  V3.20200427
         * @update V3.20200527
         *
         * @param group С����Ϣ
            example:
            {
                "group_name": "",    ����,string,������
                "userid_list": "",   ����,string,�����û�id�б�,id֮���Զ��ŷָ�
                "site_list": "",     ����,string,�ɷ��ʵص�id�б�,id֮���Զ��ŷָ�
                "operator": "admin", ����,string,�����ߣ�Ҳ�Ǵ����ߣ�����ǰ��¼���û�
                "org_id": 0,         ����,int,��֯id
                "remark": ""         ѡ��,string,��ע
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0, "info": {"group_id": 1}}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void AddPermissionGroup(string group, out string result);

        /**
         * @brief  RemovePermissionGroup ɾ��Ȩ�޷���
         * @since  V3.20200427
         *
         * @param group С����Ϣ
            example:
            {
                "group_id":xx        ����,int,С��id
                "operator": "admin"  ����,string,�����ߣ�Ҳ�Ǵ����ߣ�����ǰ��¼���û���
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void RemovePermissionGroup(string group, out string result);

        /**
         * @brief  UpdatePermissionGroup ����Ȩ�޷�����Ϣ
         * @since  V3.20200427
         * @update V3.20200527
         *
         * @param group С����Ϣ
            example:
            {
                "group_id" : xx,     ����,int,��id
                "group_name": "",    ѡ��,string,������
                "userid_list": "",   ѡ��,string,�����û�id�б�,id֮���Զ��ŷָ� ���Ϊ��,�򲻸���,���Ϊ"NULL" ����Ϊ���id�б�
                "site_list": "",     ѡ��,string,�ɷ��ʵص�id�б�,id֮���Զ��ŷָ� ���Ϊ��,�򲻸���,���Ϊ"NULL" ����Ϊ���id�б�
                "org_id": 0,         ����,int,��֯id
                "operator": "admin", ����,string,�����ߣ�Ҳ�Ǵ����ߣ�����ǰ��¼���û���
                "remark": ""         ѡ��,string,��ע
                
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void UpdatePermissionGroup(string group, out string result);
        
        /**
         * @brief  QueryPermissionGroupList ��ѯȨ�޷�����Ϣ�б�
         * @since  V3.20200427
         * @update V3.20200527
         *
         * @param group Ȩ�޷�����Ϣ��ѯ����
            example
            {
                "page_no": 1,           ����,int,ҳ��
                "page_size": 10,        ����,int,ÿҳ����
                "operator": "admin",    ����,string,������
                "query_cond": {
                    "group_id":xxx,       ѡ��,string,����id
                    "group_name":"xxx",   ѡ��,string,Ȩ��������,֧��ģ��ƥ���ѯ
                    "org_id" : 0          ѡ��, int, ������֯id
                }
            }
        * @param result �ɹ���ʧ��,��:
            �ɹ� - ���ض�Ӧ�Ľ��
            {
                "code":0,
                "info":
                {
                    "page_no":1,
                    "page_size":10,
                    "total_count":20,
                    "items":[
                        {
                            "group_id":0,               //����id
                            "group_name":"xxx",         //������
                            "userid_list": "",          //�����û�id�б�,id֮���Զ��ŷָ�
                            "username_list": "",        //�����û����б�,�Զ��ŷָ�
                            "org_id" : 0,               //������֯id
                            "orgnization": "",          //������֯����
                            "site_list": "",            //�ɷ��ʵص�id�б�,id֮���Զ��ŷָ�
                            "sitename_list":"",         //�ɷ��ʵص������б�,�Զ��ŷָ�
                            "creator":"admin",
                            "create_time":"YYYY-mm-dd HH:MI:SS"
                        },
                        ...
                    ]
                }
            }
        */
        void QueryPermissionGroupList(string group, out string result);
        /**
        -----------------------------------------------------------------------
        �׿����
        -----------------------------------------------------------------------
        **/

        /**
         * @brief  AddLibrary ��ӵ׿�
         * @since  V3.20180922
         * @update V3.20181018
         * @update V3.20190308 ����VIP�׿�����
         * @update V3.20200102 ���ص׿�id
         * @update V3.20200324 ����ר�õ׿��ʶ
         * @update V3.20200429 ���ӵ׿������ص�id�б�
         *
         * @param lib �׿���Ϣ
            example: 
            {
                "name": "",         ����,string,��Ա������
                "type": 1,          ѡ��,int,��Ա����,�μ���PersonType��
                "special": 0,       ѡ��,int,ר�õ׿��ʶ,0:�����׿�,1:AIOTר�õ׿�
                "remark": "",       ѡ��,string,��Ա�ⱸע
                "operator": "",     ����,string,�����ߣ�Ҳ�Ǵ����ߣ�����ǰ��¼�û���
                "siteid_list":""    ����,string,�׿������ص�id�б�
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0, "info": {"lib_id": 1}}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void AddLibrary(string lib, out string result);

        /**
         * @brief  EnableLibrary ʹ�ܵ׿�
         * @since  V3.20190308
         *
         * @param lib �׿���Ϣ
            example: 
            {
                "lib_id": 1,        ����,��id
                "enabled": true,    ����,ʹ��״̬,false:ͣ��,true:����
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void EnableLibrary(string lib, out string result);

        /**
         * @brief  DeleteLibrary ɾ���׿�
         * @since  V3.20180922
         *
         * @param lib �׿���Ϣ
            example: 
            {
                "lib_id": 1     ����,int,��Ա��id
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void DeleteLibrary(string lib, out string result);

        /**
         * @brief  BatchDeleteLibrary ����ɾ���׿�
         * @since  V3.20180922
         *
         * @param batch ����ɾ������
            example: 
            {
                "lib_list": "1,2,3,4",      ����,string,�Զ��ŷָ��ĵ׿�id�б�
                "operator": "admin"         ѡ��,string,�����ߣ�����ǰ��¼�û���
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void BatchDeleteLibrary(string batch, out string result);

        /**
         * @brief  QueryLibraryInfo ��ȡ�׿���Ϣ
         * @since  V3.20180922
         * @update V3.20181018
         * @update V3.20190308 ����VIP�׿����ͼ�ʹ��״̬
         * @update V3.20200324 ����ר�õ׿��ʶ
         *
         * @param cond ����Ϣ
            example: 
            {
                "lib_id": 1     ����,int,��Ա��id
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ�Ľ��
            {
                "code": 0, 
                "info": 
                {
                    "lib_id": 1,        ��id
                    "lib_name": "",     ����
                    "type": 1,          ��Ա����,�μ���PersonType��
                    "remark": "",       ��ע
                    "enabled": true,    ʹ��״̬,false:ͣ��,true:����
                    "special": 0,       ר�õ׿��ʶ,0:�����׿�,1:AIOTר�õ׿�
                    "creator": "",      ������
                    "create_time": "",  ����ʱ��
                    "person_count": 100 ����
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void QueryLibraryInfo(string cond, out string result);

        /**
         * @brief  QueryLibraryList ��ȡ�׿��б�
         * @since  V3.20180922
         * @update V3.20181018
         * @update V3.20190308 ����VIP�׿����ͼ�ʹ��״̬
         * @update V3.20200324 ����ר�õ׿��ʶ
         * @update V3.20200429 ���ֵ������֯/�ص���Ϣ
         *
         * @param cond ����Ϣ
            example: 
            {
                "page_no": 1,       ����,int,ҳ��
                "page_size": 10,    ����,int,ÿҳ����
                "operator": "admin",����,string,������
                "query_cond": {
                    "name":"",      ѡ��,string,�׿���,֧��ģ��ƥ��
                    "type": 1,      ѡ��,int,��Ա����,�μ���PersonType��
                    "enabled": 1,   ѡ��,int,ʹ��״̬,0:ͣ��,1:����
                    "special": 0,   ѡ��,int,ר�õ׿��ʶ,0�����׿�,1:AIOT�׿�
                    "site_list":""  ѡ��,String,�׿������ص�id�б�
                }
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ�Ľ��
            {
                "code": 0, 
                "info": {
                    "page_no": 1, ҳ��
                    "page_size": 10, ÿҳ����
                    "items": [
                        {
                            "lib_id": 1,        ��id
                            "lib_name": "",     ����
                            "type": 1,          ��Ա����,�μ���PersonType��
                            "remark": "",       ��ע
                            "enabled": true,    ʹ��״̬,false:ͣ��,true:����
                            "special": 0,       ר�õ׿��ʶ,0:�����׿�,1:AIOTר�õ׿�
                            "creator": "",      ������
                            "create_time": "",  ����ʱ��
                            "person_count": 100,����
                            "organid_list",     �׿�������֯id�б�
                            "organid_name",     �׿�������֯�����б�
                            "siteid_list",      �׿������ص�id�б�
                            "siteid_name"       �׿������ص������б�
                        }
                    ]
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void QueryLibraryList(string cond, out string result);

        /**
         * @brief  AddCredentialType ���֤������
         * @since  V3.20181205
         * @update V3.20200102 �������
         *
         * @param type ֤��������Ϣ
            example: 
            {
                "name": "",         ����,string,֤����������
                "operator": ""      ѡ��,string,�����ߣ�����ǰ��¼�û���
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0, "info": {"id": 1}}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void AddCredentialType(string type, out string result);

        /**
         * @brief  UpdateCredentialType ����֤������
         * @since  V3.20181205
         *
         * @param type ��Ա�����Ϣ
            example: 
            {
                "id": 1,            ����,int,����id
                "name": "",         ����,string,��������
                "operator": ""      ѡ��,string,�����ߣ�����ǰ��¼�û���
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void UpdateCredentialType(string type, out string result);

        /**
         * @brief  DeleteCredentialType ɾ��֤������
         * @since  V3.20181205
         *
         * @param type ֤��������Ϣ
            example: 
            {
                "id": 5,            ����,int,����id
                "operator": ""      ѡ��,string,�����ߣ�����ǰ��¼�û���
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void DeleteCredentialType(string type, out string result);

        /**
         * @brief  QueryCredentialType ��ѯ֤������
         * @since  V3.20181205
         *
         * @param cond ���������Ϣ
            example:
            {
                "page_no": 1,       ����,int,ҳ��
                "page_size": 10,    ����,int,ÿҳ����
                "operator": "admin",����,string,������
                "query_cond": {
                    "id": 1,        ѡ��,int,֤������id
                }
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0, 
                "info": {
                    "page_no":xx,
                    "page_size":xx,
                    "total_count":xx,
                    "items": [
                        {
                            "id": 1, int,֤������id
                            "name": "", string,֤����������
                            "creator": "", string,������
                            "create_time": "", string, ����ʱ��
                        }, ...
                    ]
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void QueryCredentialType(string cond, out string result);

        /**
         -----------------------------------------------------------------------
         ��Ա����
         -----------------------------------------------------------------------
        **/
        /**
         * @brief  AddPeople �����Ա���
         * @since  V3.20190603
         * @update V3.20200102 ������Աid
         *
         * @param person ��Ա��Ϣ
            example: 
            {
                "lib_id": 1 ,       ����,int,��Ա��id
                "pic_list": "",     ����,string,ͼƬ·���б�,��һ��ͼƬΪĬ����ʾͼƬ,��Ӣ�Ķ��ŷָ�
                "name": "",         ����,string,��Ա����
                "category": 0,      ����,int,��Ա���,0:δ����,����μ�����Ա��𡷽ӿ�
                "english_name": "", ѡ��,string,Ӣ����
                "gender": 1,        ѡ��,int,�Ա�0:δ֪,1:��,2:Ů��,Ĭ��0
                "age": 20,          ѡ��,int,����
                "nation": 0,        ѡ��,int,����Id,�����ݿ��
                "birthday": "",     ѡ��,string,����
                "credential_type":0,ѡ��,int,֤�����ͣ�0:δ֪,1:���֤,2:����,3:�۰�ͨ��֤��,Ĭ��0
                "credential_no": "",ѡ��,string,֤����
                "phone": "",        ѡ��,string,�绰
                "mobile": "",       ѡ��,string,�ֻ�
                "email": "",        ѡ��,string,E-Mail��ַ
                "address": "",      ѡ��,string,ͨѶ��ַ
                "group": 2,         ѡ��,int,�ڰ�����,�μ�<Whitelist>,Ĭ��ֵ2
                "speech": "",       ѡ��,string,ӭ����
                "area_list": "",    ѡ��,string,����id�б�,id֮ǰ��Ӣ�Ķ��ŷָ�
                "remark": "",       ѡ��,string,��ע
                "property": {},     ѡ��,json-object,��Ա����
                "operator": "",     ѡ��,string,������
            }
            �ֶ�property�����������£�
            for Ա��
            {
                "rule_id": 1,       ����,int,���ڹ���id
                "dept_id": 1,       ѡ��,int,����id
                "position": "",     ѡ��,string,ְλ
                "empno": "",        ѡ��,string,����
                "hiredate": "",     ѡ��,string,��ְʱ��
            }
            for VIP
            {
                "company": "",      ѡ��,string,��˾����
                "department":"",    ѡ��,string,����
                "position": "",     ѡ��,string,ְλ
                "vip_level": "",    ѡ��,string,VIP�ȼ�
                "receiver_id": 1,   ѡ��,int,�Ӵ���id
            }
            for �ÿ�
            {
                "company": "",      ѡ��,string,���ڵ�λ
                "purpose": "",      ѡ��,string,����Ŀ��
                "interviewee_id": 0,ѡ��,int,�ܷ���id
                "start_time": "",   ѡ��,string,��Чʱ��-��ʼʱ��
                "end_time": "",     ѡ��,string,��Чʱ��-����ʱ��
            }
            for ����
            {
                "department": "",   ѡ��,string,����
                "position": "",     ѡ��,string,ְλ
                "police_no": "",    ѡ��,string,����
            }
            for ����
            {
                "prisoner_no": "",  ѡ��,string,�������
            }
            for ҵ��
            {
                "room_no": "",      ѡ��,string,����
            }
            for ������Ա
            {
                "company": "",      ѡ��,string,������λ
                "position": "",     ѡ��,string,ְλ
            }
            for �䶾��Ա
            {
                "watch_no": "",     ѡ��,string,���ܱ��
                "company": "",      ѡ��,string,������λ
                "emergency_contact": "",    ѡ��,string,������ϵ��
                "emergency_phone": "",      ѡ��,string,������ϵ�˵绰
            }
            for ̽����Ա
            {
                "company": "",      ѡ��,string,������λ
                "target": "",       ѡ��,string,̽�Ӷ���
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0, "info": {"person_id": 1}}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void AddPeople(string person, out string result);

        /**
         * @brief  UpdatePeople ������Ա��Ϣ
         * @since  V3.20190603
         *
         * @param person ��Ա��Ϣ
            example: 
            {
                "lib_id": 1 ,       ����,int,��Ա��id
                "person_id": 1 ,    ����,int,��Աid
                "pic_id": 1,        ����,int,Ĭ����ʾͼƬid
                "name": "",         ����,string,��Ա����
                "category": 0,      ����,int,��Ա���,0:δ����,����μ�����Ա��𡷽ӿ�
                "english_name": "", ѡ��,string,Ӣ����
                "gender": 1,        ѡ��,int,�Ա�0:δ֪,1:��,2:Ů��,Ĭ��0
                "age": 20,          ѡ��,int,����
                "nation": 0,        ѡ��,int,����Id,�����ݿ��
                "birthday": "",     ѡ��,string,����
                "credential_type":0,ѡ��,int,֤�����ͣ�0:δ֪,1:���֤,2:����,3:�۰�ͨ��֤��,Ĭ��0
                "credential_no": "",ѡ��,string,֤����
                "phone": "",        ѡ��,string,�绰
                "mobile": "",       ѡ��,string,�ֻ�
                "email": "",        ѡ��,string,E-Mail��ַ
                "address": "",      ѡ��,string,ͨѶ��ַ
                "group": 2,         ѡ��,int,�ڰ�����,�μ�<Whitelist>,Ĭ��ֵ2
                "speech": "",       ѡ��,string,ӭ����
                "area_list": "",    ѡ��,string,����id�б�,id֮ǰ��Ӣ�Ķ��ŷָ�
                "property": {},     ѡ��,json,��Ա����
                "operator": "",     ѡ��,string,������
            }
            �ֶ�property��������μ�<AddPeople>
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void UpdatePeople(string person, out string result);

        /**
         * @brief  BatchUpdatePeople �����޸���Ա��Ϣ
         * @since  V3.20190308
         *
         * @param person ��Ա��Ϣ
            {
                "category": 0,          ����,int,��Ա���,0:δ����,����μ�����Ա��𡷽ӿ�
                "person_list": "1,2",   ����,string,��Աid�б�
                "modify": {}            ����,json-object,�޸���Ϣ
            }
            �ֶ�info������������
            for Ա��
            {
                "dept_id": 1,           ѡ��,int,����id
                "area_list": "",        ѡ��,string,����id�б�
            }
            for VIP
            {
                "receiver_id": 1,       ѡ��,int,�Ӵ���id
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void BatchUpdatePeople(string person, out string result);

        /**
         * @brief  DeletePeople ɾ����Ա��Ϣ
         * @since  V3.20180922
         *
         * @param person ��Ա��Ϣ
            example: 
            {
                "lib_id": 5,    ����,int,�׿�id
                "person_id":xx, ����,int,��Աid
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void DeletePeople(string person, out string result);

        /**
         * @brief  BatchDeletePeople ����ɾ����Ա��Ϣ��
         * @since  V3.20180922
         *
         * @param batch ����ɾ������
            example: 
            {
                "lib_id": 5,                ����,int,�׿�id
                "person_list": "1,2,3"      ����,string,��Աid�б�
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void BatchDeletePeople(string batch, out string result);

        /**
         * @brief  QueryPeopleInfo ��ȡ��Ա��Ϣ��
         * @since  V3.20190603
         *
         * @param cond ���������Ϣ
            example:
            {
                "lib_id":xx,    ����,int,�׿�id
                "person_id":xx, ����,int,��Աid
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0,
                "info":
                {
                    "person_id": 1, int,��Աid
                    "pic_id": 1, int, Ĭ����ʾͼƬid
                    "lib_id": 1, int,��Ա��id
                    "lib_name": "", string,��Ա����
                    "name": "", string,��Ա����
                    "english_name": "", string,Ӣ����
                    "gender": 1, int,�Ա�0:δ֪,1:��,2:Ů��
                    "age": 20, int,����
                    "nation": 0, int,����Id,̫�������ݿ��
                    "birthday": "", string,����
                    "credential_type": 0, int,֤�����ͣ�0:δ֪,1:���֤,2:����,3:�۰�ͨ��֤��
                    "credential_no": "", string,֤����
                    "phone": "", string,�绰
                    "mobile": "", string,�ֻ�
                    "email": "", string,E-Mail��ַ
                    "address": "", string,ͨѶ��ַ
                    "group": 2, int,�ڰ�����,�μ�<Whitelist>
                    "category": 0, int,��Ա���,0:δ����,����μ�����Ա��𡷽ӿ�
                    "speech": "", string,ӭ����
                    "area_list": [{"id":1, "name":"xx"}], json,�����б�������Ŀ��¥���б�
                    "pic_list": [{"pic_id":1, "pic_url":"xx"}], json-array,��ԱͼƬ�б�
                    "learn_pics": [{"pic_id":1, "pic_url":"xx"}], json-array,��ѧϰͼƬ�б�
                    "property": {}, json-object,��Ա����
                    "update_time": "xxxx", string,����ʱ��,����2017-03-02 20:02:02
                }
            }
            �ֶ�property�����������£�
            for Ա��
            {
                "company": "",      string,��˾����
                "dept_id": 1,       int,����id
                "department": "",   string,��������
                "position": "",     string,ְλ
                "empno": "",        string,����
                "hiredate": "",     string,��ְʱ��
                "rule_id": 1,       string,���ڹ���id
                "rule_name": ""     string,���ڹ�������
            }
            for VIP
            {
                "company": "",      string,��˾
                "department":"",    string,����
                "position": "",     string,ְλ
                "vip_level": "",    string,VIP�ȼ�
                "receive_department": "", string,�ԽӲ���
                "receiver_id": 1,   int,�Ӵ���id
                "receiver_name": "",string,�Ӵ�������
            }
            for �ÿ�
            {
                "company": "",              string,���ڵ�λ
                "purpose": "",              string,����Ŀ��
                "interviewed_company": "xx",    string,�ܷù�˾
                "interviewed_department": "xx", string,�ܷò���
                "interviewee_id": 0,        int,�ܷ���id
                "interviewee_name": "",     string,�ܷ�������
                "interviewee_phone": "",    string,�ܷ��˵绰
                "start_time": "",           string,��Чʱ��-��ʼʱ��
                "end_time": "",             string,��Чʱ��-����ʱ��
            }
            for ����
            {
                "department": "",   string,����
                "position": "",     string,ְλ
                "police_no": "",    string,����
            }
            for ����
            {
                "prisoner_no": "",  string,�������
            }
            for ҵ��
            {
                "room_no": "",      string,����
            }
            for ������Ա
            {
                "company": "",      string,������λ
                "position": "",     string,ְλ
            }
            for �䶾��Ա
            {
                "watch_no": "",         string,���ܱ��
                "company": "",          string,������λ
                "emergency_contact": "",string,������ϵ��
                "emergency_phone": "",  string,������ϵ�˵绰
            }
            for ̽����Ա
            {
                "company": "",      string,������λ
                "target": "",       string,̽�Ӷ���
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void QueryPeopleInfo(string cond, out string result);

        /**
         * @brief  QueryPeopleList ��ȡ��Ա�б�
         * @since  V3.20190616
         *
         * @param cond ���������Ϣ
            example:
            {
                "page_no": 1,       ����,int,ҳ��
                "page_size": 10,    ����,int,ÿҳ����
                "operator": "admin",����,string,������
                "query_cond": {
                    "category": 1,      ����,int,��Ա���,�μ�<PersonType>
                    "lib_id": 1,        ѡ��,int,�׿�id,Ĭ�ϲ�ѯ������Ա
                    "name": "",         ѡ��,string,��Ա����,֧��ģ����ѯ
                    "english_name": "", ѡ��,string,Ӣ����,֧��ģ����ѯ,����name�ǻ�Ĺ�ϵ��
                    "credential_no": "",ѡ��,string,֤����ɸѡ����,֧�־�ȷ��ѯ
                    "phone": "",        ѡ��,string,�ֻ���,֧�־�ȷ��ѯ
                    "dept_id": 1,       ѡ��,int,����id
                    "begin_time": "",   ѡ��,string,��ӵĿ�ʼʱ��
                    "end_time": "",     ѡ��,string,��ӵĽ���ʱ��
                    "company": "",      ѡ��,string,��λ
                    "police_no": "",    ѡ��,string,����
                    "target": "",       ѡ��,string,̽�Ӷ���
                }
            }
            �ֶ�query_cond�����������£�
            for Ա��
            {
                "category": 1,      ����,int,��Ա���,�μ�<PersonType>
                "lib_id": 1,        ѡ��,int,�׿�id,Ĭ�ϲ�ѯ������Ա
                "name": "",         ѡ��,string,��Ա����,֧��ģ����ѯ
                "english_name": "", ѡ��,string,Ӣ����,֧��ģ����ѯ,����name�ǻ�Ĺ�ϵ��
                "credential_no": "",ѡ��,string,֤����ɸѡ����,֧�־�ȷ��ѯ
                "phone": "",        ѡ��,string,�ֻ���,֧�־�ȷ��ѯ
                "dept_id": 1,       ѡ��,int,����id
                "rule_id": 1,       string,���ڹ���id
                "rule_name": ""     string,���ڹ�������
            }
            for VIP
            {
                "category": 2,      ����,int,��Ա���,�μ�<PersonType>
                "lib_id": 1,        ѡ��,int,�׿�id,Ĭ�ϲ�ѯ������Ա
                "name": "",         ѡ��,string,��Ա����,֧��ģ����ѯ
                "vip_level": "",    ѡ��,string,VIP�ȼ�
                "company": "",      ѡ��,string,��λ
                "dept_id": 1,       ѡ��,int,�Ӵ�����id
                "receiver": "",     ѡ��,string,�Խ���,֧�־�ȷ��ѯ
            }
            for �ÿ�
            {
                "category": 3,      ����,int,��Ա���,�μ�<PersonType>
                "lib_id": 1,        ѡ��,int,�׿�id,Ĭ�ϲ�ѯ������Ա
                "name": "",         ѡ��,string,��Ա����,֧��ģ����ѯ
                "credential_no": "",ѡ��,string,֤����ɸѡ����,֧�־�ȷ��ѯ
                "dept_id": 1,       ѡ��,int,�ܷò���id
                "begin_time": "",   ѡ��,string,��ӵĿ�ʼʱ��
                "end_time": "",     ѡ��,string,��ӵĽ���ʱ��
            }
            for ����
            {
                "category": 4,      ����,int,��Ա���,�μ�<PersonType>
                "lib_id": 1,        ѡ��,int,�׿�id,Ĭ�ϲ�ѯ������Ա
                "name": "",         ѡ��,string,��Ա����,֧��ģ����ѯ
                "credential_no": "",ѡ��,string,֤����ɸѡ����,֧�־�ȷ��ѯ
                "police_no": "",    ѡ��,string,����
            }
            for ����
            {
                "category": 5,      ����,int,��Ա���,�μ�<PersonType>
                "prisoner_no": "",  ѡ��,string,�������
            }
            for ҵ��
            {
                "category": 6,      ����,int,��Ա���,�μ�<PersonType>
                "lib_id": 1,        ѡ��,int,�׿�id,Ĭ�ϲ�ѯ������Ա
                "name": "",         ѡ��,string,��Ա����,֧��ģ����ѯ
                "credential_no": "",ѡ��,string,֤����ɸѡ����,֧�־�ȷ��ѯ
            }
            for ������Ա
            {
                "category": 7,      ����,int,��Ա���,�μ�<PersonType>
                "lib_id": 1,        ѡ��,int,�׿�id,Ĭ�ϲ�ѯ������Ա
                "name": "",         ѡ��,string,��Ա����,֧��ģ����ѯ
                "credential_no": "",ѡ��,string,֤����ɸѡ����,֧�־�ȷ��ѯ
                "phone": "",        ѡ��,string,�ֻ���,֧�־�ȷ��ѯ
                "company": "",      ѡ��,string,��λ
            }
            for �䶾��Ա
            {
                "category": 8,      ����,int,��Ա���,�μ�<PersonType>
                "lib_id": 1,        ѡ��,int,�׿�id,Ĭ�ϲ�ѯ������Ա
                "name": "",         ѡ��,string,��Ա����,֧��ģ����ѯ
                "credential_no": "",ѡ��,string,֤����ɸѡ����,֧�־�ȷ��ѯ
            }
            for ̽����Ա
            {
                "category": 9,      ����,int,��Ա���,�μ�<PersonType>
                "lib_id": 1,        ѡ��,int,�׿�id,Ĭ�ϲ�ѯ������Ա
                "name": "",         ѡ��,string,��Ա����,֧��ģ����ѯ
                "credential_no": "",ѡ��,string,֤����ɸѡ����,֧�־�ȷ��ѯ
                "phone": "",        ѡ��,string,�ֻ���,֧�־�ȷ��ѯ
                "target": "",       ѡ��,string,̽�Ӷ���
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0,
                "info":
                {
                    "page_no":1,
                    "page_size":10,
                    "total_count":100,
                    "items":[
                        {
                            "person_id": 1, int,��Աid
                            "pic_id": 1, int, Ĭ����ʾͼƬid
                            "pic_url": "", string, Ĭ����ʾͼƬurl
                            "lib_id": 1, int,��Ա��id
                            "lib_name": "", string,��Ա����
                            "name": "", string,��Ա����
                            "english_name": "", string,Ӣ����
                            "gender": 1, int,�Ա�0:δ֪,1:��,2:Ů��
                            "age": 20, int,����
                            "nation": 0, int,����Id,̫�������ݿ��
                            "birthday": "", string,����
                            "credential_type": 0, int,֤�����ͣ�0:δ֪,1:���֤,2:����,3:�۰�ͨ��֤��
                            "credential_no": "", string,֤����
                            "phone": "", string,�绰
                            "mobile": "", string,�ֻ�
                            "email": "", string,E-Mail��ַ
                            "address": "", string,ͨѶ��ַ
                            "group": 2, int,�ڰ�����,�μ�<Whitelist>
                            "category": 0, int,��Ա���,0:δ����,����μ�����Ա��𡷽ӿ�
                            "speech": "", string,ӭ����
                            "area_list": [{"id":1, "name":"xx"}], json,�����б�������Ŀ��¥���б�
                            "property": {}, json-object,��Ա����
                            "update_time": "xxxx", string,����ʱ��,����2017-03-02 20:02:02
                        },...
                    ]
                }
            }
            �ֶ�property��������μ�<QueryPeopleInfo>
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void QueryPeopleList(string cond, out string result);

        /**
         * @brief  AddPicture �����ԱͼƬ
         * @since  V3.20190603
         * @update V3.20200102 ����ͼƬid
         *
         * @param pic ��ԱͼƬ��Ϣ
            example: 
            {
                "person_id": 1 ,    ����,int,��Աid
                "pic_path": "",     ����,string,ͼƬ·��
                "pic_type": 0,      ѡ��,int,ͼƬ����,0:������ͼƬ,1:��ѧϰͼƬ,Ĭ��0
                "operator": "",     ѡ��,string,������
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0, "info": {"pic_id": 1}}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void AddPicture(string pic, out string result);

        /**
         * @brief  DeletePicture ɾ����ԱͼƬ
         * @since  V3.20190603
         *
         * @param pic ��ԱͼƬ��Ϣ
            example: 
            {
                "person_id": 1 ,    ����,int,��Աid
                "pic_id": 1 ,       ����,int,ͼƬid
                "operator": "",     ѡ��,string,������
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void DeletePicture(string pic, out string result);

        /**
         * @brief  SetDefaultPicture ����Ĭ��ͼƬ
         * @since  V3.20190604
         *
         * @param pic ��ԱͼƬ��Ϣ
            example: 
            {
                "person_id": 1 ,    ����,int,��Աid
                "pic_id": 1 ,       ����,int,ͼƬid
                "operator": "",     ѡ��,string,������
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void SetDefaultPicture(string pic, out string result);

        /**
         * @brief  BatchSetWhiteList �������úڰ�����
         * @since  V3.20190521
         *
         * @param persons ��Ա��Ϣ
            {
                "lib_id": 5,            ����,int,�׿�id
                "person_list": "1,2",   ����,string,��Աid�б�
                "group": 2,             ����,int,�ڰ�����,�μ�<Whitelist>
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void BatchSetWhiteList(string persons, out string result);

        /**
         * @brief  BatchSetWhiteListByLib �������úڰ�����
         * @since  V3.20190521
         *
         * @param libs ��Ա��Ϣ
            {
                "lib_list": "1,2",      ����,string,�׿�id�б�
                "group": 2,             ����,int,�ڰ�����,�μ�<Whitelist>
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void BatchSetWhiteListByLib(string libs, out string result);

        /**
         * @brief  QueryPersonBasicInfo ��ѯ��Ա������Ϣ��Ա����VIP���ÿ͵ȣ�
         * @since  V3.20190327
         *
         * @param cond ��ѯ����
            example:
            {
                "page_no": 1,               ����,int,ҳ��
                "page_size": 10,            ����,int,ҳ�ߴ�
                "query_cond": {
                    "lib_id": 1,            ѡ��,int,�׿�id
                    "name": "xx",           ѡ��,string,��Ա������֧��ģ��ƥ��
                }
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0,
                "info": {
                    "page_no": 1,       // int,ҳ��
                    "page_size": 10,    // int,ҳ�ߴ�
                    "items": [
                        {
                            "person_id": 1,     int,��Աid
                            "person_name": "xx",string,��Ա����
                            "lib_id": 1,        int,��Ա��id
                            "lib_name": "xx",   string,��Ա����
                            "pic_id": 1,        int,��ԱͼƬid
                            "pic_url": "xx",    string,ͼƬ·��
                            "gender": 1,        int,�Ա�1���У�2:Ů��
                            "phone": "xx",      string,�绰
                            "card_no": "xx",    string,���֤��
                            "create_time": "xx",string,�Ǽ�ʱ��
                        }
                    ]
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void QueryPersonBasicInfo(string cond, out string result);

        /**
         -----------------------------------------------------------------------
         �������
         -----------------------------------------------------------------------
        **/
        /**
         * @brief  AddGroup ���С�飨�����ű��飩
         * @since  V3.20180922
         * @update V3.20200102 ����С��id
         *
         * @param group С����Ϣ
            example:
            {
                "name": "",         ����,string,С������
                "lib_id": 1,        ����,int,�׿�id
                "type": 1,          ѡ��,int,С������:1:��ͨС��,2:���ű���,Ĭ��ֵ2
                "remark": "",       ѡ��,string,��ע
                "person_list": "",  ѡ��,string,��������Աid�б�,id֮���Զ��ŷָ�
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0, "info": {"group_id": 1}}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void AddGroup(string group, out string result);

        /**
         * @brief  RemoveGroup ɾ��С�飨�����ű��飩
         * @since  V3.20180922
         *
         * @param group С����Ϣ
            example:
            {
                "group_id":xx   ����,int,С��id
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void RemoveGroup(string group, out string result);

        /**
         * @brief  AppendGroupPerson ׷��С�飨�����ű��飩��Ա
         * @since  V3.20180922
         *
         * @param person ��Ա��Ϣ
            example:
            {
                "lib_id":xx         ����,int,�׿�id
                "group_id":xx       ����,int,С��id
                "person_list":xx,   ����,string,��������Աid�б�id֮���Զ��ŷָ�
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void AppendGroupPerson(string person, out string result);

        /**
         * @brief  ChangeGroupPerson ���С�飨�����ű��飩��Ա��Դ��������Ŀ������ͱ���һ�¡�
         * @since  V3.20180922
         *
         * @param person ��Ա��Ϣ
            example:
            {
                "s_group_id":xx     ����,int,ԴС��id
                "t_group_id":xx     ����,int,Ŀ��С��id
                "person_list":xx,   ����,string,��������Աid�б�id֮���Զ��ŷָ�
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void ChangeGroupPerson(string person, out string result);

        /**
         * @brief  RemoveGroupPerson �Ƴ�С�飨�����ű��飩��Ա
         * @since  V3.20180922
         *
         * @param person ��Ա��Ϣ
            example:
            {
                "group_id":xx       ����,int,С��id
                "person_list":xx,   ����,string,��������Աid�б�id֮���Զ��ŷָ�
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void RemoveGroupPerson(string person, out string result);

        /**
         * @brief  QueryGroupPerson ��ѯС�飨�����ű��飩��Ա�б�
         * @since  V3.20180922
         * @since  V3.20181018
         *
         * @param cond ���������Ϣ
            example:
            {
                "page_no":xx,       ����,int,ҳ��
                "page_size":xx      ����,int,ÿҳ����
                "operator": "admin",����,string,������
                "query_cond": {
                    "lib_id":xx,        ����,int,�׿�id
                    "group_id":xx,      ����,int,С��id��=0����ʾδ����,>0��С��id
                }
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0, 
                "info":
                {
                    "page_no":xx,
                    "page_size":xx,
                    "total_count":xx,
                    "items": [
                        {
                            "person_id": 1, int,��Աid
                            "person_name": "", string,��Ա����
                            "group_id": 1, int,С��id��0����ʾδ����
                            "group_name": "xxx",string,С������
                            "card_no": "", string,֤����
                            "gender": 1, int,�Ա� 0��δ֪,1����,2��Ů
                            "nation": 0, int,����id
                            "birthday": "", string,����
                            "phone": "", string,�绰
                            "pic_id": 1, int,��ԱͼƬid
                            "pic_url": "", string,ͼƬ·��
                            "group": 2 int,�ڰ�����,�μ�<Whitelist>
                            "category": 0, int,��Ա���,0:δ����
                        },...
                    ]
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void QueryGroupPerson(string cond, out string result);

        /**
         * @brief  QueryGroupList ��ѯС�飨�����ű��飩�б�
         * @since  V3.20180922
         *
         * @param cond ���������Ϣ
            example:
            {
                "page_no":xx,       ����,int,ҳ��
                "page_size":xx      ����,int,ÿҳ����
                "operator": "admin",����,string,������
                "query_cond": {
                    "lib_id":xx,        ����,int,�׿�id
                    "group_id":xx,      ѡ��,int,С��id��=0:��ʾδ����,>0:С��id,δ��ʱ:��ʾ��ѯС���δ�����������Ϣ
                    "group_name":xx,    ѡ��,string,���������֧��ģ����ѯ
                }
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0, 
                "info":
                {
                    "page_no":xx,
                    "page_size":xx,
                    "total_count":xx,
                    "items": [
                        {
                            "group_id": 1,      int,С��id��0����ʾδ����
                            "group_name": "xxx",string,С������
                            "lib_id": 1,        int,�׿�id
                            "lib_name": "xxx",  string,�׿�����
                            "type": 1,          int,С������:1:��ͨС��,2:���ű���
                            "remark": "xxx",    string,��ע
                            "person_count": 3,  int,����
                            "create_time": "xx",string,����ʱ��
                        },...
                    ]
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void QueryGroupList(string cond, out string result);

        /**
         -----------------------------------------------------------------------
         İ���˹���
         -----------------------------------------------------------------------
        **/
         /**
         * @brief  DeleteStranger ɾ��İ������Ϣ
         * @since  V3.20190711
         *
         * @param person İ������Ϣ
            example: 
            {
                "stranger_id":"", ����,string,İ���˱��
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void DeleteStranger(string person, out string result);

        /**
         * @brief  BatchDeleteStranger ����ɾ��İ������Ϣ��
         * @since  
         *
         * @param batch ����ɾ������
            example: 
            {
                "stranger_id_list": "1,2,3"      ����,string,İ���˱���б�
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void BatchDeleteStranger(string batch, out string result);

        /**
         * @brief  QueryStrangerList ��ѯİ������Ϣ�б�
         * @since  
         *
         * @param cond ���������Ϣ
            example:
            {
                "page_no": 1,       ����,int,ҳ��
                "page_size": 10,    ����,int,ÿҳ����
                "operator": "admin",����,string,������
                "query_cond": {
                    "stranger_id": "",      ѡ��,string,İ���˱��
                    "begin_time": "xx",     ѡ��,string,��ʼʱ�䣬��ʽ��YYYY-MM-DD HH:mm:ss
                    "end_time": "xx",       ѡ��,string,����ʱ�䣬��ʽ��YYYY-MM-DD HH:mm:ss
                }
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0, 
                "info": {
                    "page_no":xx,
                    "page_size":xx,
                    "total_count":xx,
                    "items": [
                        {
                            "stranger_id": "", string,İ���˱��
                            "pic_url": "", string,ͼƬ·��
                            "create_time": "xxxx", string,����ʱ��,����2017-03-02 20:02:02
                            "last_capture_time": "xxxx", string,���ץ��ʱ��,����2017-03-02 20:02:02
                        }, ...
                    ]
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void QueryStrangerList(string cond, out string result);

        /**
         -----------------------------------------------------------------------
         �ÿ͹����ÿͻ��ӿڣ�
         -----------------------------------------------------------------------
        **/
        /**
         * @brief  RegisterVisitor �ÿ���Ϣ�Ǽ�
         * @since  V3.20181018
         * @since  V3.20181128 ����Ӣ����
         * @update V3.20190308 �����ܷò���id
         *
         * @param visitor �ÿ���Ϣ
            example: 
            {
                "lib_id": 1,                ����,int,�׿�id
                "area_list": "1,2",         ����,string,����id�б�id֮���Զ��ŷָ���������Ŀ��¥��id�б�
                "pic_path": "",             ����,string,ͼƬ·��
                "name": "",                 ����,string,��Ա����
                "english_name": "",         ѡ��,string,Ӣ����
                "gender": 1 ,               ѡ��,int,�Ա�1���У�2:Ů��
                "phone": "",                ѡ��,string,�绰
                "nation": 0,                ѡ��,int,����Id,̫�������ݿ��
                "birthday": "",             ѡ��,string,����
                "card_no": "",              ѡ��,string,���֤��
                "company": "",              ѡ��,string,���ڵ�λ
                "address": "",              ѡ��,string,סַ
                "speech": "",               ѡ��,string,ӭ����
                "visiting_purpose": "",     ѡ��,string,����Ŀ��
                "interviewer": "",          ѡ��,string,�ܷ���
                "valid_begin_time": "",     ѡ��,string,��Чʱ��-��ʼʱ��
                "valid_end_time": "",       ѡ��,string,��Чʱ��-����ʱ��
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void RegisterVisitor(string visitor, out string result);

        /**
         * @brief  QueryVisitorList ��ѯ�ÿͼ�¼
         * @since  V3.20181018
         * @since  V3.20181128 ����Ӣ����
         * @update V3.20190308 �����ܷò��Ų�ѯ����
         *
         * @param cond ��ѯ����
            example:
            {
                "page_no": 1,               ����,int,ҳ��
                "page_size": 10,            ����,int,ҳ�ߴ�
                "query_cond": {
                    "lib_id": 1,            ѡ��,int,�׿�id
                    "lib_name": "xx",       ѡ��,string,�׿�����֧�־�ȷƥ��
                    "name": "xx",           ѡ��,string,��Ա������֧��ģ��ƥ��
                    "card_no": "xx",        ѡ��,string,֤����ɸѡ������֧�־�ȷ��ѯ
                    "dept_id": 1,           ѡ��,int,�ܷò���
                    "begin_time": "xx",     ѡ��,string,��ʼʱ�䣬��ʽ��YYYY-MM-DD HH:mm:ss
                    "end_time": "xx",       ѡ��,string,����ʱ�䣬��ʽ��YYYY-MM-DD HH:mm:ss
                    "flag": 1,              ѡ��,int,��ѯ���,1:��ѯ�ÿͼ�¼,2:��ѯ�ÿ���ʷ��¼,3:��ѯ���м�¼,Ĭ��1
                }
                "order_rule": {
                    "time_acs": true        ѡ��,bool,ʱ������
                }
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0,
                "info": {
                    "page_no": 1,       // int,ҳ��
                    "page_size": 10,    // int,ҳ�ߴ�
                    "total_count": 1,   // int,����
                    "items": [
                        {
                            "id": 1,            int,��¼id
                            "person_id": 1,     int,��Աid
                            "name": "xx",       string,��Ա����
                            "english_name": "", string,Ӣ����
                            "lib_id": 1,        int,��Ա��id
                            "lib_name": "xx",   string,��Ա����
                            "pic_id": 1,        int,��ԱͼƬid
                            "pic_url": "xx",    string,ͼƬ·��
                            "gender": 1,        int,�Ա�1���У�2:Ů��
                            "phone": "xx",      string,�绰
                            "nation": 0,        int,����Id
                            "birthday": "xx",   string,����
                            "card_no": "xx",    string,���֤��
                            "company": "xx",    string,���ڵ�λ
                            "address": "xx",    string,סַ
                            "speech": "xx",     string,ӭ����
                            "area_list": [{"id":1, "name":"xx"}],   json,�����б�������Ŀ��¥���б�
                            "visiting_company": "xx",       string,�ܷù�˾
                            "visiting_dept_id": 1,          int,�ܷò���id
                            "visiting_department": "xx",    string,�ܷò���
                            "visiting_purpose": "xx",       string,����Ŀ��
                            "interviewer": "xx",            string,�ܷ���
                            "interviewer_phone": "",        string,�ܷ��˵绰
                            "valid_begin_time": "",         string,��Чʱ��-��ʼʱ��
                            "valid_end_time": "",           string,��Чʱ��-����ʱ��
                            "create_time": "xx",            string,�Ǽ�ʱ��
                        }
                    ]
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void QueryVisitorList(string cond, out string result);

        /**
         -----------------------------------------------------------------------
         �������
         -----------------------------------------------------------------------
        **/
        /**
         * @brief  AddArea ���������Ϣ��������Ŀ��¥����Ϣ��
         * @since  V3.20181018
         * @since  V3.20190606
         * @update V3.20200102 ��������id
         * @update V3.20200609 �����֯id
         *
         * @param area ������Ϣ��������Ŀ��¥����Ϣ��
            example: 
            {
                "name": "xx",       ����,string,�������ƣ�������Ŀ��¥�����ƣ�
                "org_id": 1,        ����,int,��֯id
                "parent_id": 0,     ѡ��,int,��������id
                "remark": "xx",     ѡ��,string,��ע
                "operator": "xx"    ѡ��,string,�����ߣ�Ҳ�Ǵ����ߣ�����ǰ��¼�û���
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0, "info": {"area_id": 1}}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void AddArea(string area, out string result);

        /**
         * @brief  UpdateArea �޸�������Ϣ��������Ŀ��¥����Ϣ��
         * @since  V3.20181018
         * @since  V3.20190606
         *
         * @param area ������Ϣ��������Ŀ��¥����Ϣ��
            example: 
            {
                "area_id": 1        ����,int,����id
                "name": "xx",       ����,string,�������ƣ�������Ŀ��¥�����ƣ�
                "parent_id": 0,     ѡ��,int,��������id
                "remark": "xx",     ѡ��,string,��ע
                "operator": "xx"    ѡ��,string,�����ߣ�����ǰ��¼�û���
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void UpdateArea(string area, out string result);

        /**
         * @brief  DeleteArea ɾ��������Ϣ��������Ŀ��¥����Ϣ��
         * @since  V3.20181018
         * @since  V3.20190606
         *
         * @param area ��Ա��Ϣ
            example: 
            {
                "area_id": 5,   ����,int,����id
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void DeleteArea(string area, out string result);

        /**
         * @brief  QueryAreaList ��ѯ�����б�
         * @since  V3.20181018
         * @since  V3.20190606
         * @update V3.20200609 �����֯��Ϣ
         *
         * @param cond ��ѯ����
            example:
            {
                "page_no": 1,               ����,int,ҳ��
                "page_size": 10,            ����,int,ҳ�ߴ�
                "org_id": 1,                ����,int,��֯id
                "query_cond": {
                    "name":xx,              ѡ��,string,�������ƣ�֧��ģ����ѯ��
                    "area_id": 0,           ѡ��,int,����id
                    "level": 0,             ѡ��,int,�㼶,=0:ȫ��,>0:�㼶
                    "parent_id": 0,         ѡ��,int,��������id
                    "begin_time": "xxxx",   ѡ��,string,��ʼʱ�䣬��ʽ��YYYY-MM-DD HH:mm:ss
                    "end_time": "xxxx",     ѡ��,string,����ʱ�䣬��ʽ��YYYY-MM-DD HH:mm:ss
                }
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0,
                "info": {
                    "page_no": 1,       // int,ҳ��
                    "page_size": 10,    // int,ҳ�ߴ�
                    "total_count": 1,   // int,����
                    "items": [
                        {
                            "area_id": 1,           int,����id
                            "name": "xx",           string,�������ƣ�������Ŀ��¥�����ƣ�
                            "parent_id": 0,         int,��������id
                            "parent_name": "",      string,������ǩ��
                            "level": 0,             int,�㼶
                            "remark": "xx",         string,��ע
                            "create_time": "xxxx"   string,����ʱ��
                        }
                    ]
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void QueryAreaList(string cond, out string result);

         /**
         * @brief  QueryAreaTree ��ѯ�����б���
         * @since  V3.20190708
         * @update V3.20200609 ������֯id
         *
         * @param cond ��ѯ����
            example:
            {
                "org_id": 1,        ����,int,��֯id
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0,
                "info": {
                    "childs": [
                        {
                            "area_id": 1,           int,����id
                            "name": "xx",           string,�������ƣ�������Ŀ��¥�����ƣ�
                            "parent_id": 0,         int,��������id
                            "level": 0,             int,�㼶
                            "remark": "xx",         string,��ע
                            "childs": [...]         json-array,������
                        },...
                    ]
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void QueryAreaTree(string cond, out string result);

        /**
         -----------------------------------------------------------------------
         ��ǩ����
         -----------------------------------------------------------------------
        **/
        /**
         * @brief  AddLabel ��ӱ�ǩ��Ϣ
         * @since  V3.20190606
         * @update V3.20200102 ���ر�ǩid
         *
         * @param label ��ǩ��Ϣ
            example: 
            {
                "name": "xx",       ����,string,��ǩ����
                "type": 0,          ����,int,��ǩ����,1:���񼶱�ǩ,2:ͣ������ǩ
                "parent_id": 0,     ѡ��,int,������ǩid
                "area_list": "1,2", ѡ��,string,�󶨵�����id�б�,id֮���Զ��ŷָ�
                "condition": "{}",  ѡ��,json-string,��ǩ��������
                "remark": "xx",     ѡ��,string,��ע
                "operator": "xx"    ѡ��,string,������,Ҳ�Ǵ�����,����ǰ��¼�û���
            }
            ���� condition:
                {
                    "min_stay_time": 5, ѡ��,int,����,ͣ������ǩ����
                }"
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0, "info": {"label_id": 1}}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void AddLabel(string label, out string result);

        /**
         * @brief  UpdateLabel �޸ı�ǩ��Ϣ
         * @since  V3.20190606
         *
         * @param Label 
            example: 
            {
                "label_id": 1       ����,int,��ǩid
                "name": "xx",       ����,string,��ǩ����
                "type": 0,          ����,int,��ǩ����,1:���񼶱�ǩ,2:ͣ������ǩ
                "parent_id": 0,     ѡ��,int,������ǩid
                "area_list": "1,2", ѡ��,string,�󶨵�����id�б�,id֮���Զ��ŷָ�
                "condition": "{}",  ѡ��,json-object,��ǩ��������
                "remark": "xx",     ѡ��,string,��ע
                "operator": "xx"    ѡ��,string,������,����ǰ��¼�û���
            }
            ���� condition:
                {
                    "min_stay_time": 5, ѡ��,int,����,ͣ������ǩ����
                }"
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void UpdateLabel(string label, out string result);

        /**
         * @brief  DeleteLabel ɾ����ǩ��Ϣ
         * @since  V3.20190606
         *
         * @param label ��ǩ��Ϣ
            example: 
            {
                "label_id": 5,  ����,int,��ǩid
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void DeleteLabel(string label, out string result);

        /**
         * @brief  QueryLabelList ��ѯ��ǩ�б�
         * @since  V3.20190606
         *
         * @param cond ��ѯ����
            example:
            {
                "page_no": 1,               ����,int,ҳ��
                "page_size": 10,            ����,int,ҳ�ߴ�
                "query_cond": {
                    "name": xx,             ѡ��,string,��ǩ���ƣ�֧��ģ����ѯ��
                    "label_id": 0,          ѡ��,int,��ǩid
                    "parent_id": 0,         ѡ��,int,������ǩid
                    "level": 0,             ѡ��,int,�㼶,=0:ȫ��,>0:�㼶
                    "begin_time": "xxxx",   ѡ��,string,��ʼʱ�䣬��ʽ��YYYY-MM-DD HH:mm:ss
                    "end_time": "xxxx",     ѡ��,string,����ʱ�䣬��ʽ��YYYY-MM-DD HH:mm:ss
                }
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0,
                "info": {
                    "page_no": 1,       // int,ҳ��
                    "page_size": 10,    // int,ҳ�ߴ�
                    "total_count": 1,   // int,����
                    "items": [
                        {
                            "label_id": 1,          int,��ǩid
                            "name": "xx",           string,��ǩ����
                            "type": 0,              int,��ǩ����,1:���񼶱�ǩ,2:ͣ������ǩ
                            "parent_id": 0,         int,������ǩid
                            "parent_name": "",      string,������ǩ��
                            "level": 0,             int,�㼶
                            "area_list": [ {"area_id": 1, "area_name": "xx" ],   json-array,�󶨵�������Ϣ�б�
                            "condition": "{}",      json-object,��ǩ�������� 
                            "remark": "xx",         string,��ע
                            "creator": "xx",        string,������
                            "create_time": "xxxx"   string,����ʱ��
                        }
                    ]
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void QueryLabelList(string cond, out string result);

        /**
         * @brief  QueryLabelTree ��ѯ��ǩ�б���
         * @since  V3.20190708
         *
         * @param cond ��ѯ����
            example:
            {
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0,
                "info": {
                    "childs": [
                        {
                            "label_id": 1,          int,��ǩid
                            "name": "xx",           string,��ǩ����
                            "type": 0,              int,��ǩ����,1:���񼶱�ǩ,2:ͣ������ǩ
                            "parent_id": 0,         int,������ǩid
                            "level": 0,             int,�㼶
                            "area_list": "1,2",     string,�󶨵�����id
                            "condition": "{}",      json����,��ǩ�������� 
                            "remark": "xx",         string,��ע
                            "childs": [...]         json-array,�ӱ�ǩ
                        }
                    ]
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void QueryLabelTree(string cond, out string result);

        /**
         -----------------------------------------------------------------------
         ���Ź���
         -----------------------------------------------------------------------
        **/
        /**
         * @brief  AddDepartment ��Ӳ�����Ϣ
         * @since  V3.20190308
         * @update V3.20200102 ���ز���id
         * @update V3.20200609 �����֯id
         *
         * @param dept ������Ϣ
            example: 
            {
                "name": "xx",       ����,string,��������
                "org_id": 1,        ����,int,��֯id
                "remark": "xx",     ѡ��,string,��ע
                "operator": "xx"    ѡ��,string,������,Ҳ�Ǵ�����,����ǰ��¼�û���
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0, "info": {"dept_id": 1}}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void AddDepartment(string dept, out string result);

        /**
         * @brief  UpdateDepartment ���²�����Ϣ
         * @since  V3.20190308
         *
         * @param dept ������Ϣ
            example: 
            {
                "dept_id": 1,       ����,int,����id
                "name": "xx",       ����,string,��������
                "remark": "xx",     ѡ��,string,��ע
                "operator": "xx"    ѡ��,string,������,Ҳ�Ǵ�����,����ǰ��¼�û���
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void UpdateDepartment(string dept, out string result);

        /**
         * @brief  DeleteDepartment ɾ��������Ϣ
         * @since  V3.20190308
         *
         * @param dept ������Ϣ
            example: 
            {
                "dept_id": 5,       ����,int,����id
                "operator": "xx"    ѡ��,string,������,Ҳ�Ǵ�����,����ǰ��¼�û���
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void DeleteDepartment(string dept, out string result);

        /**
         * @brief  QueryDepartmentList ��ѯ������Ϣ��
         * @since  V3.20190308
         * @update V3.20200609 �����֯��Ϣ
         *
         * @param cond ���������Ϣ
            example:
            {
                "page_no": 1,       ����,int,ҳ��
                "page_size": 10,    ����,int,ÿҳ����
                "org_id": 1,        ����,int,��֯id
                "operator": "admin",����,string,������
                "query_cond": {
                    "name": "",     ѡ��,string,��������,֧��ģ����ѯ
                }
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0, 
                "info": {
                    "page_no":xx,
                    "page_size":xx,
                    "total_count":xx,
                    "items": [
                        {
                            "dept_id": 1,           int,����id
                            "name": "xx",           string,��������
                            "org_id": 1,            int,��֯id
                            "organization_id": "",  string,��֯��
                            "remark": "xx",         string,��ע
                            "creator": "xx",        string,������
                            "create_time": "xxxx",  string,����ʱ��
                            "update_time": "xxxx"   string,����ʱ��
                        }, ...
                    ]
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void QueryDepartmentList(string cond, out string result);

        /**
         -----------------------------------------------------------------------
         ӭ�������
         -----------------------------------------------------------------------
        **/
        /**
         * @brief  AddWelcomeWord ���ӭ���
         * @since  V3.20180922
         * @update V3.20200102 ����ӭ����id
         *
         * @param word ӭ������Ϣ
            example:
            {
                "type":xx,      ����,int,���ͣ�0:none,1:employee,2:manager,3:visitor,4:stranger��
                "word":xx       ����,string,ӭ�����ִ�
                "enabled":xx,   ѡ��,bool,ʹ��
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0, "info": {"id": 1}}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void AddWelcomeWord(string word, out string result);

        /**
         * @brief  EnableWelcomeWord ����ӭ����ʹ�ܡ�
         * @since  V3.20180922
         *
         * @param word ӭ������Ϣ
            example:
            {
                "id":xx,        ����,int,ӭ����id
                "enabled":xx,   ����,bool,ʹ��
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void EnableWelcomeWord(string word, out string result);

        /**
         * @brief  DeleteWelcomeWord ɾ��ӭ���
         * @since  V3.20180922
         *
         * @param word ӭ������Ϣ
            example:
            {
                "id":xx,        ����,int,ӭ����id
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void DeleteWelcomeWord(string word, out string result);

        /**
         * @brief  QueryWelcomeWord ��ѯ����ӭ���
         * @since  V3.20180922
         *
         * @param cond ���������Ϣ<����>
            example:
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0, 
                "info":
                {
                    "items": [
                        {
                            "id":xx,            int,ӭ����id
                            "type":xx,          int,���ͣ�0:none,1:employee,2:manager,3:visitor,4:stranger��
                            "word":xx           string,ӭ����
                            "enabled":xx,       bool,ӭ����ʹ��
                            "create_time":xx,   string,����ʱ��
                        },...
                    ]
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void QueryWelcomeWord(string cond, out string result);

        /**
         * @brief  QueryEnableWelcomeWord ��ѯ��ǰ���õ�ӭ���
         * @since  V3.20180922
         *
         * @param cond ���������Ϣ<����>
            example:
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0, 
                "info":
                {
                    "items": [
                        {
                            "id":xx,            int,ӭ����id
                            "type":xx,          int,���ͣ�0:none,1:employee,2:manager,3:visitor,4:stranger��
                            "word":xx           string,ӭ����
                            "enabled":xx,       bool,ӭ����ʹ��
                            "create_time":xx,   string,����ʱ��
                        },...
                    ]
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void QueryEnableWelcomeWord(string cond, out string result);

        /**
         -----------------------------------------------------------------------
         �׿���ԱѶϢ����
         -----------------------------------------------------------------------
        **/
        /**
         * @brief  AddGroupMessage �����û���ѶϢ
         * @since  V3.20190308
         * @update V3.20200102 ������Ϣ���
         * @update V3.20200525 ���Ӳ���Ա�ֶ�
         *
         * @param message �û���ѶϢ��
            example: 
            {
                "lib_list": "1,2",     ����,string,�׿��б�,id֮ǰ�Զ��ŷָ�
                "message": "xxx",      ����,string,ӭ����
                "operator": "",        ����,string,����Ա
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0, "info": {"msg_id": 1}}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void AddGroupMessage(string message, out string result);

        /**
         * @brief  UpdateGroupMessage �����û���ѶϢ
         * @since  V3.20190308
         *
         * @param message �û���ѶϢ
            example: 
            {
                "msg_id": 0,           ����,int,���
                "lib_list": "1,2",     ����,string,�׿��б�,id֮ǰ�Զ��ŷָ�
                "message": "xxx",      ����,string,ӭ����
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void UpdateGroupMessage(string message, out string result);

        /**
         * @brief  DeleteGroupMessage ɾ���û���ѶϢ
         * @since  V3.20190308
         *
         * @param message �û���ѶϢ
            example: 
            {
                "msg_id":0,        ����,int,���
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void DeleteGroupMessage(string message, out string result);

        /**
         * @brief  QueryGroupMessageList ��ѯ�û���ѶϢ
         * @since  V3.20190308
         * @update V3.20200525 ���Ӳ���Ա�ֶ�
         *
         * @param cond ��ѯ����
            {
                "page_no": 1,           ����,int,ҳ��,Ĭ��1
                "page_size": 10,        ����,int,ҳ��С,��Ч������10,20,30,40,50
                "operator": "",         ����,string,����Ա
            }
         * @param result �ɹ���ʧ�ܡ�
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0,
                "info":
                {
                    "page_no": 1,
                    "page_size": 10,
                    "total_count": 100,
                    "items": [
                        {
                            "msg_id": 0,        // int,���
                            "message": "xxx",   // string,ӭ����
                            "lib_list": [{"id":1, "name":"xx"}]  // json,�׿��б�
                        }
                    ]
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void QueryGroupMessageList(string cond, out string result);

        /**
         -----------------------------------------------------------------------
         ����ѶϢ����
         -----------------------------------------------------------------------
        **/
        /**
         * @brief  AddPersonalMessage ��������ѶϢ
         * @since  V3.20190308
         *
         * @param message ����ѶϢ��
            example: 
            {
                "person_list": [
                        {"lib_id":1,"person_id":2}
                    ],                  ����,json,��Ա�б�
                "show_period": 1,       ����,int,��ʾ����,1:1��,2:1��,3:3��,4:7��,5:����
                "message": "xxx",       ����,string,ӭ����
                "operator": "admin"     ����,string,������
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void AddPersonalMessage(string message, out string result);

        /**
         * @brief  UpdatePersonalMessage ���¸���ѶϢ
         * @since  V3.20190308
         *
         * @param message ����ѶϢ
            example: 
            {
                "msg_id": 0,            ����,int,���
                "show_period": 1,       ����,int,��ʾ����,1:1��,2:1��,3:3��,4:7��,5:����
                "message": "xxx",       ����,string,ӭ����
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void UpdatePersonalMessage(string message, out string result);

        /**
         * @brief  DeletePersonalMessage ɾ������ѶϢ
         * @since  V3.20190308
         *
         * @param message ����ѶϢ
            example: 
            {
                "msg_id":0,        ����,int,���
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void DeletePersonalMessage(string message, out string result);

        /**
         * @brief  QueryPersonalMessageList ��ѯ����ѶϢ
         * @since  V3.20190308
         *
         * @param cond ��ѯ����
            {
                "page_no": 1,           ����,int,ҳ��,Ĭ��1
                "page_size": 10,        ����,int,ҳ��С,��Ч������10,20,30,40,50
                "operator": "admin",    ����,string,������
                "query_cond": {
                    "person_name": "",      ѡ��,string,��Ա����
                }
            }
         * @param result �ɹ���ʧ�ܡ�
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0,
                "info":
                {
                    "page_no": 1,
                    "page_size": 10,
                    "total_count": 100,
                    "items": [
                        {
                            "msg_id": 0,        // int,���
                            "person_id": 1,     // int,��Աid
                            "person_name": "",  // string,��Ա����
                            "lib_id": 1,        // int,�׿�id
                            "lib_name": "",     // string,�׿�����
                            "message": "xxx",   // string,ӭ����
                            "show_period": 1,   // int,��ʾ����,1:1��,2:1��,3:3��,4:7��,5:����
                            "shown": 0,         // int,�Ƿ���չʾ,0:δչʾ,1:��չʾ
                            "creator": "sfd",   // string,������
                            "create_time": "2019-03-23 00:12:12",   // string,����ʱ��
                            "update_time": "2019-03-23 00:12:12"    // string,����ʱ��
                        }
                    ]
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void QueryPersonalMessageList(string cond, out string result);

        /**
         -----------------------------------------------------------------------
         ����ͷ����
         -----------------------------------------------------------------------
        **/
        /**
         * @brief  AddCamera �������ͷ
         * @since  V3.20190919
         * @update V3.20200102 ��������ͷid
         * @update V3.20200324 ����֧��˫���������Ƶ��+���壩
         * @update V3.20200421 �����豸�����ص�ID
         * @update V3.20200529 �����豸������֯ID
         * @update V3.20200703 �޸�����ͷ������Ϣ attribute
         *
         * @param camera ��ƵԴ��Ϣ����������ͷ������ץ�Ļ����ȣ��μ���CameraType����
            example:
            {
                "name": "n1",       ����,string,����ͷ������Ҫ���������Ż������ַ���!@#$%^&*([{}])_+|~-=\`;:'",<.>/?
                "type": 1,          ����,int,���ͣ��μ���CameraType��
                "rtsp": "rtsp://xx",����,string,ȡ����ַ
                "rotate_angle": 32.0,ѡ��,float,��ת�Ƕȣ���Χ[-180.0, 180.0]��û�д��ֶΣ����ֶ���Ч��ֻ��ʾ��ת�Ƕ�Ϊ0��
                "location": "East"  ѡ��,string,����λ��
                "additional": "{}", ѡ��,json-string,������Ϣ��
                "global": true,     ѡ��,bool,ʹ��ȫ����������,true��ʾʹ��ȫ������,false��ʾʹ��˽������
                "attribute": "{}",  ѡ��,json-string,json��ʽ�������ֶΡ�
                "area_id": 1,       ѡ��,int,�󶨵�����id��
                "remark": "xxx",    ѡ��,string,��ע��
                "operator": "xx",   ѡ��,string,��ǰ��¼���û�����
                "site_id":1,        ����,int �豸�����ص�id
                "org_id":1          ����,int ��֯id
            }
                ���ֶΡ� additional ȡֵ:
                ����ץ�Ļ���˫�����
                {
                    "manufacturer": 0,      // �豸���̣��μ���CameraMfrsType��
                    "ip": "192.168.1.10",   // �豸ip
                    "port": 8000,           // �豸SDK��¼�˿�,����:8000,
                    "uuid": "umet9cxrtui9", // �豸UUID,����ģʽ����,
                    "username": "admin",    // �豸SDK��¼�û���
                    "password": "123",      // �豸SDK��¼����
                    "thermography_rtsp":""  // ��������ͷ����ַ (������ͷΪ8358˫�����ʱ��д)
                }
                ���ֶΡ� attribute ȡֵ:
                {
                    "resize_facephoto_width" : 0,      //ץ���չ̶��ߴ�,���Ϊ0,�򲻽��гߴ�ѹ�� 
                    "capture_strategy" : 6,            //ץ�Ĳ���,�μ�<ECaptureStrategy>
                    "capture_interval": 3000,          //ץ�ļ������λms
                    "detect_interval": 5,              //�������ÿ������֡�����һ֡��
                    "keypoints_confidence": 6.0,       //���������÷���ֵ[0.0-100.0],һ��ȡֵ6.0
                    "video_codec": 0,                  //���뷽ʽ,�μ�<CodecType>
                    "detectface_threshold":0.9         //������Ŷ���ֵ ȡֵ[0.0-1.0]
                    "definition_threshold":0.0,        //��������ֵ ȡֵ[0.0-1.0]
                    "facerange_scale": 1.5,            //�����������
                    "scene_scale":1.0,                 //ȫͼ���ű���
                    "min_face_size": 40,               //��С������̱߳���
                    "skip_frame_interval":1            //������֡,ÿ������֡,����һ֡
                }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0, "info": {"id": 1}}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void AddCamera(string camera, out string result);

        /**
         * @brief  UpdateCamera ��������ͷ
         * @since  V3.20190919
         * @update V3.20200421 �����豸��������ID
         *
         * @param camera ��ƵԴ��Ϣ����������ͷ������ץ�Ļ����ȡ�
            example:
            {
                "id": 1,            ����,����ͷid��������
                "name": "n1",       ����,string,����ͷ������Ҫ���������Ż������ַ���!@#$%^&*([{}])_+|~-=\`;:'",<.>/?
                "type": 1,          ����,int,���ͣ��ֶβ����޸ģ����μ���CameraType��
                "rtsp": "rtsp://xx",����,string,ȡ����ַ
                "rotate_angle": 32.0,ѡ��,float,��ת�Ƕȣ���Χ[-180.0, 180.0]��û�д��ֶΣ����ֶ���Ч��ֻ��ʾ��ת�Ƕ�Ϊ0��
                "location": "East"  ѡ��,string,����λ��
                "additional": "{}", ѡ��,json-string,������Ϣ��
                "global": true,     ѡ��,bool,ʹ��ȫ����������,true��ʾʹ��ȫ������,false��ʾʹ��˽������
                "area_id": 1,       ѡ��,int,�󶨵�����id��
                "attribute": "{}",  ѡ��,json-string,json��ʽ�������ֶΡ�
                "remark": "xxx",    ѡ��,string,��ע��
                "operator": "xx",   ѡ��,string,��ǰ��¼���û�����
                "site_id":1,        ѡ��,int �豸�����ص�id
            }
            // json�ֶ�����μ� AddCamera
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void UpdateCamera(string camera, out string result);
        
        /**
         * @brief  SetInfraredLightParam ����˫������ͷ������Ϣ
         * @since  V3.20200507
         *
         * @param param ������Ϣ
            example:
            {
                "id": 1,                        //����,˫������ͷid
                "blackbody_x": -1,              //����x���� ���<0������
                "blackbody_y":-1,               //����y���� ���<0������
                "infrared_width" : xxx,         //�������
                "infrared_hight" : xxx,         //�����߶�
                "blackbody_temperature" : 36.5, //�����¶�
                "expansion_coefficient" : 1.0,  //��Ժ����Ŀ�ߵ���չϵ��
                "center_shifting_x" : 0,        //���ĵ�x����ƫ��λ��
                "center_shifting_y" : 0         //���ĵ�y����ƫ��λ��
                "visilight_calibrat_x" : 0,     //�ɼ���궨��x����
                "visilight_calibrat_y" : 0,     //�ɼ���궨��y����
                "infrared_calibrat_x" : 0,      //�����궨��x����
                "infrared_calibrat_y" : 0,      //�����궨��y����
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void SetInfraredLightParam(string param, out string result);

        /**
         * @brief  EnableGlobalForCamera ʹ������ͷ��ȫ������
         * @since  V3.20190919
         *
         * @param camera ��ƵԴ��Ϣ
            example:
            {
                "id": 1,            ����,����ͷid��������
                "enabled": true,    ����,ʹ��
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void EnableGlobalForCamera(string camera, out string result);

        /**
         * @brief  DeleteCamera ɾ������ͷ��
         * @since  V3.20190919
         *
         * @param camera ��ƵԴ��Ϣ
            example:
            {
                "id": 2,            ����,int,����id
                "operator": "xx"    ѡ��,string,������
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void DeleteCamera(string camera, out string result);

        /**
         * @brief  QueryCameraList ��ѯ����ͷ�б�
         * @since  V3.20190919
         * @update V3.20200421 �����豸��������ID
         *
         * @param cond ��ѯ������
            example:
            {
                "page_no": 1,       ����,int,ҳ��
                "page_size": 10,    ����,int,ҳ�ߴ�
                "operator": "admin",����,string,������
                "org_id":1,         ����,int,������֯id
                "query_cond": {
                    "type": 1,          ѡ��,int,���ͣ��μ���CameraType��
                    "name": "xx"        ѡ��,string,����ͷ���ƣ�֧��ģ��ƥ��
                    "area_id": 1,       ѡ��,int,�󶨵�����id��
                    "type_list": "",    ѡ��,string,�����б�,��type��Чʱ,���ֶβ�������
                    "siteid_list":"",   ѡ��,String,�豸�����ص�id�б�
                    "site_list":""      ѡ��,String,�豸�����ص�id�б�
                }
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0,
                "info": {
                    "page_no": 1,
                    "page_size": 10,
                    "total_count": 103,
                    "items": [
                        {
                            "id": 1,            //int,����ͷid
                            "name": "n1",       //string,����ͷ������Ҫ���������Ż������ַ���!@#$%^&*([{}])_+|~-=\`;:'",<.>/?
                            "type": 1,          //int,���ͣ��μ���CameraType��
                            "rtsp": "rtsp://xx",//string,ȡ����ַ
                            "rotate_angle": 32.0,//float,��ת�Ƕȣ���Χ[-180.0, 180.0]��û�д��ֶΣ����ֶ���Ч��ֻ��ʾ��ת�Ƕ�Ϊ0��
                            "location": "East"  //string,����λ��
                            "additional": "{}", //json-string,������Ϣ��
                            "global": true,     //bool,ʹ��ȫ����������,true��ʾʹ��ȫ������,false��ʾʹ��˽������
                            "attribute": "{}",  //json-string,json��ʽ�������ֶΡ�
                            "state": 0,         //int,״̬��0:����,1:����
                            "heatmap": 0,       //int,����ͼӳ��״̬,0:δӳ��,1:��ӳ��
                            "area_id": 1,       //int,�󶨵�����id��
                            "area_name": "",    //string,�󶨵�������
                            "capbox_id": 0,     //int,�󶨵ĺ��ӵ�id
                            "capbox_name": "xx",//string,�󶨵ĺ��ӵ�����
                            "remark": "xxx",    //string,��ע��
                            "organ_id":1,       //int, �豸��������id
                            "organ_name":"xx",  //string, �豸������������
                            "org_id":1,         //int, �豸��������id
                            "organization":"xx",//string, �豸������������
                            "site_id":1,        //int, �豸�����ص�id
                            "site_name":"xx",   //string, �豸�����ص�����
                            "sitename":"xx",    //string, �豸�����ص�����
                            "creator": "xx",    //string,������
                            "create_time": "xx" //string,����ʱ��
                        },
                        ...
                    ]
                }
            }
            // json�ֶ�����μ� AddCamera
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void QueryCameraList(string cond, out string result);

        /**
         * @brief  QueryHeatmapCameraList ��ѯ����ͼ����ͷ�б�
         * @since  V3.20190919
         *
         * @param cond ��ѯ������
            example:
            {
                "page_no": 1,       ����,int,ҳ��
                "page_size": 10,    ����,int,ҳ�ߴ�
                "operator": "admin",����,string,������
                "query_cond": {
                    "area_id": 1,       ѡ��,int,�󶨵�����id��
                }
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0,
                "info": {
                    "page_no": 1,
                    "page_size": 10,
                    "total_count": 103,
                    "items": [
                        {
                            "id": 1,            //int,����ͷid
                            "name": "n1",       //string,����ͷ������Ҫ���������Ż������ַ���!@#$%^&*([{}])_+|~-=\`;:'",<.>/?
                            "type": 1,          //int,���ͣ��μ���CameraType��
                            "rtsp": "rtsp://xx",//string,ȡ����ַ
                            "location": "East"  //string,����λ��
                            "heatmap": 0,       //int,����ͼӳ��״̬,0:δӳ��,1:��ӳ��
                        },
                        ...
                    ]
                }
            }
            // json�ֶ�����μ� AddCamera
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void QueryHeatmapCameraList(string cond, out string result);

        /**
         * @brief QueryCameraRtsp  ��ѯ����ͷrtsp��ַ
         * @since  V3.20190919
         *
         * @para cond   ��ѯ����
            example:
            {
                "ip": "192.168.2.168",   ����,string,����ͷip
                "username": "test",      ����,string,����ͷ��¼�û���
                "password": "1234"       ����,string,����ͷ��¼����
            }
         * @para result �ɹ���ʧ�ܡ���:
            �ɹ� - ���ض�Ӧ�Ľ��
            {
                "code": 0,
                "info":
                {
                    "rtsp": "rtsp://admin:admin123@192.168.2.200:554"    // ����ͷ��Ӧrtsp��ַ
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void QueryCameraRtsp(string cond, out string result);

        /**
         -----------------------------------------------------------------------
         ץ�ĺ��ӹ���
         -----------------------------------------------------------------------
        **/
        /**
         * @brief  AddCaptureBox ���ץ�ĺ���
         * @since  V3.20190905
         * @update V3.20200102 ���غ���id
         * @update V3.20200326 ����uuid
         *
         * @param box ץ�ĺ�����Ϣ
            example:
            {
                "name": "n1",           ����,string,ץ�ĺ������ơ���Ҫ���������Ż������ַ���!@#$%^&*([{}])_+|~-=\`;:'",<.>/?
                "type": 1,              ����,int,���ͣ��μ���CapboxMfrsType��
                "ip": "192.168.1.10",   ѡ��,string,�豸ip
                "port": 8000,           ѡ��,int,�豸�˿�,��������MQTT:1883,
                "username": "admin",    ѡ��,string,��¼�û���,��������:admin
                "password": "123"       ѡ��,string,��¼����,��������:Senscape
                "uuid": "ABSHIKDKSJH1"  ѡ��,string,�豸Ψһ��ʶ��  С�Ǻ����豸��־
                "site_id":1,            ����,int �豸�����ص�id
                "cameras"[
                    {
                        "name": "camera 01",
                        "rtsp": "rtsp://admin:admin@192.168.1.10:554/h264",
                        "channel": 1,   ����,int,ͨ����,ȡֵ[1,4]
                        "location": "East Gate",
                        "remark": ""
                    }, ...
                ]
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0, "info": {"id": 1}}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void AddCaptureBox(string box, out string result);

        /**
         * @brief  UpdateCaptureBox ����ץ�ĺ���
         * @since  V3.20190905
         * @update V3.20200326 ����uuid
         *
         * @param box ץ�ĺ�����Ϣ
            example:
            {
                "id": 1,                ����,int,����id
                "name": "n1",           ����,string,�������ơ���Ҫ���������Ż������ַ���!@#$%^&*([{}])_+|~-=\`;:'",<.>/?
                "type": 1,              ����,int,����,�μ���CapboxMfrsType��
                "ip": "192.168.1.10",   ѡ��,string,����ip
                "port": 8000,           ѡ��,int,���Ӷ˿�,��������MQTT:1883,
                "username": "admin",    ѡ��,string,��¼�û���,��������:admin
                "password": "123"       ѡ��,string,��¼����,��������:Senscape
                "uuid": ""              ѡ��,string,,�豸Ψһ��ʶ��  С�Ǻ����豸��־
                "site_id":1,            ѡ��,int �豸�����ص�id
                "cameras"[
                    {
                        "name": "camera 01",
                        "rtsp": "rtsp://admin:admin@192.168.1.10:554/h264",
                        "channel": 1,   ����,int,ͨ����,ȡֵ[1,4]
                        "location": "East Gate",
                        "remark": ""
                    }, ...
                ]
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void UpdateCaptureBox(string box, out string result);

        /**
         * @brief  DeleteCaptureBox ɾ��ץ�ĺ���
         * @since  V3.20190905
         *
         * @param box ץ�ĺ�����Ϣ
            example:
            {
                "id": 2,            ����,int,����id
                "operator": "xx"    ѡ��,string,������
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void DeleteCaptureBox(string box, out string result);

        /**
         * @brief  GetCaptureBoxInfo ��ȡץ�ĺ�����Ϣ
         * @since  V3.20190905
         * @update V3.20200326 ���ӷ���ֵuuid
         *
         * @param cond ��ѯ����
            example:
            {
                "id": 2,            ����,int,����id
                "operator": "xx"    ѡ��,string,������
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0,
                "info": {
                    "id": 1,                int,����id
                    "name": "n1",           string,�������ơ���Ҫ���������Ż������ַ���!@#$%^&*([{}])_+|~-=\`;:'",<.>/?
                    "type": 1,              int,���ͣ��μ���CapboxMfrsType��
                    "ip": "192.168.1.10",   string,����ip
                    "port": 8000,           int,���Ӷ˿�,��������MQTT:1883,
                    "username": "admin",    string,��¼�û���,��������:admin
                    "password": "123"       string,��¼����,��������:Senscape
                    "uuid": ""              string,����Ψһ��ʶ�� С�Ǻ���
                    "cameras"[
                        {
                            "name": "camera 01",
                            "rtsp": "rtsp://admin:admin@192.168.1.10:554/h264",
                            "channel": 1,   int,ͨ����
                            "location": "East Gate",
                            "remark": ""
                        },
                        ...
                    ]
                }
            }
            // json�ֶ�����μ� AddCamera
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void GetCaptureBoxInfo(string cond, out string result);

        /**
         * @brief  QueryCaptureBoxList ��ѯץ�ĺ�����Ϣ
         * @since  V3.20190905
         * @update V3.20200326 ����uuid �ͷ���ֵuuid
         *
         * @param cond ��ѯ����
            example:
            {
                "page_no": 1,       ����,int,ҳ��
                "page_size": 10,    ����,int,ҳ�ߴ�
                "operator": "admin",����,string,������
                "query_cond": {
                    "name": "",     ѡ��,string,��������,֧��ģ��ƥ�䡣
                    "type": 1,      ѡ��,int,��������
                    "ip": ""        ѡ��,string,����ip
                    "uuid": ""      ѡ��,string,С�Ǻ���uuid
                }
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0,
                "info": {
                    "page_no": 1,
                    "page_size": 10,
                    "total_count": 103,
                    "items": [
                        {
                            "id": 1,                int,����id
                            "name": "n1",           string,�������ơ���Ҫ���������Ż������ַ���!@#$%^&*([{}])_+|~-=\`;:'",<.>/?
                            "type": 1,              int,���ͣ��μ���CapboxMfrsType��
                            "ip": "192.168.1.10",   string,����ip
                            "port": 8000,           int,���Ӷ˿�,��������MQTT:1883,
                            "username": "admin",    string,��¼�û���,��������:admin
                            "password": "123"       string,��¼����,��������:Senscape
                            "uuid": ""              string,С�Ǻ���uuid
                            "organ_id":1,           int, �豸��������id
                            "organ_name":"xx",      string, �豸������������
                            "org_id":1,             int, �豸��������id
                            "organization":"xx",    string, �豸������������
                            "site_id":1,            int, �豸�����ص�id
                            "site_name":"xx",       string, �豸�����ص�����
                            "sitename":"xx"         string, �豸�����ص�����
                        },
                        ...
                    ]
                }
            }
            // json�ֶ�����μ� AddCamera
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void QueryCaptureBoxList(string cond, out string result);
        
        
        /**
         -----------------------------------------------------------------------
         �������
         -----------------------------------------------------------------------
        **/
        /**
         * @brief  AddMonitorTask ��Ӽ������
         * @since  V3.20180922
         * @update V3.20181009 ���ӹ����������
         * @update V3.20181018 ���������
         * @update V3.20181107 ���Ӷ�ʱѲ������
         * @update V3.20181205 ����ʶ����
         * @update V3.20190308 �޸�timing,֧�ֶ�ƻ�,�Լ���ͨբ���Ž���Ϣ
         * @update V3.20190522 �޸�attribute,������������,����ǩ��,��������������������
         * @update V3.20200102 ��������id
         * @update V3.20200427 ����������������id
         *
         * @param task ������Ϣ����������Ƶ�ȶԣ�Ҳ������ͼƬ�ȶԡ����ܻ��á�
            example:
            {
                "name": "task name",        ����,string,������,��Ҫ���������Ż������ַ���!@#$%^&*([{}])_+|~-=\`;:'",<.>/?
                "type": 1,                  ����,int,��������,�μ���TaskType��
                "video_list": "1,2",        ����,string,��Ƶ�б�,�������ʱ���������ͷ�б���json��ʽ���ַ�����
                "video_list2": "3,4",       ѡ��,string,��Ƶ�б�,�������ʱ����������ͷ�б����json��ʽ���ַ�����
                "lib_list": "1,2,3",        ����,string,�׿��б�,��:"1,2,3,"
                "access_list": "1,2",       ����,string,բ���б�,��:"1,2,"
                "area_id": 1,               ѡ��,int,����id��������Ŀ��¥��id��
                "score_threshold": 0.85,    ѡ��,float,�ȶԵ÷ֵ���С��ֵ�����������ѡ�
                "alarm_stranger": true,     ѡ��,bool,İ�����Ƿ�澯�� true or false
                "top_num": 1,               ѡ��,int,�ȶ�topN,Ĭ��top one
                "recognize_interval": 5000, ѡ��,int,�׿���Աʶ����,��λ����,Ĭ��5000ms
                "remark": "xx",             ѡ��,string,��ע��
                "timing": "{}",             ѡ��,json-string,json��ʽ�������ֶ�
                "attribute": "{}",          ѡ��,json-string,json��ʽ�������ֶ�
                "operator": "xx",           ����,string,������,��ǰ��¼���û�����
                "organ_id":1                ����,������������id ��ѡһ
                "org_id":1                  ����,������������id ��ѡһ
            }
                ���ֶΡ� timing ȡֵ:
                {
                    "enabled": true,
                    "plans": [
                        {
                            "weekly": "0,1,2,3",            // ÿ�ܵ�,0:������,1:����һ,...,6:������
                            "timeslice": [                  // ��ʱ�ƻ�ʱ���
                                {
                                    "start": "02:00:00",    // ʱ��ο�ʼʱ��
                                    "end": "03:30:00"       // ʱ��ν���ʱ��
                                }
                            ]
                        }
                    ]
                }
                ���ֶΡ� attribute ȡֵ:
                1.��������
                {
                    // ��������
                    "group_prop": {
                        "duration_time": 10,        // ÿ�������¼�����ʱ�䣬��λ����
                        "check_interval": 60        // �����¼�ִ�м������λ����
                    }
                }
                2.��ʱѲ��
                {
                    // Ѳ������
                    "patrol_prop": {
                        "group_id": 1,              // Ѳ��С��id
                        "patrol_plan": [
                            {
                                "video_id": 1,              // ����ͷid
                                "timeslice": [              // Ѳ��ʱ���
                                    {
                                        "begin": "02:00:00",// Ѳ����ʼʱ��
                                        "end": "03:30:00"   // Ѳ������ʱ��
                                    }
                                ]
                            }
                        ]
                    }
                }
                3.��������
                {
                    "rollcall_prop": {
                        "duration": 5,      // ��������ʱ��,��λ:����
                        "absent_alarm": 0,  // ȱϯ�澯,0:���澯,1:�澯
                    }
                }
                4.����ǩ��
                {
                    "signin_prop": {
                        "signin_duration": 5,   // ǩ������ʱ��,��λ:����
                        "signout_time": 5,      // ǩ��ʱ��,��λ:����
                        "signout_duration": 5,  // ǩ�˳���ʱ��,��λ:����
                    }
                }
                5.��������
                {
                    "inout_prop": {
                        "alarm_threshold": 30,  // �澯��ֵ,0��ʾ���澯,��λ:����
                    }
                }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0, "info": {"task_id": 1}}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void AddMonitorTask(string task, out string result);

        /**
         * @brief  UpdateMonitorTask ���¼������
         * @since  V3.20180922
         * @update V3.20181009 ���ӹ����������
         * @update V3.20181018 ���������
         * @update V3.20181205 ����ʶ����
         * @update V3.20190308 �޸�timing,֧�ֶ�ƻ�,�Լ���ͨբ���Ž���Ϣ
         *
         * @param task 
            example:
            {
                "task_id": 1,               ����,int,����id
                "name": "task name",        ����,string,������,��Ҫ���������Ż������ַ���!@#$%^&*([{}])_+|~-=\`;:'",<.>/?
                "type": 1,                  ����,int,��������,�μ���TaskType��
                "video_list": "1,2",        ����,string,��Ƶ�б�,�������ʱ���������ͷ�б���json��ʽ���ַ�����
                "video_list2": "3,4",       ѡ��,string,��Ƶ�б�,�������ʱ����������ͷ�б����json��ʽ���ַ�����
                "lib_list": "1,2,3",        ����,string,�׿��б�"1,2,3,"
                "access_list": "1,2",       ����,string,բ���б�,��:"1,2,"
                "area_id": 1,               ѡ��,int,����id��������Ŀ��¥��id��
                "score_threshold": 0.85,    ѡ��,float,�ȶԵ÷ֵ���С��ֵ,���������ѡ�
                "alarm_stranger": true,     ѡ��,bool,İ�����Ƿ�澯�� true or false
                "top_num": 1,               ѡ��,int,�ȶ�topN,Ĭ��top one��
                "recognize_interval": 5000, ѡ��,int,�׿���Աʶ����,��λ����,Ĭ��5000ms
                "remark": "xx",             ѡ��,string,��ע��
                "timing": "{}",             ѡ��,json-string,json��ʽ�������ֶ�
                "attribute": "{}",          ѡ��,json-string,json��ʽ�������ֶ�
                "operator": "xx",           ѡ��,string,������,��ǰ��¼���û�����
            }
            // json�ֶ�����μ� AddMonitorTask
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void UpdateMonitorTask(string task, out string result);

        /**
         * @brief  DeleteMonitorTask ɾ���������
         * @since  V3.20180922
         *
         * @param task ��������id��
            example:
            {
                "task_id": 1,       ����,int,����id
                "operator": "xx"    ѡ��,string,������
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void DeleteMonitorTask(string task, out string result);

        /**
         * @brief  QueryMonitorTaskInfo ��ѯ���������Ϣ��
         * @since  V3.20180922
         * @update V3.20181009 ���ӹ����������
         * @update V3.20181018 �����������Ϣ
         * @update V3.20181205 ����ʶ����
         * @update V3.20190308 �޸�timing,֧�ֶ�ƻ�,�Լ���ͨբ���Ž���Ϣ
         *
         * @param cond ��ѯ������
            example:
            {
                "task_id": 1        ����,int,����id
            }
         * @param result       �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0,
                "info":
                {
                    "task_id": 1,               int,����id
                    "name": "task name",        string,������,��Ҫ���������Ż������ַ���!@#$%^&*([{}])_+|~-=\`;:'",<.>/?
                    "type": 1,                  int,��������,�μ���TaskType��
                    "video_list": [ {"id": 1, "name": "xx"} ], ��Ƶ�б�,[{id,name},...]
                    "video_list2": [ {"id": 3, "name": "xx"} ],��Ƶ�б�2,[{id,name},...]
                    "lib_list": [ {"id": 1, "name": "xx"} ],   �׿��б�,[{id,name},...]
                    "access_list": [ {"id": 1, "name": "xx"} ],բ���б�,[{id,name},...]
                    "area_id": 1,               int,����id��������Ŀ��¥��id��
                    "area_name": "",            string,�������ƣ�������Ŀ��¥�����ƣ�
                    "score_threshold": 0.85,    float,�ȶԵ÷ֵ���С��ֵ�����������ѡ�
                    "alarm_stranger": true,     bool,İ�����Ƿ�澯�� true �� false
                    "top_num": 1,               int,�ȶ�topN��Ĭ��top one��
                    "recognize_interval": 5000, int,�׿���Աʶ����,��λ����,Ĭ��5000ms
                    "state": 1,                 int,״̬,0:��ֹͣ,1:������
                    "remark": "xx",             string,��ע��
                    "timing": "{}",             json-string,json��ʽ�������ֶ�
                    "attribute": "{}",          json-string,json��ʽ�������ֶ�
                    "creator": "xx",            string,������,��ǰ��¼���û���
                    "create_time": "xxxx"       string,����ʱ��,����2017-03-02 20:02:02
                }
            }
            // json�ֶ�����μ� AddMonitorTask
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void QueryMonitorTaskInfo(string cond, out string result);

        /**
         * @brief  QueryMonitorTaskList ��ѯ��������б�
         * @since  V3.20180922
         * @update V3.20181009 ���ӹ����������
         * @update V3.20181018 �����������Ϣ
         * @update V3.20181205 ����ʶ����
         * @update V3.20190308 �޸�timing,֧�ֶ�ƻ�,�Լ���ͨբ���Ž���Ϣ
         * @update V3.20190530 ������Ƶ����ͷ��״̬
         *
         * @param cond ��ѯ������
            example:
            {
                "page_no": 1,       ����,int,ҳ��
                "page_size": 10,    ����,int,ҳ�ߴ�
                "operator": "admin",ѡ��,string,������
                "query_cond": {
                    "name": "xx",   ѡ��,string,�������ƣ�֧��ģ��ƥ��
                    "area_id": 0    ѡ��,int,����id
                }
            }
         * @param result       �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0,
                "info": {
                    "page_no": 1,
                    "page_size": 10,
                    "total_count": 103
                    "items": [
                        {
                            "task_id": 1,               int,����id
                            "name": "task name",        string,������,��Ҫ���������Ż������ַ���!@#$%^&*([{}])_+|~-=\`;:'",<.>/?
                            "type": 1,                  int,��������,�μ���TaskType��
                            "video_list": [ {"id": 1, "name": "xx", "state": 0} ], ��Ƶ�б�,[{id,name,state},...],�ֶ�state,0:δ��,1:��
                            "video_list2": [ {"id": 3, "name": "xx", "state": 0} ],��Ƶ�б�2,[{id,name,state},...],�ֶ�state,0:δ��,1:��
                            "lib_list": [ {"id": 1, "name": "xx"} ],   �׿��б�,[{id,name},...]
                            "access_list": [ {"id": 1, "name": "xx"} ],բ���б�,[{id,name},...]
                            "area_id": 1,               int,����id��������Ŀ��¥��id��
                            "area_name": "",            string,�������ƣ�������Ŀ��¥�����ƣ�
                            "score_threshold": 0.85,    float,�ȶԵ÷ֵ���С��ֵ�����������ѡ�
                            "alarm_stranger": true,     bool,İ�����Ƿ�澯�� true �� false
                            "top_num": 1,               int,�ȶ�topN��Ĭ��top one��
                            "recognize_interval": 5000, int,�׿���Աʶ����,��λ����,Ĭ��5000ms
                            "state": 1,                 int,״̬,0:��ֹͣ,1:������
                            "remark": "xx",             string,��ע��
                            "timing": "{}",             json-string,json��ʽ�������ֶ�
                            "attribute": "{}",          json-string,json��ʽ�������ֶ�
                            "creator": "xx",            string,������,��ǰ��¼���û���
                            "create_time": "xxxx"       string,����ʱ��,����2017-03-02 20:02:02
                        }
                    ]
                }
            }
            // json�ֶ�����μ� AddMonitorTask
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void QueryMonitorTaskList(string cond, out string result);

        /**
         -----------------------------------------------------------------------
         ��ͨբ������
         -----------------------------------------------------------------------
        **/
        /**
         * @brief  AddGeneralAccess ������ͨբ���Ž���Ϣ
         * @since  V3.20190308
         * @update V3.20200102 ���ؿ�����id
         *
         * @param device բ����Ϣ��
            example: 
            {
                "name": "xxx",                  ����,string,����������
                "type": 1,                      ����,int,�豸����,1-΢���Ž� 2-�̵��� 3-�й��� 4-׿��� 5-����388�������׽���
                "ip": "192.168.0.1",            ����,string,������ip,�й���Ϊ"COM"
                "port": 1000,                   ����,int,�������˿�,�й���Ϊ0
                "out": "xxx",                   ����,string,������OUT��
                "sn": "xxxxxxx",                ѡ��,string,���к�,΢���Ž�����
                "enabled": true,                ѡ��,bool,�Ž�������ʹ��,Ĭ������
                "remark": "xxx",                ѡ��,string,��ע
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0, "info": {"dev_id": 1}}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void AddGeneralAccess(string device, out string result);

        /**
         * @brief  UpdateGeneralAccess ������ͨբ���Ž���Ϣ
         * @since  V3.20190308
         *
         * @param device բ����Ϣ
            example: 
            {
                "dev_id":0,                     ����,int,������id
                "name": "xxx",                  ����,string,����������
                "type": 1,                      ����,int,�豸����,1-΢���Ž� 2-�̵��� 3-�й��� 4-׿��� 5-����388�������׽���
                "ip": "192.168.0.1",            ����,string,������ip,�й���Ϊ"COM"
                "port": 1000,                   ����,int,�������˿�,�й���Ϊ0
                "out": "xxx",                   ����,string,������OUT��
                "sn": "xxxxxxx",                ѡ��,string,���к�,΢���Ž�����
                "enabled": true,                ѡ��,bool,�Ž�������ʹ��,Ĭ������
                "remark": "xxx",                ѡ��,string,��ע
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void UpdateGeneralAccess(string device, out string result);

        /**
         * @brief  EnableGeneralAccess ʹ����ͨ�Ž��豸
         * @since  V3.20190308
         *
         * @param device �Ž���Ϣ
            example: 
            {
                "dev_id": 1,        ����,�Ž�id
                "enabled": true,    ����,ʹ��״̬,false:ͣ��,true:����
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void EnableGeneralAccess(string device, out string result);

        /**
         * @brief  DeleteGeneralAccess ɾ����ͨբ���Ž���Ϣ
         * @since  V3.20190308
         *
         * @param device բ����Ϣ
            example: 
            {
                "dev_id":0,                   ����,int,բ���Ž���¼id
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void DeleteGeneralAccess(string device, out string result);

        /**
         * @brief  QueryGeneralAccessList ��ѯ��ͨբ���Ž���Ϣ
         * @since  V3.20190308
         *
         * @param cond ��ѯ����
            {
                "page_no": 1,           ����,int,ҳ��,Ĭ��1
                "page_size": 10,        ����,int,ҳ��С,��Ч������10,20,30,40,50
                "operator": "admin",    ����,string,������
                "query_cond": {
                    "dev_id": 0,           ѡ��,int,բ�����
                    "name": "xxx",          ѡ��,string,�豸����֧��ģ��ƥ��
                    "type": 1,              ѡ��,int,�Ž��豸���ͣ�0��ʾȫ��
                }
            }
         * @param result �ɹ���ʧ�ܡ�
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0,
                "info":
                {
                    "page_no": 1,
                    "page_size": 10,
                    "total_count": 100,
                    "items": [
                        {
                            "dev_id":0,                // int,������id
                            "name": "xxx",              // string,����������
                            "type": 1,                  // int,�豸����,1-΢���Ž� 2-�̵��� 3-�й��� 4-׿��� 5-����388�������׽���
                            "ip": "192.168.0.1",        // string,������ip,�й���Ϊ"COM"
                            "port": 1000,               // int,�������˿�,�й���Ϊ0
                            "out": "xxx",               // string,������OUT��
                            "sn": "xxxxxxx",            // string,���к�,΢���Ž�����
                            "enabled": true,            // bool,�Ž�������ʹ��,Ĭ������
                            "remark": "xxx",            // string,��ע
                        }
                    ]
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void QueryGeneralAccessList(string cond, out string result);

        /**
         -----------------------------------------------------------------------
         �����Ž�������
         -----------------------------------------------------------------------
        **/
        /**
         * @brief  AddSmartAccess  ������������Ž���
         * @since  V3.20190308
         * @update V3.20200102 �����豸id
         * @update V3.20200217 �����豸������ʶ
         * @update V3.20200421 �����豸��������ID
         * @update V3.20200428 �������������ӱȶԵ׿�
         *
         * @param device ���������Ž���Ϣ
            example:
            {
                "name": "office",           ����,�豸��
                "type": 1,                  ѡ��,�豸����,�μ���FaceDeviceType��
                "in_out": 0,                ѡ��,�豸������ʶ,0:δ֪,1:����,2:����
                "ip": "127.0.0.1",          ����,�豸IP
                "port": 8000,               ����,�豸�˿�
                "sn": "xxx",                ѡ��,�豸���к�
                "site_id":1,                ����,�豸�����ص�id
                "enabled": true,            ѡ��,�Ž�������ʹ��,Ĭ������
                "compare_info":"",          ѡ��,�豸���αȶ���Ϣ
                "remark":"xxx"              ѡ��,��ע
            }
            ���ֶΡ� compare_info ȡֵ:
            {
                "lib_list": 0,              // string,�׿��б�
                "compare_threshold": 0.8,   // double,�ȶ���ֵ
                "confidence": 7,            // double,�ؼ�����Ϣֵ
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0, "info": {"dev_id": 1}}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void AddSmartAccess(string device, out string result);

        /**
         * @brief  UpdateSmartAccess �޸����������Ž�����Ϣ
         * @since  V3.20190308
         * @update V3.20190822 �������豸֧��
         * @update V3.20200217 �����豸������ʶ
         * @update V3.20200421 �����豸��������ID
         * @update V3.20200428 ���Ӷ��αȶ���Ϣ
         *
         * @param device ���������Ž���Ϣ
            example:
            {
                "dev_id": 1,                ����,�豸��
                "name": "office",           ����,�豸��
                "in_out": 0,                ѡ��,�豸������ʶ,0:δ֪,1:����,2:����
                "ip": "127.0.0.1",          ѡ��,�豸IP�������Ž����޸ģ�
                "port": 8000,               ѡ��,�豸�˿ڣ������Ž����޸ģ�
                "sn": "xxx",                ѡ��,�豸���кţ������Ž����޸ģ�
                "site_id":1,                ѡ��,�豸�����ص�id
                "area_id": 1,               ѡ��,����id
                "enabled": true,            ѡ��,�Ž�������ʹ��,Ĭ������
                "compare_info":"",          ѡ��,�豸���αȶ���Ϣ
                "remark":"xxx"              ѡ��,��ע
            }
            ���ֶΡ� compare_info ȡֵ:
            {
                "lib_list": 0,              // string,�׿��б�
                "compare_threshold": 0.8,   // double,�ȶ���ֵ
                "confidence": 7,            // double,�ؼ�����Ϣֵ
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void UpdateSmartAccess(string device, out string result);

        /**
         * @brief  EnableSmartAccess ʹ�������Ž��豸
         * @since  V3.20190308
         *
         * @param device �Ž���Ϣ
            example: 
            {
                "dev_id": 1,        ����,�豸��
                "enabled": true,    ����,ʹ��״̬,false:ͣ��,true:����
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void EnableSmartAccess(string device, out string result);

        /**
         * @brief  DeleteSmartAccess ɾ�����������Ž���
         * @since  V3.20190308
         *
         * @param device �豸����
            example:
            {
                "dev_id": 1,        // �豸��
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void DeleteSmartAccess(string device, out string result);

        /**
         * @brief  QuerySmartAccess ��ѯ���������Ž���
         * @since  V3.20190308
         * @update V3.20190822 �������豸֧��
         * @update V3.20200217 �����豸������ʶ
         * @update V3.20200421 �����豸��������ID
         * @update V3.20200428 �豸���αȶ���Ϣ
         *
         * @param cond ��ѯ����
            example:
            {
                "page_no": 1,           ����,ҳ��
                "page_size": 10         ����,ҳ�ߴ�
                "operator": "admin",    ����,string,������
                "query_cond": {
                    "dev_id": 0,        ѡ��,�豸��
                    "name": "xxx",      ѡ��,�豸����֧��ģ��ƥ��
                    "type": 0,          ѡ��,����,�μ���FaceDeviceType��
                    "in_out": 0,        ѡ��,�豸������ʶ,0:δ֪,1:����,2:����
                    "siteid_list":""    ѡ��,String,�豸�����ص�id�б�
                }
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0,
                "info": {
                    "page_no": 1,       // ҳ��
                    "page_size": 10,    // ҳ�ߴ�
                    "total_count": 1,   // ����
                    "items": [
                        {
                            "dev_id": 1,            // �豸��
                            "name": "office",       // �豸��
                            "type": 0,              // ����,�μ���FaceDeviceType��
                            "in_out": 0,            // �豸������ʶ,0:δ֪,1:����,2:����
                            "ip": "127.0.0.1",      // �豸IP
                            "port": 8000,           // �豸�˿�
                            "sn": "xxx",            // �豸���кź�
                            "organ_id":1,           // �豸��������id
                            "organ_name":"xx",      // �豸������������
                            "org_id":1,             // �豸��������id
                            "organization":"xx",    // �豸������������
                            "site_id":1,            // �豸�����ص�id
                            "site_name":"xx",       // �豸�����ص�����
                            "sitename":"xx",        // �豸�����ص�����
                            "area_id": 1,           // ����id
                            "area_name": "",        // ��������
                            "enabled": true,        // �Ž�������ʹ��,Ĭ������
                            "remark":"xxx",         // ��ע
                            "online": true,         // ����״̬,true:����,false:����
                            "activation": true,     // ����״̬,true:����,false:δ����
                            "compare_info": "",     // �豸���αȶ���Ϣ
                            "update_time":"xxx"     // ����ʱ��
                        }
                    ]
                }
            }
            ���ֶΡ� compare_info ȡֵ:
            {
                "lib_list": [{                      // �׿��б�
                        "lib_id": 1,
                        "lib_name": "test"
                    }
                    ....
                ],
                "compare_threshold": 0.8,           // double,�ȶ���ֵ
                "confidence": 7,                    // double,�ؼ�����Ϣֵ
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void QuerySmartAccess(string cond, out string result);

        /**
         * @brief  UpdateItmRecordState ��������������ͨ�м�¼״̬
         * @since  V3.20200427
         *
         * @param record ��¼��Ϣ
            example: 
            {
                "id": "1",      ����,string,��¼id
                "state": 0,     ����,int,����״̬,0:δ����,1:�Ѵ���
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void UpdateItmRecordState(string record, out string result);

        /**
         * @brief  DeleteItmAccessRecord ɾ������������ͨ�м�¼
         * @since  V3.20200427
         *
         * @param record ��¼��Ϣ
            example: 
            {
                "id": 1,    ����,int,��¼id
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void DeleteItmAccessRecord(string record, out string result);

        /**
         * @brief  BatchDeleteItmAccessRecord ����ɾ������������ͨ�м�¼
         * @since  V3.20200427
         *
         * @param record ��¼��Ϣ
            example: 
            {
                "id_list": 1,    ����,string,��¼id�б�
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void BatchDeleteItmAccessRecord(string record, out string result);

        /**
         * @brief  QueryItmAccessRecord ��ѯ����������ͨ�м�¼
         * @since  V3.20200427
         *
         * @param cond ��ѯ����
            example:
            {
                "page_no": 1,           ����,ҳ��
                "page_size": 10         ����,ҳ�ߴ�
                "operator": "admin",    ����,string,������
                "org_id": 1,            ����,int,��֯id
                "query_cond": {
                    "site_id": 0,           ѡ��,int,�ص�id
                    "lib_id": 1,            ѡ��,int,�׿�id
                    "dev_id": 1,            ѡ��,int,�Ž�id
                    "dev_list": "1,2",      ѡ��,string,�豸�б�, �Զ��ż��
                    "name": "xxx",          ѡ��,string,��Ա������ģ��ƥ��
                    "card_no": "",          ѡ��,string,֤���ţ���ȷ��ѯ
                    "classify": 2,          ѡ��,int,ʶ�����,�μ�<ResultClassify>
                    "begin_time": "xxxx",   ѡ��,string,ͨ��ʱ��Ĳ�ѯ��ʼʱ�䣬��ʽ��YYYY-MM-DD HH:mm:ss
                    "end_time": "xxxx",     ѡ��,string,ͨ��ʱ��Ĳ�ѯ����ʱ�䣬��ʽ��YYYY-MM-DD HH:mm:ss
                    "score_min": 0.6,       ѡ��,float,�ȶԵ���С�÷�
                    "score_max": 0.9,       ѡ��,float,�ȶԵ����÷�
                    "temperature_min": 36.5 ѡ��,float,�������,��λ:���϶�
                    "fever": 1,             ѡ��,int,���ձ��,0:����,1:����
                    "state": 0,             ѡ��,int,����״̬,0:δ����,1:�Ѵ���,2:����,����Ҫ����
                    "in_out": 0,            ѡ��,int,�豸������ʶ,0::δ֪,0:���,2:����
                }
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0,
                "info": {
                    "page_no": 1,       // ҳ��
                    "page_size": 10,    // ҳ�ߴ�
                    "total_count": 1,   // ����
                    "items": [
                        {
                            "id": 1,                // ��¼id
                            "lib_id": 1,            // �׿�id
                            "lib_name": 1,          // �׿���
                            "name": "zhangsan",     // ��Ա����
                            "gender": 0,            // �Ա�0:δ֪,1:��,2:Ů
                            "card_no": "",          // ֤����
                            "group": 2,             // �ڰ�����,�μ�<Whitelist>
                            "category": 0,          // ��Ա���,0:δ����
                            "compare_score": 0.98,  // �ȶԵ÷�
                            "wear_mask": true,      // �Ƿ��������
                            "temperature": 36.5,    // ����,��λ:���϶�
                            "is_fever": true,       // �Ƿ���,true:����,false:δ����
                            "classify": 0,          // ʶ�����,�μ�<ResultClassify>
                            "dev_id": 1,            // �豸id
                            "dev_name": "",         // �豸��
                            "in_out": 0,            // �豸������ʶ,0:δ֪,1:����,2:����
                            "org_id": 1,            // ��֯id
                            "organization": "",     // ��֯��
                            "site_id": 1,           // ��ַid
                            "site_name": "",        // ��ַ��
                            "access_time": "2018-08-03 10:30:00",   // ͨ��ʱ��
                            "capture_time": "2018-08-03 10:30:00",  // ץ��ʱ��
                            "pic_url": "http://192.168.1.1:8001/p/1.jpg"        // ע��ͼƬURL
                            "capture_url": "http://192.168.1.1:8001/c/1.jpg",   // ץ��ͼƬURL
                            "state": 0,             // ��¼����״̬,0:δ����,1:�Ѵ���,2:����,����Ҫ����
                        }
                    ]
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void QueryItmAccessRecord(string cond, out string result);

        /**
         * @brief  ActivateSmartAccess �������豸�������Ž���
         * @since  V3.20190822
         *
         * @param action �������
            definition:
            {
                "dev_id": 1,        ����,�豸��
                "activation": true  ����,bool,�������,true:����,false:����
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void ActivateSmartAccess(string action, out string result);

        /**
         * @brief  GetSmartAccessConfig ��ȡ�����Ž�����
         * @since  V3.20180922
         * @update V3.20200217 ���Ӳ���ƽ�����ò���
         *
         * @param cond ������Ϣ
            example:
            {
                "dev_id": "xx"         ����,�豸��
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0,
                "info":
                {
                    "config": "{}"      // json-string,���������ַ�����
                }
            }
            ���ֶΡ� config ȡֵ:
            for �����Ž�
            {
                "show_stranger": 0,     // ��ʾİ���ˣ�0�����أ�1����ʾ
                //"non_living_alarm": 0,// �ǻ���澯��0�����Σ�1���澯
                "controller":           // ע�⣺������豸��δ���ù�����ô���ֶο��ܲ�����
                {
                    "ip": "xxx",    // �Ž�������ip
                    "port": 80,     // �Ž�������port
                    "out": 1        // �Ž�����������ں�
                }
            }
            for ����ƽ��
            {
                "temperature":
                {
                    "high_threshold": 38    // ������ֵ
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void GetSmartAccessConfig(string cond, out string result);

        /**
         * @brief  SetSmartAccessConfig �����Ž�����
         * @since  V3.20180922
         * @update V3.20200217 ���Ӳ���ƽ�����ò���
         * @update V3.20200506 ���������豸�߼���������
         *
         * @param config ������Ϣ
            example:
            {
                "dev_id": "xx",        ����,�豸��
                "config": "{}"         ����,�豸������Ϣ��������json�ַ�����
            }
            ���ֶΡ� config ȡֵ:
            for �����Ž�
            {
                "show_stranger": 0,     // ��ʾİ���ˣ�0�����أ�1����ʾ
                //"non_living_alarm": 0,// �ǻ���澯��0�����Σ�1���澯
                "controller":
                {
                    "ip": "xxx",    // �Ž�������ip
                    "port": 80,     // �Ž�������port
                    "out": 1        // �Ž�����������ں�
                }
            }
            for ����ƽ��
            {
                "temperature":
                {
                    "high_threshold": 38    // ������ֵ
                }
            }
            for �����豸
            {
                "play_sound": true,             // ����,bool,��������
                "light_off_begin": "",          // ����,string,�ƹ�رտ�ʼʱ��
                "light_off_end": "",            // ����,string,�ƹ�رս���ʱ��
                "show_download_info": true,     // ����,bool,ʵʱ���ص�����ʾ
                "time_clean_touch": 3,          // ����,int,�������ʱ������λ��
                "face_score": 75,               // ����,int,����ʶ����ֵ,����,5�ı���
                "face_range": "",               // ����,string,����ʶ�����
                "upload_collect_photo": true,   // ����,bool,�ɼ�ʱ�ϴ���Ƭ
                "upload_capture_photo": true,   // ����,bool,ʶ��ʱ�ϴ���Ƭ
                "time_face_alarm": 2,           // ����,int,ʶ��澯ʱ��
                "time_clear_face": 3,           // ����,int,ʶ�����ʱ��
                "show_temp_range": true,        // ����,bool,�Ƿ���ʾ��������
                "temperature_scale": 1.0,       // ����,double,����������ʾ����
                "stranger_mode": true,          // ����,bool,�Ƿ���İ���˲���ģʽ
                "time_check_stranger": 2,       // ����,int,İ���˼��ʱ��
                "play_temperature": true,       // ����,bool,�Ƿ񲥱��¶�
                "temperature_mode": 0,          // ����,int,�¶���ʾģʽ,0:���϶�,1:���϶�
                "temperature_effective": 35.0,  // ����,double,�¸�����Чֵ
                "temperature_alarm": 37.3,      // ����,double,�¸���������ֵ
                "temperature_offset": 0.0,      // ����,double,�¸���ƫ��ֵ
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void SetSmartAccessConfig(string config, out string result);

        /**
         -----------------------------------------------------------------------
         �����Ž���Ȩ����
         -----------------------------------------------------------------------
        **/
        /**
         * @brief  AddSmartAccessAuth ������������Ž���Ȩ
         * @since  V3.20190315
         * @update V3.20200102 ������Ȩid
         * @update V3.20200311 �޸ķ�����Ϣ
         *
         * @param auth ��Ȩ��Ϣ
            example:
            {
                "dev_id": 1,                ����,�豸id
                "lib_list": "1,2",          ����,�׿��б�
                "enabled": true,            ѡ��,ʹ��
                "remark": "xx",             ѡ��,��ע
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0,
                "info": {
                    "auth_id": 1,           int,��Ȩid
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void AddSmartAccessAuth(string auth, out string result);

        /**
         * @brief  UpdateSmartAccessAuth �������������Ž���Ȩ
         * @since  V3.20190315
         * @update V3.20200311 �޸ķ�����Ϣ
         *
         * @param auth ��Ȩ��Ϣ
            example:
            {
                "auth_id": 1,               ����,��Ȩid
                "lib_list": "1,2",          ����,�׿��б�
                "enabled": true,            ѡ��,ʹ��
                "remark": "xx",             ѡ��,��ע
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void UpdateSmartAccessAuth(string auth, out string result);

        /**
         * @brief  EnableSmartAccessAuth ʹ�������Ž���Ȩ
         * @since  V3.20190308
         *
         * @param auth ��Ȩ��Ϣ
            example: 
            {
                "auth_id": 1,       ����,��Ȩid
                "enabled": true,    ����,ʹ��״̬,false:ͣ��,true:����
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void EnableSmartAccessAuth(string auth, out string result);

        /**
         * @brief  DeleteSmartAccessAuth ɾ�����������Ž���Ȩ
         * @since  V3.20190308
         *
         * @param auth ��Ȩ��Ϣ
            example:
            {
                "auth_id": 1,       ����,���
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void DeleteSmartAccessAuth(string auth, out string result);

        /**
         * @brief  QuerySmartAccessAuth ��ѯ���������Ž���Ȩ��¼
         * @since  V3.20190308
         * @update V3.20200313 ������Ա�·�����
         *
         * @param cond ��ѯ����
            example:
            {
                "page_no": 1,           ����,ҳ��
                "page_size": 10         ����,ҳ�ߴ�
                "operator": "admin",    ����,string,������
                "query_cond": {
                    "dev_name": "xxx",      ѡ��,�Ž��豸���ƣ�֧��ģ��ƥ��
                }
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0,
                "info": {
                    "page_no": 1,       // ҳ��
                    "page_size": 10,    // ҳ�ߴ�
                    "total_count": 1,   // ����
                    "items": [
                        {
                            "auth_id": 1,           // ���
                            "dev_id": 1,            // �豸id
                            "dev_name": "lib name", // �豸����
                            "enabled": true,        // ʹ��
                            "lib_list": [{"id":1, "name":"xx"}] // �׿��б�
                            "remark": "xx",         // ��ע
                            "person_count": 10,     // ��Ȩ����
                            "total": 1,             // ������
                            "success": 1,           // �ɹ��·�����
                            "failed": 1,            // �·�ʧ����Ա
                            "creator": "xx",        // ������
                            "create_time": "xxxx"   // ����ʱ��
                            "update_time":"xxx"     // ����ʱ��
                        }
                    ]
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void QuerySmartAccessAuth(string cond, out string result);

        /**
         * @brief  AddSmartAccessAuthPerson ������������Ž���Ȩ��Ա
         * @since  V3.20190308
         *
         * @param person ��Ȩ��Ϣ
            example:
            {
                "dev_id": 1,            ����,int,�豸id
                "person_list": [
                        {"lib_id":1,"person_id":2}
                    ],                  ����,json,��Ա�б�
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void AddSmartAccessAuthPerson(string person, out string result);

        /**
         * @brief  DeleteSmartAccessAuthPerson ɾ�����������Ž���Ȩ��Ա
         * @since  V3.20190308
         *
         * @param person ��Ա��Ϣ
            example:
            {
                "id": 1,        ����,int,��Ȩ��Ϣid
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void DeleteSmartAccessAuthPerson(string person, out string result);

        /**
         * @brief  BatchDeleteSmartAccessAuthPerson ����ɾ�����������Ž���Ȩ��Ա
         * @since  V3.20190308
         *
         * @param batch ����ɾ������
            example:
            {
                "id_list": "1,2",   ����,string,��Ȩid�б�
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void BatchDeleteSmartAccessAuthPerson(string batch, out string result);

        /**
         * @brief  QuerySmartAccessAuthPerson ��ѯ�Ž���Ȩ��¼��Ա
         * @since  V3.20190308
         *
         * @param cond ��ѯ����
            example:
            {
                "page_no": 1,           ����,ҳ��
                "page_size": 10         ����,ҳ�ߴ�
                "operator": "admin",    ����,string,������
                "query_cond": {
                    "dev_id": 1,                ѡ��,�豸id
                    "name": "xxx",              ѡ��,��Ա������ģ��ƥ��
                    "category": 1,              ѡ��,��Ա���0:δ����
                    "state": 1,                 ѡ��,��Ȩ״̬��1:��Ȩ�ɹ�,2:��Ȩʧ��
                    "begin_time": "xxxx",       ѡ��,��Ȩʱ��Ĳ�ѯ��ʼʱ�䣬��ʽ��YYYY-MM-DD HH:mm:ss
                    "end_time": "xxxx",         ѡ��,��Ȩʱ��Ĳ�ѯ����ʱ�䣬��ʽ��YYYY-MM-DD HH:mm:ss
                }
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0,
                "info": {
                    "page_no": 1,       // ҳ��
                    "page_size": 10,    // ҳ�ߴ�
                    "total_count": 1,   // ����
                    "items": [
                        {
                            "auth_id": 1,           // ��¼id
                            "lib_id": 1,            // �׿�id
                            "lib_name": "lib name", // �׿���
                            "name": "zhangsan",     // ��Ա����
                            "gender": 1,            // �Ա�
                            "card_no": "xxx",       // ֤����
                            "group": 2,             // �ڰ�����,�μ�<Whitelist>
                            "category": 0,          // ��Ա���,0:δ����
                            "pic_url": "xx",        // �׿�ͼƬ
                            "dev_id": 1,            // �Ž��豸id
                            "dev_name": "",         // �Ž��豸����
                            "state": 0,             // ��Ȩ״̬,0:��Ȩʧ�ܣ�1:��Ȩ�ɹ�
                            "valid_time": {         // ��Чʱ�䣬��ʽ��YYYY-MM-DD HH:mm:ss
                                "begin_time": "2018-08-03 10:00:00",    // ��ʼʱ�䣬���ַ�����ʾ������
                                "end_time": "2018-08-03 10:30:00"       // ����ʱ�䣬���ַ�����ʾ������
                            }
                            "auth_time": "2018-08-03 10:30:00"          // ��Ȩʱ��
                        }
                    ]
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void QuerySmartAccessAuthPerson(string cond, out string result);

        /**
         -----------------------------------------------------------------------
         ϵͳ����
         -----------------------------------------------------------------------
        **/
        /**
         * @brief  GetSystemConfig ��ȡϵͳ���á�
         * @since  V3.20180922
         * @update V3.20190308 ��������ͷȫ���������ã�����ӭ��ȫ��ѶϢ����
                               �޸�displayΪadvanced���޸�compare_constraints_welcomeΪcompare_constraints_default
         * @update V3.20190530 ���ӽ��뷽ʽ
         * @update V3.20190705 ����İ��������
         * @update V3.20200703 ���Ӹ߽ײ�����ȫ�ֲ������ֶ�
         *
         * @param cond �������ݡ�
            example:
            {
                "name": "xx"        ����,string,�������ƣ�
                                        ConfigNameClient        -ǰ�����ã�ǰ���Զ���ṹ��
                                        ConfigNameCamera        -����ͷȫ����������
                                        ConfigNameAccess        -բ��/�Ž�����
                                        ConfigNameServerUser    -���������
                                        ConfigNamePicService    -�׿�ͼƬ��������
                                        ConfigNameFileService   -�ļ���������
                                        ConfigNameVideoService  -����Ƶ��������
                                        ConfigNameWelcomeMessage-ӭ��ȫ��ѶϢ����
                "operator": "admin" ѡ��,string,������
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0,
                "info":
                {
                    "config": "{}"      // json-string,���������ַ�����
                }
            }

            for ConfigNameServerUser:
            �������ݣ�config�����£�
            {
                "compare_constraints_default": {},          ѡ��  �ȶ�Լ�� Ĭ��ֵ
                "compare_constraints_1v1": {},              ѡ��  �ȶ�Լ�� 1v1ͼ�ϱȶ�
                "compare_constraints_retrieve": {},         ѡ��  �ȶ�Լ�� ͼƬ����
                "compare_constraints_capture": {},          ѡ��  �ȶ�Լ�� ͼƬץ��
                "library_face_constraints_default": {},     ѡ��  �׿����ʱ�������Ƿ���Ч��Լ��
                "library_face_constraints": {},             ѡ��  �׿����ʱ�������Ƿ���Ч��Լ��
                "advanced": {}                              ѡ��  ȫ������ �߼�����
                "history_keep_days": 60,                    ѡ��  ��ʷ��¼�������������ں�̨��ÿ10���һ�������������ÿ10��һ����λ��
                "capture_library_keep_days": 32,            ѡ��  ��Ҫ����45
            }
            ���бȶ�Լ���ֶ�(compare_constraints_default, compare_constraints_1v1, compare_constraints_retrieve, compare_constraints_capture)���£�
            {
                "angle_pitch": 15.0,            // ���������ǣ�0���ԣ�
                "angle_yaw": 15.0,              // ����ƫ���ǣ�0���ԣ�
                "angle_roll": 15.0,             // ������ת�ǣ�0���ԣ�
                "keypoints_confidence": 0.95,   // �ؼ���������ֵ
                "compare_threshold": 0.90,      // �ȶ���ֵ
            }
            ���е׿�����Լ���ֶ�(library_face_constraints_default, library_face_constraints)���£�
            {
                "min_face_size": 50,            // ��С������С
                "angle_pitch": 15.0,            // ���������ǣ�0���ԣ�
                "angle_yaw": 15.0,              // ����ƫ���ǣ�0���ԣ�
                "angle_roll": 15.0,             // ������ת�ǣ�0���ԣ�
                "keypoints_confidence": 0.95,   // �ؼ���������ֵ
            }
            ���и߼����������ֶ�(advanced)���£�
            {
                "show_stranger": true,          // ��ʾİ����
                "save_stranger": true,          // ��¼İ����
                "double_model": true,           // ����˫ģ��
                "min_face_size": 50,            // ��С������С
                "compare_threshold": 0.90,      // �ȶ���ֵ
                "expand_factor": 1.5,           // ץ��������չϵ��
                "enable_speech": true,          // ��������
                "speech_content": "����",       // ��������
                "enable_stranger_library": true,// ����/����İ���˿�
                "stranger_storage_days": 90,     // İ���˿��İ���˴洢����
                "fever_threshold": 38,           // ������ֵ
                "straightface_threshold":0.4,    // �������Ŷ���ֵ ȡֵ[0.0-1.0]
                "confirmface_threshold" :0.75    // ȥ����ֵ ȡֵ[0.0-1.0]
            }

            for ConfigNameCamera:
            �����������£�
            {
                "global_attribute": {
                    "resize_facephoto_width" : 0,      //ץ���չ̶��ߴ�,���Ϊ0,�򲻽��гߴ�ѹ�� 
                    "capture_strategy" : 6,            //ץ�Ĳ���,�μ�<ECaptureStrategy>
                    "capture_interval": 3000,          //ץ�ļ������λms
                    "detect_interval": 5,              //�������ÿ������֡�����һ֡��
                    "keypoints_confidence": 6.0,       //���������÷���ֵ[0.0-100.0],һ��ȡֵ6.0
                    "video_codec": 0,                  //���뷽ʽ,�μ�<CodecType>
                    "detectface_threshold":0.9         //������Ŷ���ֵ ȡֵ[0.0-1.0]
                    "definition_threshold":0.0,        //��������ֵ ȡֵ[0.0-1.0]
                    "facerange_scale": 1.5,            //�����������
                    "scene_scale":1.0,                 //ȫͼ���ű���
                    "min_face_size": 40,               //��С������̱߳���
                    "skip_frame_interval":1            //������֡,ÿ������֡,����һ֡
                }
            }

            for ConfigNameAccess
            �����������£�
            {
                "smart_access": {
                    "show_stranger": 0,     // ��ʾİ���ˣ�0�����أ�1����ʾ
                    "non_living_alarm": 0   // �ǻ���澯��0�����Σ�1���澯
                }
            }

            for ConfigNamePicService
            �����������£�
            {
                "server_ip": "127.0.0.1",       // ������IP
                "server_port": 8001,            // ������Port
            }

            for ConfigNameFileService
            �����������£�
            {
                "server_ip": "127.0.0.1",       // ������IP
                "server_port": 8002,            // ������Port
                "keep_days": 60,                // ͼƬ��������
                "reserved_space_ratio": 0.1,    // Ԥ���ռ�
            }

            for ConfigNameVideoService
            �����������£�
            {
                "keep_days": 30         // ��Ҫ����45
            }

            for ConfigNameWelcomeMessage
            �����������£�
            {
                "global_message": [
                    { "type": 1, "name": "��ͨ���", "message": "" },
                    { "type": 2, "name": "VIP���",  "message": "" },
                    { "type": 3, "name": "�ÿ����", "message": "" }
                ]
            }

            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void GetSystemConfig(string cond, out string result);

        /**
         * @brief  SetSystemConfig ����ϵͳ���á�
         * @since  V3.20180922
         * @update V3.20190308 ��������ͷȫ���������ã�����ӭ��ȫ��ѶϢ����
                               �޸�displayΪadvanced���޸�compare_constraints_welcomeΪcompare_constraints_default
         * @update V3.20190530 ���ӽ��뷽ʽ
         * @update V3.20190705 ����İ��������
         * @update V3.20200326 ���Ӹ�����ֵ
         * @update V3.20200506 �����¶�����
         *
         * @param config �������ݡ�
            example:
            {
                "name": "xx"        ����,string,�������ƣ�
                                        ConfigNameClient        -ǰ�����ã�ǰ���Զ���ṹ��
                                        ConfigNameCamera        -����ͷȫ����������
                                        ConfigNameAccess        -բ��/�Ž�����
                                        ConfigNameServerUser    -���������
                                        ConfigNamePicService    -�׿�ͼƬ��������
                                        ConfigNameFileService   -�ļ���������
                                        ConfigNameVideoService  -����Ƶ��������
                                        ConfigNameWelcomeMessage-ӭ��ȫ��ѶϢ����
                                        ConfigNameInfrared      -˫���������ͷ���²�������
                "config": "{}"      ����,json-string,���������ַ�����
                "operator": "admin" ѡ��,string,������
            }

            for ConfigNameServerUser:
            �����������£�
            {
                "compare_constraints_default": {},          ѡ��  �ȶ�Լ�� Ĭ��ֵ
                "compare_constraints_1v1": {},              ѡ��  �ȶ�Լ�� 1v1ͼ�ϱȶ�
                "compare_constraints_retrieve": {},         ѡ��  �ȶ�Լ�� ͼƬ����
                "compare_constraints_capture": {},          ѡ��  �ȶ�Լ�� ͼƬץ��
                "library_face_constraints_default": {},     ѡ��  �׿����ʱ�������Ƿ���Ч��Լ��
                "library_face_constraints": {},             ѡ��  �׿����ʱ�������Ƿ���Ч��Լ��
                "advanced": {}                              ѡ��  ȫ������ �߼�����
                "history_keep_days": 60,                    ѡ��  ��ʷ��¼�������������ں�̨��ÿ10���һ�������������ÿ10��һ����λ��
                "capture_library_keep_days": 32,            ѡ��  ��Ҫ����45
            }
            ���бȶ�Լ���ֶ�(compare_constraints_default, compare_constraints_1v1, compare_constraints_retrieve, compare_constraints_capture)���£�
            {
                "angle_pitch": 15.0,            // ���������ǣ�0���ԣ�
                "angle_yaw": 15.0,              // ����ƫ���ǣ�0���ԣ�
                "angle_roll": 15.0,             // ������ת�ǣ�0���ԣ�
                "keypoints_confidence": 0.95,   // �ؼ���������ֵ
                "compare_threshold": 0.90,      // �ȶ���ֵ
            }
            ���е׿�����Լ���ֶ�(library_face_constraints_default, library_face_constraints)���£�
            {
                "min_face_size": 50,            // ��С������С
                "angle_pitch": 15.0,            // ���������ǣ�0���ԣ�
                "angle_yaw": 15.0,              // ����ƫ���ǣ�0���ԣ�
                "angle_roll": 15.0,             // ������ת�ǣ�0���ԣ�
                "keypoints_confidence": 0.95,   // �ؼ���������ֵ
            }
            ���и߼����������ֶ�(advanced)���£�
            {
                "show_stranger": true,          // ��ʾİ����
                "save_stranger": true,          // ��¼İ����
                "compare_threshold": 0.90,      // �ȶ���ֵ
                "enable_speech": true,          // ��������
                "speech_content": "����",       // ��������
                "enable_stranger_library": true,// ����/����İ���˿�
                "stranger_storage_days": 90,    // İ���˿��İ���˴洢����
                "fever_threshold": 38,          // ������ֵ
                "temperature_type": 0,          // �¶�����,0:���϶�,1:���϶�
                "straightface_threshold":0.4,   // �������Ŷ���ֵ ȡֵ[0.0-1.0]
                "confirmface_threshold" :0.75   // ȥ����ֵ ȡֵ[0.0-1.0]
            }

            for ConfigNameCamera:
            �����������£�
            {
                "global_attribute": {
                    "resize_facephoto_width" : 0,      //ץ���չ̶��ߴ�,���Ϊ0,�򲻽��гߴ�ѹ�� 
                    "capture_strategy" : 6,            //ץ�Ĳ���,�μ�<ECaptureStrategy>
                    "capture_interval": 3000,          //ץ�ļ������λms
                    "detect_interval": 5,              //�������ÿ������֡�����һ֡��
                    "keypoints_confidence": 6.0,       //���������÷���ֵ[0.0-100.0],һ��ȡֵ6.0
                    "video_codec": 0,                  //���뷽ʽ,�μ�<CodecType>
                    "detectface_threshold":0.9         //������Ŷ���ֵ ȡֵ[0.0-1.0]
                    "definition_threshold":0.0,        //��������ֵ ȡֵ[0.0-1.0]
                    "facerange_scale": 1.5,            //�����������
                    "scene_scale":1.0,                 //ȫͼ���ű���
                    "min_face_size": 40,               //��С������̱߳���
                    "skip_frame_interval":1            //������֡,ÿ������֡,����һ֡
                }
            }

            for ConfigNameAccess
            �����������£�
            {
                "smart_access": {
                    "show_stranger": 0,     // ��ʾİ���ˣ�0�����أ�1����ʾ
                    "non_living_alarm": 0   // �ǻ���澯��0�����Σ�1���澯
                }
            }

            for ConfigNamePicService
            �����������£�
            {
                "server_ip": "127.0.0.1",       // ������IP
                "server_port": 8001,            // ������Port
            }

            for ConfigNameFileService
            �����������£�
            {
                "server_ip": "127.0.0.1",       // ������IP
                "server_port": 8002,            // ������Port
                "keep_days": 60,                // ͼƬ��������
                "reserved_space_ratio": 0.1,    // Ԥ���ռ�
            }

            for ConfigNameVideoService
            �����������£�
            {
                "keep_days": 30         // ��Ҫ����45
            }

            for ConfigNameWelcomeMessage
            �����������£�
            {
                "global_message": [
                    { "type": 1, "name": "��ͨ���", "message": "" },
                    { "type": 2, "name": "VIP���",  "message": "" },
                    { "type": 3, "name": "�ÿ����", "message": "" }
                ]
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void SetSystemConfig(string config, out string result);

        /**
         * @brief  SetVisitorConfig ���÷ÿ�����
         * @since  V3.20190308
         *
         * @param config ������Ϣ
            {
                "lib_id": 1,               ����,int,�ÿͿ�id
                "visit_area": "1,2"        ѡ��,string,�ܷ������б�,ALL��ʾȫ��
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void SetVisitorConfig(string config, out string result);

        /**
         * @brief  GetVisitorConfig ��ȡ�ÿ�����
         * @since  V3.20190308
         *
         * @param cond ��ѯ����<Ԥ��>
            {
            }
         * @param result json��ʽ���ַ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0,
                "info":
                {
                    "lib_id": 1,
                    "lib_name": "Ĭ�ϷÿͿ�",
                    "visit_area": [
                        {"id":1, "name":"xx"}   // id=0,name=ALL ��ʾȫ��
                    ]
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void GetVisitorConfig(string cond, out string result);

        /**
         * @brief  SetCameraMap ��������ͷ��ͼ��
         * @since  V3.20180922
         *
         * @param vmap ��Ϣ
            example:
            {
                "name":xx,          ����,string,����
                "attribute": "{}",  ����,string,��Ϣ
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void SetCameraMap(string vmap, out string result);

        /**
         * @brief  GetCameraMap ��ȡ����ͷ��ͼ��
         * @since  V3.20180922
         *
         * @param cond ��ȡ����
            example:
            {
                "name":xx,          ����,string,����
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0,
                "info":
                {
                    "name": "xx",
                    "attribute": "{}"
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void GetCameraMap(string cond, out string result);

        /**
         -----------------------------------------------------------------------
         ����
         -----------------------------------------------------------------------
        **/
        /**
         * @brief  ComparePicture1v1 1v1��Ƭ�ȶԡ������Ƭ���ж�����������ֻȡ����������
         * @since  V3.20180922
         *
         * @param task �ȶ���Ϣ��
            example:
            {
                "pic_url_left" : ""     ��������Ƭ·����������http·����
                "pic_url_right" : ""    ����ұ���Ƭ·����
                "operator" : ""         ѡ�
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0,
                "info":
                {
                    "pic_url_left": "dsadsas",
                    "pic_url_right": "fsadsa",
                    "compare_score": 0.83,
                    "score_threshold": 0.9
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void ComparePicture1v1(string task, out string result);

        /**
         * @brief  RetrievePicture ��̬��ͼƬ�����������Ƭ���ж�����������ֻȡ����������
         * @since  V3.20180922
         *
         * @param task �ȶ���Ϣ��
            example:
            {
                "pic_url" :"",      �����Ƭ·�����ϴ�ͼƬʱ�����ص����·����
                "lib_list" :"1,2",  ����׿��б���֣����ĸ�ʽΪ׼��
                                        ��ȷ��ʽ  -  "1,2,3"
                                        "ALL"     -  �ȶ����е׿⡣
                                        ""        -  ���ȶ��κε׿⡣
                                        ������ʽ  -  ֱ����Ϊ����
                "top_num" :5,       �����������������
                "operator" :""      �����ǰ��¼���û�����
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0,
                "info":
                {
                    "pic_url": "dsadsas",
                    "score_threshold": 0.9,
                    "compare_results": [
                        {
                            "person_id": 3,             // �˵�id��
                            "person_name": "xx",        // ������
                            "card_no": "xx",            // ���֤�š�
                            "lib_id": 3,                // �׿�id��
                            "lib_name": "xx",           // �׿�����
                            "pic_id": 3,                // �˵ĵ׿���Ƭid��
                            "pic_url": "xx",            // �˵ĵ׿���Ƭ·����
                            "compare_score": 0.24,      // �ȶԵ÷֡�
                        }
                    ]
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void RetrievePicture(string task, out string result);

        /**
         * @brief  RetrieveCaptureLibrary ץ�Ŀ�ͼƬ�����������Ƭ���ж�����������ֻȡ����������
         * @since  V3.20180922
         *
         * @param task �ȶ���Ϣ��
            example:
            {
                "pic_url" : ""              �����Ƭ·�����ϴ�ͼƬʱ�����ص����·����
                "video_list" : "1,2,3"      �������ͷid�б�id֮���Զ��ŷָ���ALL��ʾ���С�
                "start_date" : ""           ���YYYY-mm-dd����ʼʱ�䡣
                "end_date" : ""             ���YYYY-mm-dd������ʱ�䡣
                "top_num" : 5               �����������������
                "operator" : ""             ��������ߡ�
                "score_threshold" : 0.86    ѡ�
            }
         * @param result       �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0,
                "info":
                {
                    "pic_url": "dsadsas",
                    "score_threshold": 0.9,
                    "compare_results": [
                        {
                            "capture_photo_url": "capture photo url",
                            "capture_scene_url": "capture scene url",
                            "capture_time": "2018-08-02 23:00:00",
                            "video_id": 3,
                            "video_name": "xxx",
                            "video_location": "xcsdad",
                            "compare_score": 0.24,                           // �ȶԵ÷�
                            "age": 30,
                            "gender": "Female"                              // Male��Female��Unknown
                        }
                    ]
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void RetrieveCaptureLibrary(string task, out string result);

        /**
         * @brief  StartMonitorTask ��ʼ�������
         * @since  V3.20180922
         *
         * @param task ������Ϣ
            example:
            {
                "task_id": 1,       ����,int,����id
                "operator": "xx"    ѡ��,string,������
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void StartMonitorTask(string task, out string result);

        /**
         * @brief  StopMonitorTask ֹͣ�������
         * @since  V3.20180922
         *
         * @param task ������Ϣ
            example:
            {
                "task_id": 1,       ����,int,����id
                "operator": "xx"    ѡ��,string,������
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void StopMonitorTask(string task, out string result);

        /**
         * @brief  StartSignIn ��ʼǩ����
         * @since  V3.20180922
         *
         * @param task ����guid��
            example:
            {
                "task_id": 1
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void StartSignIn(string task, out string result);

        /**
         * @brief  StartSignOut ��ʼǩ�ˡ�
         * @since  V3.20180922
         *
         * @param task ����guid��
            example:
            {
                "task_id": 1
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void StartSignOut(string task, out string result);

        /**
         * @brief  StartFileCaptureTask ��ʼ��Ƶ�������
         *        ��̨��Ϊÿ����Ƶ����һ����ʱ������񡣼��������¼�����ݱ��У���������ݱ�չʾ������
         * @since  V3.20180922
         *
         * @param task ������Ϣ
            example:
            {
                "file_info": {
                    "file_name": "xxx�����Ƶ",         ѡ��,���û�д��ֶΣ����������ϴ�����Ƶ����̨�ͻ�����һ�����֡�"auto_name_yyyymmdd_hhmmss"
                    "video_url": "aa/bb/cc/dd.mp4"      ����
                },
                "top_num": 5,                           ����,top number.
                "lib_list": "1,2,3",                    ѡ��,��������е׿⣬�򴫿��ַ�����
                "alarm_stranger": false,                ѡ��,İ�����Ƿ�澯��
                "score_threshold": 0.9,                 ѡ��,�ȶ���ֵ
                "operator": "xx"                        ѡ��,������
            }
         *
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0,
                "info": {
                    "task_guid": "xcxadfsdafsdads",
                    "video_url": "aa/bb/cc/dd.mp4",
                    "file_name": "xxx�����Ƶ"
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void StartFileCaptureTask(string task, out string result);

        /**
         * @brief  PlayHistoryVideo �鿴��ʷ��¼�����������Ƶ��
         * @since  V3.20180922
         *
         * @param cond ��ѯ������
            example:
            {
                "video_id": 1               �����Ƶid��
                "capture_timestamp": 1000   ���ץ��ʱ�����
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0,
                "info":
                {
                    "play_url": "http://fds/sfda/dfs.mp4"
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void PlayHistoryVideo(string cond, out string result);

        /**
         * @brief  QueryStartedTaskList ��ѯ�����Ѿ��򿪵Ŀ���������Ϣ��
         * @since  V3.20180922
         * @since  V3.20190131 ȥ��guid
         * @update V3.20200514 �����֯idɸѡ
         *
         * @param cond ��ѯ����<����>��
            example:
            {
                "org_id": 1,            ����,int,��֯id
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0,
                "info":
                {
                    "items": [
                        {
                            "id": 0,
                            "type": 0,
                            "name": "xx",
                            "videos": [
                                {
                                    "video_id": 1,
                                    "video_name": "",
                                    "rtmp_addr": ""
                                },
                                ...
                            ]
                        },
                        ...
                    ],
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void QueryStartedTaskList(string cond, out string result);

        /**
         * @brief  QueryStartedRtmpList ��ѯrtmp����ͷ��
         * @since  V3.20180922
         * @update V3.20190102 �޸�task_guidΪtask_id
         * @update V3.20200507 �����˫������ͷ,�򷵻���Ϣ���Ӻ���λ����Ϣ
         *
         * @param cond ��ѯ������
            example:
            {
                "task_id": 1    ����,����id��
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0,
                "info":
                {
                    "items": [
                        {
                            "id" : xx,
                            "video_name": "fdsx",
                            "rtmp_addr": "fdsafsdasd",
                            "type": 4,       //����ͷ����, ˫������ͷʱ���Ӵ��ֶ� ֵΪ4
                            "blackbody_x": -1, //����x���� ���<0������ �����ֶ�ͬ��
                            "blackbody_y":-1,  //����y���� ���<0������
                            "infrared_width" : xxx,  //�������
                            "infrared_hight" : xxx,  //�����߶�
                            "blackbody_temperature" : 36.5  //�����¶�
                        }
                    ],
                    ...
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void QueryStartedRtmpList(string cond, out string result);

        /**
         * @brief  QueryFileTaskList ��ѯ�����Ѿ��򿪵���Ƶ����������Ϣ��
         *                           �����ж���Ƶ�����Ƿ������С�
         * @since  V3.20180922
         *
         * @param cond ��ѯ����<����>
            example:
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0,
                "info":
                {
                    "items": [
                        {
                            "id": 0,
                            "type": 0,
                            "name": "xx",
                            "videos": [
                                {
                                    "video_id": 1,
                                    "video_name": "",
                                    "rtmp_addr": ""
                                },
                                ...
                            ]
                        },
                        ...
                    ],
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void QueryFileTaskList(string cond, out string result);

        /**
         * @brief  QueryPersonListByTask ���������ѯ��Ա��Ϣ��Ϣ��
         * @since  V3.20180922
         *
         * @param cond ��ѯ������
            example:
            {
                "page_no": 1, int,  ���ҳ��
                "page_size":10, int,���ҳ�ߴ�
                "operator": "admin",����,string,������
                "query_cond": {
                    "task_id": 1, int,  �������id
                }
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code":0,
                "info":
                {
                    "page_no":1,
                    "page_size":10,
                    "total_count":100,
                    "items":[
                        {
                            "lib_id":3,
                            "lib_name":"haha",
                            "person_id":3,
                            "person_name":"xx",
                            "pic_id":1,
                            "pic_url":"xx"
                        }
                    ]
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void QueryPersonListByTask(string cond, out string result);

        /**
         * @brief  QueryCaptureResult ʵʱ��ѯץ�Ľ����
         * @since  V3.20180922
         * @update V3.20181018 ����ʶ������
         * @update V3.20190102 �޸Ĳ�����task_guidΪtask_id
         *
         * @param cond ����id��
            example:
            {
                "task_id": "1,2,3"      // ����id�б�,ALL:��ʾȫ��
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0,
                "info":
                {
                    "capture_info":
                    {
                        "capture_id": "fdsafsdadsasd",
                        "task_id": 3,
                        "task_name": "xx",
                        "video_id": 2,
                        "video_name": "xxx",
                        "video_location": "video location or video path",
                        "capture_scene_url": "scene image file url",
                        "capture_photo_url": "capture photo file url",
                        "capture_time": "2018-08-02 23:00:00"
                    },
                    "compare_results": [
                        {
                            "lib_id": 1,
                            "lib_name": "lib",
                            "person_id": 1,
                            "person_name": "john",
                            "card_no": "",
                            "group": 2,     // �ڰ�����,�μ�<Whitelist>
                            "category": 0,  // ��Ա���,0:δ����
                            "pic_url": "http://ip:port/x.jpg",
                            "compare_score": 0.0,
                            "classify": 0   // ʶ�����,�μ�<ResultClassify>
                        },
                        ...
                    ]
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void QueryCaptureResult(string cond, out string result);

        /**
         * @brief  GetRealtimeCaptureInfo ʵʱ��ѯץ�Ľ����
         * @since  V3.20200505
         * @update V3.20200526 ��ѯ����Ԥ��
         *
         * @param cond <Ԥ��>
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0,
                "info": {
                    "alarm_type": 1,    �澯����,1:����ץ��,2:����ȱϯ�澯,3:���������澯
                    "alarm_info": {}    �澯��Ϣ,json-array
                }
            }
            for alarm_info:
            {
                "capture_info":
                {
                    "capture_id": "fdsafsdadsasd",
                    "task_id": 3,           // ����id
                    "task_name": "xx",      // ��������
                    "video_id": 2,          // ��Ƶid
                    "video_name": "xxx",    // ��Ƶ����
                    "video_location": "",   // ��Ƶλ�û�·��
                    "org_id": 1,            // ��֯id
                    "organization": "",     // ��֯��
                    "site_id": 1,           // ��ַid
                    "site_name": "",        // ��ַ��
                    "wear_mask": true,      // �Ƿ��������
                    "temperature": 36.5,    // ����,��λ:���϶�
                    "is_fever": true,       // �Ƿ���,true:����,false:δ����
                    "capture_photo_url": "",// ץ��������
                    "capture_scene_url": "",// ץ�ĳ�����
                    "capture_time": "2018-08-02 23:00:00"
                },
                "compare_results": [
                    {
                        "lib_id": 1,            // �׿�id
                        "lib_name": "lib",      // �׿�����
                        "person_id": 1,         // ��Աid
                        "person_name": "john",  // ����
                        "card_no": "",          // ֤����
                        "group": 2,             // �ڰ�����,�μ�<Whitelist>
                        "category": 0,          // ��Ա���,0:δ����
                        "pic_url": "http://ip:port/x.jpg",
                        "compare_score": 0.0,   // �ȶԵ÷�
                        "classify": 0           // ʶ�����,�μ�<ResultClassify>
                        "stranger":             // İ���˿�ȶ���Ϣ,ʶ��Ϊİ����ʱ��Ч
                        {
                            "is_first": true,       // �Ƿ��״����
                            "stranger_id": "",      // İ����id
                            "pic_url": "",          // ͼƬ·��
                            "compare_score": 0.0,   // �ȶԵ÷�
                        }
                    },
                    ...
                ]
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void GetRealtimeCaptureInfo(string cond, out string result);

        /**
         * @brief  GetFaceDeviceRealtimeCaptureInfo ��ȡ�����Ž�ʵʱץ����Ϣ
         * @since  V3.20200505
         * @update V3.20200526 ��ѯ����Ԥ��
         *
         * @param cond <Ԥ��>
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0,
                "info": {
                    "alarm_type": 1,    �澯����,4:�����Ž��豸ץ��
                    "alarm_info": {}    �澯��Ϣ,json-array
                }
            }
            for alarm_info:
            {
                "capture_info":
                {
                    "dev_id": 1,            // �豸id
                    "dev_name": "",         // �豸��
                    "in_out": 0,            // �豸������ʶ,0:δ֪,1:����,2:����
                    "org_id": 1,            // ��֯id
                    "organization": "",     // ��֯��
                    "site_id": 1,           // ��ַid
                    "site_name": "",        // ��ַ��
                    "lib_id": 1,            // �׿�id
                    "lib_name": 1,          // �׿���
                    "person_id": 1,         // ��Աid
                    "name": "zhangsan",     // ��Ա����
                    "gender": 0,            // �Ա�0:δ֪,1:��,2:Ů
                    "card_no": "",          // ֤����
                    "group": 2,             // �ڰ�����,�μ�<Whitelist>
                    "category": 0,          // ��Ա���,0:δ����
                    "compare_score": 0.98,  // �ȶԵ÷�
                    "wear_mask": true,      // �Ƿ��������
                    "temperature": 36.5,    // ����,��λ:���϶�
                    "is_fever": true,       // �Ƿ���,true:����,false:δ����
                    "classify": 0,          // ʶ�����,�μ�<ResultClassify>
                    "capture_time": "",     // ץ��ʱ��,��ʽ:2018-08-03 10:30:00
                    "pic_url": ""           // ע��ͼƬURL
                    "capture_url": "",      // ץ��ͼƬURL
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void GetFaceDeviceRealtimeCaptureInfo(string cond, out string result);

        /**
         * @brief  QueryRealtimeResult ʵʱ��ѯץ�Ľ��<ӭ��>��
         * @since  V3.20180922
         * @update V3.20181009 ���ӹ������״̬
         * @update V3.20181018 ����ʶ������
         * @update V3.20190416 ������ְʱ�估����
         * @update V3.20200527 ������֯��Ϣ����
         *
         * @param cond ��ѯ����
            example:
            {
                "task_id": 1,       ѡ��,int,����id
                "task_type": 1,     ѡ��,int,��������
                "task_list": "1,2"  ѡ��,string,����id�б�,id֮���Զ��ŷָ�
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0,
                "info":
                {
                    "items":[
                        {
                            "task_id": 3,
                            "task_name": "xx",
                            "task_type": 1,
                            "org_id": 1,            // ��֯id
                            "organization": "",     // ��֯��
                            "video_id": 2,
                            "video_name": "xx",
                            "video_url": "video location or video path",
                            "person_id": 3,
                            "person_name": "",
                            "group": 2,             // �ڰ�����,�μ�<Whitelist>
                            "category": 0,          // ��Ա���,0:δ����
                            "birthday": "",         // ����,Ա����Ч,��ʽ:YYYY-mm-dd
                            "hiredate": "",         // ��ְʱ��,Ա����Ч,��ʽ:YYYY-mm-dd
                            "company": "",          // ��˾����
                            "position": "",         // ְλ
                            "compare_score": 0.9,
                            "classify": 0,          // ʶ�����,�μ�<ResultClassify>
                            "signin": 0,            // ǩ��/ǩ��״̬��0:δ��ʼ,1:��ʼǩ��,2:��ʼǩ��
                            "work_state": 0,        // �������״̬��0:δ��,1:�ѵ�,2:���
                            "speech_url": "http://ip:port/1.wav",
                            "pic_id": 1,
                            "pic_url": "picture image file path",
                            "capture_photo_url": "capture photo file url",
                            "capture_scene_url": "scene image file url",
                            "capture_time": "2018-08-02 23:00:00",
                            "group_message": "",
                            "personal_message": "",
                        }
                    ]
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void QueryRealtimeResult(string cond, out string result);

        /**
         * @brief  QueryFileCaptureResult ʵʱ��ѯ��Ƶ�ļ���ץ�Ľ����
         * @since  V3.20180922
         * @update V3.20181018 ����ʶ������
         *
         * @param cond ����id��
            example:
            {
                "task_id": "1"
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0,
                "info":
                {
                    "capture_info":
                    {
                        "capture_id": "fdsafsdadsasd",
                        "task_id": 3,
                        "task_name": "xx",
                        "video_id": 2,
                        "video_name": "xxx",
                        "video_location": "video location or video path",
                        "capture_scene_url": "scene image file url",
                        "capture_photo_url": "capture photo file url",
                        "capture_time": "2018-08-02 23:00:00"
                    },
                    "compare_results": [
                        {
                            "lib_id": 1,
                            "lib_name": "lib",
                            "person_id": 1,
                            "person_name": "john",
                            "card_no": "",
                            "group": 2,     // �ڰ�����,�μ�<Whitelist>
                            "category": 0,  // ��Ա���,0:δ����
                            "pic_url": "http://ip:port/x.jpg",
                            "compare_score": 0.0,
                            "classify": 0   // ʶ�����,�μ�<ResultClassify>
                        },
                        ...
                    ]
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void QueryFileCaptureResult(string cond, out string result);

        /**
         * @brief  QueryCaptureAlarmList ��ѯץ�ĸ澯��ʷ��¼��
         * @since  V3.20180922
         * @update V3.20181018 ���Ӳ�ѯ����������ʶ������
         * @update V3.20190102 ɾ��task_guid
         * @update V3.20200306 ���ӿ���ʶ���ֶ�
         * @update V3.20200324 ���������¶��ֶ�
         *
         * @param cond ��ѯ������
            example:
            {
                "page_no": 1,       ���ҳ�š�
                "page_size": 10,    ���ҳ��С��
                "operator": "admin",����,string,������
                "query_cond": {
                    "task_id": 1,       ѡ������id��
                    "task_name": "",    ѡ���������
                    "capture_id": "",   ѡ�ץ����Ƭ��guid��
                    "video_id": 1,      ѡ���Ƶ��id��
                    "lib_id": 1,        ѡ��׿�id��0��ʾ��ѯ���е׿⡣<����>
                    "lib_list": "1,2",  ѡ��׿�id�б�id֮���Զ��ŷָ�����lib_id֮����ѡ��1����ѡlib_list��
                    "person_name": "",  ѡ�������ģ����ѯ��
                    "card_no": "",      ѡ����֤�ţ�ģ����ѯ��
                    "score_min": 0.86,  ѡ��ȶԵ���С�÷֡�
                    "classify": 1,      ѡ�ʶ�����,�μ�<ResultClassify>
                    "begin_time": "",   ѡ���ѯ�Ŀ�ʼʱ�䡣
                    "end_time": "",     ѡ���ѯ�Ľ���ʱ�䡣
                    "task_type": 1,     ���Ϊhist_camera_capture��hist_file_capture,�����hist_file_capture�����������²���
                    "file_url": ""      ѡ���Ƶ����ַ��ͨ�������ַ��ȡvideo��Ϣ���ٲ�ѯ��ʷ��¼��������������ַ���ͻ�ʹ��videoId�ֶΡ�
                }
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0,
                "info": 
                {
                    "page_no": 2,
                    "page_size": 10,
                    "total_count": 1024,
                    "items": [
                        {
                            "capture_history_id": 3                 // ץ�ı��id��
                            "task_id": 3,                           // ����id��
                            "task_name": "xxx",                     // ��������
                            "video_id": 3,                          // ��Ƶ��id��
                            "video_name": "xx",                     // ��Ƶ�����ơ�
                            "video_location": "xxx",                // ��Ƶ������λ�á�
                            "capture_scene_url": "xx",              // ץ�ĵĳ���ͼƬ��ַ��
                            "capture_photo_url": "xx",              // ץ�ĵ�ͷ��ͼƬ��ַ��
                            "score_threshold": 0.85,                // ��ֵ��
                            "age": 32,                              // ���䡣
                            "gender": "Male",                       // �Ա�Male��Female��Unknown��
                            "angle_pitch": 15.0,                    // ���������ǡ�
                            "angle_yaw": 15.0,                      // ����ƫ���ǡ�
                            "angle_roll": 15.0,                     // ������ת�ǡ�
                            "temperature": 36.5,                    // ����,��λ:���϶�
                            "is_fever": false,                      // �Ƿ���,true:����,false:δ����
                            "wear_mask": true,                      // �Ƿ��������
                            "consuming_msec": 3000,                 // ץ�ĺͱȶԺ�ʱ����λms��
                            "capture_time": "xxxx-xx-xx xx:xx:xx",  // ץ�ĵ�ʱ�䡣
                            "capture_timestamp": 4314321432143232,  // ץ�ĵ�ʱ�����
                            "compare_results": [
                                {
                                    "compare_history_id": 2,        // �ȶԱ�ļ�¼id��
                                    "lib_id": 3,                    // �׿�id��
                                    "lib_name": "xx",               // �׿�����
                                    "person_id": 3,                 // �˵�id��
                                    "person_name": "xx",            // ������
                                    "card_no": "xx",                // ���֤�š�
                                    "group": 2,                     // �ڰ�����,�μ�<Whitelist>
                                    "category": 0,                  // ��Ա���,0:δ����
                                    "pic_id": 3,                    // �˵ĵ׿���Ƭid��
                                    "pic_url": "xx",                // �˵ĵ׿���Ƭ·����
                                    "compare_score": 0.24,          // �ȶԵ÷֡�
                                    "classify": 0                   // ʶ�����,�μ�<ResultClassify>
                                }
                            ]
                        }
                    ]
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void QueryCaptureAlarmList(string cond, out string result);

        /**
         * @brief  QueryDynamicAlarmList ��ѯץ�ĺ͸澯��ʷ��¼��
         * @since  V3.20190620
         * @update V3.20200306 ���ӿ���ʶ���ֶ�
         * @update V3.20200324 ���������¶��ֶ�
         *
         * @param cond ��ѯ������
            example:
            {
                "page_no": 1,       ���ҳ�š�
                "page_size": 10,    ���ҳ��С��
                "operator": "admin",����,string,������
                "query_cond": {
                    "task_id": 1,       ѡ������id��
                    "task_name": "",    ѡ���������
                    "capture_id": "",   ѡ�ץ����Ƭ��guid��
                    "video_id": 1,      ѡ���Ƶ��id��
                    "lib_id": 1,        ѡ��׿�id��0��ʾ��ѯ���е׿⡣<����>
                    "lib_list": "1,2",  ѡ��׿�id�б�id֮���Զ��ŷָ�����lib_id֮����ѡ��1����ѡlib_list��
                    "person_name": "",  ѡ�������ģ����ѯ��
                    "card_no": "",      ѡ����֤�ţ�ģ����ѯ��
                    "score_min": 0.86,  ѡ��ȶԵ���С�÷֡�
                    "classify": 1,      ѡ�ʶ�����,�μ�<ResultClassify>
                    "begin_time": "",   ѡ���ѯ�Ŀ�ʼʱ�䡣
                    "end_time": "",     ѡ���ѯ�Ľ���ʱ�䡣
                    "task_type": 1,     ���Ϊhist_camera_capture��hist_file_capture,�����hist_file_capture�����������²���
                    "file_url": ""      ѡ���Ƶ����ַ��ͨ�������ַ��ȡvideo��Ϣ���ٲ�ѯ��ʷ��¼��������������ַ���ͻ�ʹ��videoId�ֶΡ�
                    "temperature_min": 36.5, ѡ��,float,�������,��λ:���϶�
                    "fever": 1               ѡ��,int,���ձ��,0:����,1:����
                }
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0,
                "info": 
                {
                    "page_no": 2,
                    "page_size": 10,
                    "total_count": 1024,
                    "items": [
                        {
                            "capture_history_id": 3                 // ץ�ı��id��
                            "task_id": 3,                           // ����id��
                            "task_name": "xxx",                     // ��������
                            "video_id": 3,                          // ��Ƶ��id��
                            "video_name": "xx",                     // ��Ƶ�����ơ�
                            "video_location": "xxx",                // ��Ƶ������λ�á�
                            "capture_scene_url": "xx",              // ץ�ĵĳ���ͼƬ��ַ��
                            "capture_photo_url": "xx",              // ץ�ĵ�ͷ��ͼƬ��ַ��
                            "score_threshold": 0.85,                // ��ֵ��
                            "age": 32,                              // ���䡣
                            "gender": "Male",                       // �Ա�Male��Female��Unknown��
                            "angle_pitch": 15.0,                    // ���������ǡ�
                            "angle_yaw": 15.0,                      // ����ƫ���ǡ�
                            "angle_roll": 15.0,                     // ������ת�ǡ�
                            "temperature": 36.5,                    // ����,��λ:���϶�
                            "is_fever": false,                      // �Ƿ���,true:����,false:δ����
                            "wear_mask": true,                      // �Ƿ��������
                            "consuming_msec": 3000,                 // ץ�ĺͱȶԺ�ʱ����λms��
                            "capture_time": "xxxx-xx-xx xx:xx:xx",  // ץ�ĵ�ʱ�䡣
                            "capture_timestamp": 4314321432143232,  // ץ�ĵ�ʱ�����
                            "compare_results": [
                                {
                                    "compare_history_id": 2,        // �ȶԱ�ļ�¼id��
                                    "lib_id": 3,                    // �׿�id��
                                    "lib_name": "xx",               // �׿�����
                                    "person_id": 3,                 // �˵�id��
                                    "person_name": "xx",            // ������
                                    "card_no": "xx",                // ���֤�š�
                                    "group": 2,                     // �ڰ�����,�μ�<Whitelist>
                                    "category": 0,                  // ��Ա���,0:δ����
                                    "pic_id": 3,                    // �˵ĵ׿���Ƭid��
                                    "pic_url": "xx",                // �˵ĵ׿���Ƭ·����
                                    "compare_score": 0.24,          // �ȶԵ÷֡�
                                    "classify": 0                   // ʶ�����,�μ�<ResultClassify>
                                }
                            ]
                        }
                    ]
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void QueryDynamicAlarmList(string cond, out string result);

        /**
         * @brief  QueryCapturePhotoList ��ѯץ����Ƭ��ʷ��¼��
         * @since  V3.20180922
         * @update V3.20181018 ȥ��İ���˱��
         * @update V3.20190102 ɾ��task_guid
         * @update V3.20200306 ���ӿ���ʶ���ֶ�
         * @update V3.20200324 ���������¶��ֶ�
         *
         * @param cond ��ѯ������
            example:
            {
                "page_no": 1,       ���ҳ�š�
                "page_size": 10,    ���ҳ��С��
                "operator": "admin",����,string,������
                "query_cond": {
                    "task_id": 1,       ѡ������id��
                    "task_name": "",    ѡ���������
                    "capture_id": "",   ѡ�ץ����Ƭ��guid��
                    "video_id": 1,      ѡ���Ƶ��id��
                    "begin_time": "",   ѡ���ѯ�Ŀ�ʼʱ�䡣
                    "end_time": "",     ѡ���ѯ�Ľ���ʱ�䡣
                    "task_type": "",    ���Ϊhist_camera_capture��hist_file_capture,�����hist_file_capture�����������²���
                    "file_url": ""      ѡ���Ƶ����ַ��ͨ�������ַ��ȡvideo��Ϣ���ٲ�ѯ��ʷ��¼��������������ַ���ͻ�ʹ��videoId�ֶΡ�
                }
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0,
                "info": 
                {
                    "page_no": 2,
                    "page_size": 10,
                    "total_count": 1024,
                    "items": [
                        {
                            "capture_history_id": 3                 // ץ�ı��id��
                            "task_id": 3,                           // ����id��
                            "task_name": "xxx",                     // ��������
                            "video_id": 3,                          // ��Ƶ��id��
                            "video_name": "xx",                     // ��Ƶ�����ơ�
                            "video_location": "xxx",                // ��Ƶ������λ�á�
                            "capture_scene_url": "xx",              // ץ�ĵĳ���ͼƬ��ַ��
                            "capture_photo_url": "xx",              // ץ�ĵ�ͷ��ͼƬ��ַ��
                            "age": 32,                              // ���䡣
                            "gender": "Male",                       // �Ա�Male��Female��Unknown��
                            "angle_pitch": 15.0,                    // ���������ǡ�
                            "angle_yaw": 15.0,                      // ����ƫ���ǡ�
                            "angle_roll": 15.0,                     // ������ת�ǡ�
                            "temperature": 36.5,                    // ����,��λ:���϶�
                            "is_fever": false,                      // �Ƿ���,true:����,false:δ����
                            "wear_mask": true,                      // �Ƿ��������
                            "capture_time": "xxxx-xx-xx xx:xx:xx",  // ץ�ĵ�ʱ�䡣
                            "capture_timestamp": 4314321432143232,  // ץ�ĵ�ʱ�����
                        }
                    ]
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void QueryCapturePhotoList(string cond, out string result);

        /**
         * @brief  QueryRetrieveHistoryList ��ѯͼƬ������ʷ��¼��
         * @since  V3.20180922
         *
         * @param cond ��ѯ������
            example:
            {
                "page_no" : 1       ���ҳ�š�
                "page_size" : 10    ���ҳ��С��
                "operator": "admin",����,string,������
                "query_cond": {
                    "lib_id" : 1        ѡ��׿�id��0��ʾ��ѯ���е׿⡣
                    "person_name" : ""  ѡ�������ģ����ѯ��
                    "card_no" : ""      ѡ����֤�ţ�ģ����ѯ��
                    "begin_time" : ""   ѡ���ѯ�Ŀ�ʼʱ�䡣
                    "end_time" : ""     ѡ���ѯ�Ľ���ʱ�䡣
                }
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0,
                "info": 
                {
                    "page_no": 2,
                    "page_size": 10,
                    "total_count": 1024,
                    "items": [
                        {
                            "retrieve_history_id": 3                // ����ͼƬ���id
                            "retrieve_scene_url": "xx",             // ����ͼƬ�ĵ�ַ��
                            "consuming_msec": 3000,                 // ������ʱ����λms��
                            "retrieve_time": "xxxx-xx-xx xx:xx:xx", // ������ʱ�䡣
                            "compare_results": [
                                {
                                    "compare_history_id": 2,    // �ȶԱ��id��
                                    "person_id": 3,             // �˵�id��
                                    "person_name": "xx",        // ������
                                    "card_no": "xx",            // ���֤�š�
                                    "lib_id": 3,                // �׿�id��
                                    "lib_name": "xx",           // �׿�����
                                    "pic_id": 3,                // �˵ĵ׿���Ƭid��
                                    "pic_url": "xx",            // �˵ĵ׿���Ƭ·����
                                    "compare_score": 0.24,      // �ȶԵ÷֡�
                                }
                            ]
                        }
                    ]
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void QueryRetrieveHistoryList(string cond, out string result);

        /**
         * @brief  QueryRetrieveCaptureLibraryList ��ѯץ�Ŀ�ͼƬ������ʷ��¼��
         * @since  V3.20180922
         *
         * @param cond ��ѯ������
            example:
            {
                "page_no" : 1       ���ҳ�š�
                "page_size" : 10    ���ҳ��С��
                "operator": "admin",����,string,������
                "query_cond": {
                    "begin_time" : ""   ѡ���ѯ�Ŀ�ʼʱ�䡣
                    "end_time" : ""     ѡ���ѯ�Ľ���ʱ�䡣
                    "video_id" : 1      ѡ���Ƶ��id��
                }
            }
         * @param result    �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0,
                "info": 
                {
                    "page_no": 2,
                    "page_size": 10,
                    "total_count": 1024,
                    "items": [
                        {
                            "retrieve_history_id": 3                 // ����ͼƬ���id��
                            "retrieve_scene_url": "xx",              // ����ͼƬ�ĵ�ַ��
                            "consuming_msec": 3000,                  // ������ʱ����λms��
                            "retrieve_time": "xxxx-xx-xx xx:xx:xx",  // ������ʱ�䡣
                            "compare_results": [
                                {
                                    "compare_history_id": 2,                          // �ȶԱ��id��
                                    "capture_id": "capture url",
                                    "capture_photo_url": "capture photo url",
                                    "capture_scene_url": "capture scene url",
                                    "capture_time": "2018-08-02 23:00:00",
                                    "video_id": 3,
                                    "video_name": "xxx",
                                    "video_location": "xcsdad",
                                    "compare_score": 0.24,                           // �ȶԵ÷�
                                    "age": 30,
                                    "gender": "Female"                              // Male��Female��Unknown
                                }
                            ]
                        }
                    ]
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void QueryRetrieveCaptureLibraryList(string cond, out string result);

        /**
         * @brief  QueryHistory ��ѯ����ʶ����ʷ�б�
         * @since  V3.20180922
         * @update V3.20181018 ����ʶ������
         * @update V3.20200306 ���ӿ���ʶ���ֶ�
         * @update V3.20200324 ���������¶��ֶ�
         *
         * @param cond ���������Ϣ
            example:
            {
                "page_no":xx,       ����,int,ҳ��
                "page_size":xx      ����,int,ÿҳ����
                "operator": "admin",����,string,������
                "query_cond": {
                    "task_id":xx,       ѡ��,int,����id
                    "video_id":xx,      ѡ��,int,����ͷid
                    "lib_id":xx,        ѡ��,int,�Ϳ�id
                    "person_name":xx,   ѡ��,string,��Ա������ģ����ѯ
                    "card_no":xx,       ѡ��,string,��Ա֤���ţ�ģ����ѯ
                    "score_min":xx,     ѡ��,float,�ȶԵ���С�÷�
                    "score_max":xx,     ѡ��,float,�ȶԵ����÷�
                    "begin_time":xx,    ѡ��,string,��ѯ�Ŀ�ʼʱ��
                    "end_time":xx,      ѡ��,string,��ѯ�Ľ���ʱ��
                    "temperature_min": 36.5, ѡ��,float,�������,��λ:���϶�
                    "fever": 1,              ѡ��,int,���ձ��,0:����,1:����
                    "siteid_list":""         ѡ��,String,����ѯ�ص�id�б�
                }
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0, 
                "info":
                {
                    "page_no":xx,
                    "page_size":xx,
                    "total_count":xx,
                    "items": [
                        {
                            "id": 1,            int,��¼id
                            "person_id": 0,     int,��Աid
                            "person_name": "xx",string,��Ա����
                            "gender": 1,        int,�Ա� 0��δ֪,1����,2��Ů
                            "card_no": "xx",    string,֤����
                            "group": 2,         int,�ڰ�����,�μ�<Whitelist>
                            "category": 0,      int,��Ա���,0:δ����
                            "lib_name": "xxx",  string,�׿���
                            "video_name": "xxx",string,����ͷ��
                            "temperature": 36.5,string,����,��λ:���϶�
                            "is_fever": false,  bool,�Ƿ���,true:����,false:δ����
                            "wear_mask": true,  bool,�Ƿ��������
                            "pic_url": "xxx",   string,�׿���Ƭ·��
                            "org_id": 1,        int,��֯id
                            "organization": "", string,��֯��
                            "site_id": 1,       int,��ַid
                            "site_name": "",    string,��ַ��
                            "capture_photo_url": "xxx",string,ץ��ͷ���url
                            "capture_scene_url": "xxx",string,ץ�ĳ�����url
                            "compare_score":0.8,    float,�ȶԵ÷�
                            "classify": 0,          int,ʶ�����,�μ�<ResultClassify>
                            "check_time": "xxx",    string,�ȶ�ʱ��
                        },...
                    ]
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void QueryHistory(string cond, out string result);

        /**
         * @brief  DeleteHistory ɾ������ʶ����ʷ��¼
         * @since  V3.20190308
         *
         * @param record ��¼��Ϣ
            example:
            {
                "id": 1,    ����,int,��¼id
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void DeleteHistory(string record, out string result);

        /**
         * @brief  BatchDeleteHistory ɾ������ʶ����ʷ��¼
         * @since  V3.20190308
         *
         * @param batch ����ɾ������
            example:
            {
                "id_list": "1,2",   ����,string,��¼id�б�
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void BatchDeleteHistory(string batch, out string result);

         /**
         * @brief  QueryStrangerHistory ��ѯİ����ʶ����ʷ�б�
         * @since  V3.20190712
         * @update V3.20200306 ���ӿ���ʶ���ֶ�
         * @update V3.20200324 ���������¶��ֶ�
         *
         * @param cond ���������Ϣ
            example:
            {
                "page_no":xx,       ����,int,ҳ��
                "page_size":xx      ����,int,ÿҳ����
                "operator": "admin",����,string,������
                "query_cond": {
                    "task_id":xx,       ѡ��,int,����id
                    "video_id":xx,      ѡ��,int,����ͷid
                    "score_min":xx,     ѡ��,float,�ȶԵ���С�÷�
                    "begin_time":xx,    ѡ��,string,��ѯ�Ŀ�ʼʱ��
                    "end_time":xx,      ѡ��,string,��ѯ�Ľ���ʱ��
                    "temperature_min": 36.5, ѡ��,float,�������,��λ:���϶�
                    "fever": 1               ѡ��,int,���ձ��,0:����,1:����
                }
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0, 
                "info":
                {
                    "page_no":xx,
                    "page_size":xx,
                    "total_count":xx,
                    "items": [
                        {
                            "id": 1,                int,��¼id
                            "stranger_id": "xx",    string,ʶ�����
                            "age": 1,               int,����
                            "gender": 1,            int,�Ա� 0��δ֪,1����,2��Ů
                            "pic_path": "xx",       string,ͼƬ·��
                            "temperature": 36.5,    string,����,��λ:���϶�
                            "is_fever": false,      bool,�Ƿ���,true:����,false:δ����
                            "wear_mask": true,      bool,�Ƿ��������
                            "compare_score":0.8,    float,�ȶԵ÷�
                            "video_name": "xxx",    string,����ͷ��
                            "task_name": "xxx",     string,������
                            "capture_photo_url": "xxx",string,ץ��ͷ���url
                            "capture_scene_url": "xxx",string,ץ�ĳ�����url
                            "create_time": "xxx",   string,����ʱ��
                        },...
                    ]
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void QueryStrangerHistory(string cond, out string result);

        /**
         * @brief  DeleteStrangerHistory ɾ��İ����ʶ����ʷ��¼
         * @since  V3.20190712
         *
         * @param record ��¼��Ϣ
            example:
            {
                "id": 1,    ����,int,��¼id
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void DeleteStrangerHistory(string record, out string result);

        /**
         * @brief  BatchDeleteStrangerHistory ����ɾ��İ����ʶ����ʷ��¼
         * @since  V3.201903712
         *
         * @param batch ����ɾ������
            example:
            {
                "id_list": "1,2",   ����,string,��¼id�б�
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void BatchDeleteStrangerHistory(string batch, out string result);

        /**
         * @brief  QueryLatestSmartAccessRecord ��ѯ����������Ž�ͨ�м�¼ ��������
         * @since  V3.2020/02/26
         * @update V3.20200306 ���ӿ���ʶ���ֶ�
         *
         * @param cond ��ѯ����
            example:
            {
                "person_id": 1,     ����,int,��Աid
                "number": 10,       ѡ��,int,����,Ĭ��Ϊ10
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0,
                "info": {
                    "items": [
                        {
                            "id": 1,                // ��¼id
                            "lib_id": 1,            // �׿�id
                            "lib_name": 1,          // �׿���
                            "name": "zhangsan",     // ��Ա����
                            "gender": 0,            // �Ա�0:δ֪,1:��,2:Ů
                            "card_no": "",          // ֤����
                            "group": 2,             // �ڰ�����,�μ�<Whitelist>
                            "category": 0,          // ��Ա���,0:δ����
                            "compare_score": 0.98,  // �ȶԵ÷�
                            "wear_mask": true,      // �Ƿ��������
                            "temperature": 36.5,    // ����,��λ:���϶�
                            "is_fever": true,       // �Ƿ���,true:����,false:δ����
                            "classify": 0,          // ʶ�����,�μ�<ResultClassify>
                            "dev_id": 1,            // �豸id
                            "dev_name": "",         // �豸��
                            "in_out": 0,            // �豸������ʶ,0:δ֪,1:����,2:����
                            "access_time": "2018-08-03 10:30:00",   // ͨ��ʱ��
                            "capture_time": "2018-08-03 10:30:00",  // ץ��ʱ��
                            "pic_url": "http://192.168.1.1:8001/p/1.jpg"        // ע��ͼƬURL
                            "capture_url": "http://192.168.1.1:8001/c/1.jpg",   // ץ��ͼƬURL
                        }
                    ]
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void QueryLatestSmartAccessRecord(string cond, out string result);
        
        /**
         * @brief  QueryLatestCaptureRecord ��ѯ�������Աץ�ļ�¼
         * �˽ӿ����QueryLatestSmartAccessRecord�ӿ�
         * @since  V3.2020/03/27
         *
         * @param cond ��ѯ����
            example:
            {
                "alarm_type": 1,    �澯����,1:����ץ��,2:����ȱϯ�澯,3:���������澯,4:�����Ž��豸ץ��
                "person_id": 1,     ����,int,��Աid
                "number": 10,       ѡ��,int,����,Ĭ��Ϊ10
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0,
                "info": {
                    "items": [
                        {
                            "id": 1,                // ��¼id
                            "lib_id": 1,            // �׿�id
                            "lib_name": 1,          // �׿���
                            "name": "zhangsan",     // ��Ա����
                            "gender": 0,            // �Ա�0:δ֪,1:��,2:Ů
                            "card_no": "",          // ֤����
                            "group": 2,             // �ڰ�����,�μ�<Whitelist>
                            "category": 0,          // ��Ա���,0:δ����
                            "compare_score": 0.98,  // �ȶԵ÷�
                            "wear_mask": true,      // �Ƿ��������
                            "temperature": 36.5,    // ����,��λ:���϶�
                            "is_fever": true,       // �Ƿ���,true:����,false:δ����
                            "classify": 0,          // ʶ�����,�μ�<ResultClassify>
                            "dev_id": 1,            // �豸id
                            "dev_name": "",         // �豸��
                            "in_out": 0,            // �豸������ʶ,0:δ֪,1:����,2:����
                            "access_time": "2018-08-03 10:30:00",   // ͨ��ʱ��
                            "capture_time": "2018-08-03 10:30:00",  // ץ��ʱ��
                            "pic_url": "http://192.168.1.1:8001/p/1.jpg"        // ע��ͼƬURL
                            "capture_url": "http://192.168.1.1:8001/c/1.jpg",   // ץ��ͼƬURL
                        }
                    ]
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void QueryLatestCaptureRecord(string cond, out string result);

        /**
         * @brief  QuerySmartAccessRecord ��ѯ�����Ž�ͨ�м�¼
         * @since  V3.20190308
         * @update V3.20200217 ����֧���豸�б��ѯ����
         * @update V3.20200217 ����֧�����²�ѯ����
         * @update V3.20200306 ���ӿ���ʶ���ֶ�
         * @update V3.20200508 ������֯��Ϣ����
         *
         * @param cond ��ѯ����
            example:
            {
                "page_no": 1,           ����,ҳ��
                "page_size": 10         ����,ҳ�ߴ�
                "operator": "admin",    ����,string,������
                "org_id": 1,            ����,int,��֯id
                "query_cond": {
                    "lib_id": 1,            ѡ��,int,�׿�id
                    "dev_id": 1,            ѡ��,int,�Ž�id
                    "dev_list": "1,2",      ѡ��,string,�豸�б�, �Զ��ż��
                    "name": "xxx",          ѡ��,string,��Ա������ģ��ƥ��
                    "card_no": "",          ѡ��,string,֤���ţ���ȷ��ѯ
                    "classify": 2,          ѡ��,int,ʶ�����,�μ�<ResultClassify>
                    "begin_time": "xxxx",   ѡ��,string,ͨ��ʱ��Ĳ�ѯ��ʼʱ�䣬��ʽ��YYYY-MM-DD HH:mm:ss
                    "end_time": "xxxx",     ѡ��,string,ͨ��ʱ��Ĳ�ѯ����ʱ�䣬��ʽ��YYYY-MM-DD HH:mm:ss
                    "score_min": 0.6,       ѡ��,float,�ȶԵ���С�÷�
                    "score_max": 0.9,       ѡ��,float,�ȶԵ����÷�
                    "temperature_min": 36.5 ѡ��,float,�������,��λ:���϶�
                    "fever": 1,             ѡ��,int,���ձ��,0:����,1:����
                    "siteid_list":""        ѡ��,String,����ѯ�ص�id�б�
                    "site_list":""        ѡ��,String,����ѯ�ص�id�б�
                }
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0,
                "info": {
                    "page_no": 1,       // ҳ��
                    "page_size": 10,    // ҳ�ߴ�
                    "total_count": 1,   // ����
                    "items": [
                        {
                            "id": 1,                // ��¼id
                            "lib_id": 1,            // �׿�id
                            "lib_name": 1,          // �׿���
                            "name": "zhangsan",     // ��Ա����
                            "gender": 0,            // �Ա�0:δ֪,1:��,2:Ů
                            "card_no": "",          // ֤����
                            "group": 2,             // �ڰ�����,�μ�<Whitelist>
                            "category": 0,          // ��Ա���,0:δ����
                            "compare_score": 0.98,  // �ȶԵ÷�
                            "wear_mask": true,      // �Ƿ��������
                            "temperature": 36.5,    // ����,��λ:���϶�
                            "is_fever": true,       // �Ƿ���,true:����,false:δ����
                            "classify": 0,          // ʶ�����,�μ�<ResultClassify>
                            "dev_id": 1,            // �豸id
                            "dev_name": "",         // �豸��
                            "in_out": 0,            // �豸������ʶ,0:δ֪,1:����,2:����
                            "org_id": 1,            // ��֯id
                            "organization": "",     // ��֯��
                            "site_id": 1,           // ��ַid
                            "site_name": "",        // ��ַ��
                            "access_time": "2018-08-03 10:30:00",   // ͨ��ʱ��
                            "capture_time": "2018-08-03 10:30:00",  // ץ��ʱ��
                            "pic_url": "http://192.168.1.1:8001/p/1.jpg"        // ע��ͼƬURL
                            "capture_url": "http://192.168.1.1:8001/c/1.jpg",   // ץ��ͼƬURL
                        }
                    ]
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void QuerySmartAccessRecord(string cond, out string result);

        /**
         * @brief  DeleteSmartAccessRecord ɾ�������Ž�ͨ�м�¼
         * @since  V3.20190308
         *
         * @param record ��¼��Ϣ
            example: 
            {
                "id": 1,    ����,int,��¼id
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void DeleteSmartAccessRecord(string record, out string result);

        /**
         * @brief  BatchDeleteSmartAccessRecord ����ɾ�������Ž�ͨ�м�¼
         * @since  V3.20190308
         *
         * @param batch ����ɾ������
            example: 
            {
                "id_list": "1,2",   ����,string,��¼id�б�
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void BatchDeleteSmartAccessRecord(string batch, out string result);

        /**
         * @brief   QuerySmartIcCardRecord ��ѯ�����Ž�IC��ͨ�м�¼
         * @since  V3.20190508
         *
         * @param cond ��ѯ����
            example:
            {
                "page_no": 1,           ����,ҳ��
                "page_size": 10         ����,ҳ�ߴ�
                "operator": "admin",    ����,string,������
                "query_cond": {
                    "dev_id": 1,            ѡ��,�Ž�id
                    "ic_card_no": "",       ѡ��,IC���ţ���ȷƥ��
                    "begin_time": "xxxx",   ѡ��,ͨ��ʱ��Ĳ�ѯ��ʼʱ�䣬��ʽ��YYYY-MM-DD HH:mm:ss
                    "end_time": "xxxx",     ѡ��,ͨ��ʱ��Ĳ�ѯ����ʱ�䣬��ʽ��YYYY-MM-DD HH:mm:ss
                }
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0,
                "info": {
                    "page_no": 1,       // ҳ��
                    "page_size": 10,    // ҳ�ߴ�
                    "total_count": 1,   // ����
                    "items": [
                        {
                            "id": 1,                // ��¼id
                            "name": "zhangsan",     // ��Ա����
                            "card_no": "",          // ֤����
                            "category": 0,          // ��Ա���,0:δ����
                            "ic_card_no": "",       // IC����
                            "dev_id": 1,            // �豸id
                            "dev_name": "",         // �豸��
                            "in_out": 0,            // �豸������ʶ,0:δ֪,1:����,2:����
                            "access_time": "",      // ͨ��ʱ�䣬��ʽ��2018-08-03 10:30:00
                        }
                    ]
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void QuerySmartIcCardRecord(string cond, out string result);

        /**
         * @brief   DeleteSmartAccessIcCardRecord ɾ�������Ž�IC��ͨ�м�¼  
         * @since   V3.20190508
         *
         * @para record ��¼��Ϣ
            example:
            {
                "id": 1,    ����,int,��¼id
            }
         * @para result �ɹ���ʧ�ܡ���
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
         void DeleteSmartAccessIcCardRecord(string record, out string result);

         /**
         * @brief  BatchDeleteSmartAccessIcCardRecord ����ɾ�������Ž�IC��ͨ�м�¼
         * @since  V3.20190508
         *
         * @param batch ����ɾ������
            example: 
            {
                "id_list": "1,2",   ����,string,��¼id�б�
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void BatchDeleteSmartAccessIcCardRecord(string batch, out string result);

        /**
         * @brief   QuerySmartIdCardRecord ��ѯ�����Ž����֤ͨ�м�¼
         * @since  V3.20190508
         *
         * @param cond ��ѯ����
            example:
            {
                "page_no": 1,           ����,ҳ��
                "page_size": 10         ����,ҳ�ߴ�
                "operator": "admin",    ����,string,������
                "query_cond": {
                    "dev_id": 1,            ѡ��,�Ž�id
                    "name":"",              ѡ��,��Ա����,ģ��ƥ��
                    "card_no": "",          ѡ��,IC���ţ���ȷƥ��
                    "begin_time": "xxxx",   ѡ��,ͨ��ʱ��Ĳ�ѯ��ʼʱ�䣬��ʽ��YYYY-MM-DD HH:mm:ss
                    "end_time": "xxxx",     ѡ��,ͨ��ʱ��Ĳ�ѯ����ʱ�䣬��ʽ��YYYY-MM-DD HH:mm:ss
                }
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0,
                "info": {
                    "page_no": 1,       // ҳ��
                    "page_size": 10,    // ҳ�ߴ�
                    "total_count": 1,   // ����
                    "items": [
                        {
                            "id": 1,                // ��¼id
                            "name": "zhangsan",     // ��Ա����
                            "card_no": "",          // ֤����
                            "dev_id": 1,            // �豸id
                            "dev_name": "",         // �豸��
                            "in_out": 0,            // �豸������ʶ,0:δ֪,1:����,2:����
                            "access_time": "",      // ͨ��ʱ�䣬��ʽ��2018-08-03 10:30:00
                            "id_photo_url": "",     // ���֤��ƬURL
                            "capture_url": "",      // ץ��ͼƬURL������http://192.168.1.1:8001/c/1.jpg
                        }
                    ]
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void QuerySmartIdCardRecord(string batch, out string result);

        /**
         * @brief   DeleteSmartAccessIdCardRecord ɾ�������Ž����֤ͨ�м�¼  
         * @since   V3.20190508
         *
         * @para record ��¼��Ϣ
            example:
            {
                "id":1,      ����,int,��¼id
            }
         * @para result �ɹ���ʧ�ܡ���
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
         void DeleteSmartAccessIdCardRecord(string record, out string result);

         /**
         * @brief  BatchDeleteSmartAccessIdCardRecord ����ɾ�������Ž����֤ͨ�м�¼
         * @since  V3.20190508
         *
         * @param batch ����ɾ������
            example: 
            {
                "id_list": "1,2",   ����,string,��¼id�б�
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void BatchDeleteSmartAccessIdCardRecord(string batch, out string result);

        /**
         * @brief  QueryGeneralAccessRecord ��ѯ��ͨ�Ž�ͨ�м�¼
         * @since  V3.20190308
         *
         * @param cond ��ѯ����
            example:
            {
                "page_no": 1,           ����,ҳ��
                "page_size": 10         ����,ҳ�ߴ�
                "operator": "admin",    ����,string,������
                "query_cond": {
                    "lib_id": 1,            ѡ��,�׿�id
                    "dev_id": 1,            ѡ��,�Ž�id
                    "name": "xxx",          ѡ��,��Ա������ģ��ƥ��
                    "card_no": "",          ѡ��,֤���ţ���ȷ��ѯ
                    "classify": 2,          ѡ��,ʶ�����,�μ�<ResultClassify>
                    "begin_time": "xxxx",   ѡ��,ͨ��ʱ��Ĳ�ѯ��ʼʱ�䣬��ʽ��YYYY-MM-DD HH:mm:ss
                    "end_time": "xxxx",     ѡ��,ͨ��ʱ��Ĳ�ѯ����ʱ�䣬��ʽ��YYYY-MM-DD HH:mm:ss
                }
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0,
                "info": {
                    "page_no": 1,       // ҳ��
                    "page_size": 10,    // ҳ�ߴ�
                    "total_count": 1,   // ����
                    "items": [
                        {
                            "id": 1,                // ��¼id
                            "lib_id": 1,            // �׿�id
                            "lib_name": 1,          // �׿���
                            "name": "zhangsan",     // ��Ա����
                            "gender": 0,            // �Ա�0:δ֪,1:��,2:Ů
                            "card_no": "",          // ֤����
                            "group": 2,             // �ڰ�����,�μ�<Whitelist>
                            "category": 0,          // ��Ա���,0:δ����
                            "compare_score": 0.98,  // �ȶԵ÷�
                            "classify": 0,          // ʶ�����,�μ�<ResultClassify>
                            "dev_id": 1,            // �豸id
                            "dev_name": "",         // �豸��
                            "access_time": "2018-08-03 10:30:00",   // ͨ��ʱ��
                            "capture_time": "2018-08-03 10:30:00",  // ץ��ʱ��
                            "pic_url": "http://192.168.1.1:8001/p/1.jpg"        // ע��ͼƬURL
                            "capture_url": "http://192.168.1.1:8001/c/1.jpg",   // ץ��ͼƬURL
                        }
                    ]
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void QueryGeneralAccessRecord(string cond, out string result);

        /**
         * @brief  DeleteGeneralAccessRecord ɾ����ͨ�Ž�ͨ�м�¼
         * @since  V3.20190308
         *
         * @param record ��¼��Ϣ
            example: 
            {
                "id": 1,    ����,int,��¼id
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void DeleteGeneralAccessRecord(string record, out string result);

        /**
         * @brief  BatchDeleteGeneralAccessRecord ����ɾ����ͨ�Ž�ͨ�м�¼
         * @since  V3.20190308
         *
         * @param batch ����ɾ������
            example: 
            {
                "id_list": "1,2",   ����,string,��¼id�б�
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void BatchDeleteGeneralAccessRecord(string batch, out string result);

        /**
         * @brief  QuerySigninRecord ��ѯǩ����¼��
         * @since  V3.20180922
         *
         * @param cond ��ѯ������
            example:
            {
                "page_no": 1, int,      ���ҳ��
                "page_size":10, int,    ���ҳ�ߴ�
                "operator": "admin",    ����,string,������
                "query_cond": {
                    "begin_time":xx, string,    ѡ�ǩ����ʼʱ��
                    "end_time":xx, string,      ѡ�ǩ������ʱ��
                    "task_name":xx, string,     ѡ���������֧��ģ��ƥ��
                    "person_name":xx, string,   ѡ�������֧��ģ��ƥ��
                }
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code":0,
                "info":
                {
                    "page_no":1,
                    "page_size":10,
                    "total_count":100,
                    "items":[
                        {
                            "task_id":3,
                            "task_name":"xx",
                            "lib_id":3,
                            "lib_name":"haha",
                            "person_id":3,
                            "person_name":"xx",
                            "gender":1,
                            "card_no":"xx",
                            "pic_id":1,
                            "pic_url":"xx",
                            "signin_time":"xx",
                            "signin_score":0,
                            "signin_photo_url":"xx",
                            "signin_scene_url":"xx",
                            "signout_time":"xx",
                            "signout_score":0,
                            "signout_photo_url":"xx",
                            "signout_scene_url":"xx"
                        }
                    ]
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void QuerySigninRecord(string cond, out string result);

        /**
         * @brief  GetLatestGroupAlarmInfo ��ȡ���µ����Ÿ澯��Ϣ
         * @since  V3.20180922
         *
         * @param cond <Ԥ��>
            example:
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0,
                "info":
                {
                    "alarm_id": 3,
                    "task_id": 4,
                    "task_name": "xxx",
                    "lib_id": 3,
                    "lib_name": "xxx",
                    "group_id": 3,
                    "group_name": "xxx",
                    "cont_times": 1,
                    "alarm_time": "YYYY-mm-dd HH:MM:SS",
                    "discover": [
                        {
                            "person_id": 1,
                            "person_name": "xxx",
                            "gender": 3,    // 1���У�2��Ů��3��δ֪
                            "card_no": "xxxxxxxx",
                            "pic_url": "xxx"
                        }, ...
                    ],
                    "missing": [
                        {
                            "person_id": 1,
                            "person_name": "xxx",
                            "gender": 3,    // 1���У�2��Ů��3��δ֪
                            "card_no": "xxxxxxxx",
                            "pic_url": "xxx"
                        }, ...
                    ]
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void GetLatestGroupAlarmInfo(string cond, out string result);

        /**
         * @brief  QueryGroupAlarmInfo ��ѯ���Ÿ澯��Ϣ
         * @since  V3.20180922
         *
         * @param cond ��ѯ����
            example:
            {
                "alarm_id": 3
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0,
                "info":
                {
                    "alarm_id": 3,
                    "task_id": 4,
                    "task_name": "xxx",
                    "lib_id": 3,
                    "lib_name": "xxx",
                    "group_id": 3,
                    "group_name": "xxx",
                    "cont_times": 1,
                    "alarm_time": "YYYY-mm-dd HH:MM:SS",
                    "state": 0,    // 0��δ����1���Ѵ���
                    "comment": "...",
                    "commit_time": "YYYY-mm-dd HH:MM:SS",
                    "discover": [
                        {
                            "person_id": 1,
                            "person_name": "xxx",
                            "gender": 3,    // 1���У�2��Ů��3��δ֪
                            "card_no": "xxxxxxxx",
                            "pic_url": "xxx"
                        }, ...
                    ],
                    "missing": [
                        {
                            "person_id": 1,
                            "person_name": "xxx",
                            "gender": 3,    // 1���У�2��Ů��3��δ֪
                            "card_no": "xxxxxxxx",
                            "pic_url": "xxx"
                        }, ...
                    ]
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void QueryGroupAlarmInfo(string cond, out string result);

        /**
         * @brief  QueryGroupAlarmList ��ѯ���Ÿ澯��Ϣ�б�
         * @since  V3.20180922
         *
         * @param cond ��ѯ����
            example:
            {
                "page_no": int,         ���ҳ�ţ�Ĭ��1��
                "page_size": int,       ���ҳ��С����Ч������10, 20, 30, 40, 50��
                "operator": "admin",    ����,string,������
                "query_cond": {
                     "task_id": int,        ѡ�����id��
                     "task_name": string,   ѡ���������
                     "lib_id": int,         ѡ��׿�id��
                     "lib_name": string,    ѡ��׿����ơ�
                     "state": int,          ѡ�״̬��0:δ����,1:�Ѵ���
                     "begin_time": string,  ѡ���ʼʱ�䡣
                     "end_time": string,    ѡ�����ʱ�䡣
                 }
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0,
                "info":
                {
                    "page_no": 1,
                    "page_size": 10,
                    "total_count": 100,
                    "items": [
                        {
                            "alarm_id": 2,
                            "task_id": 4,
                            "task_name": "xxx",
                            "lib_id": 3,
                            "lib_name": "xxx",
                            "group_id": 3,
                            "group_name": "xxx",
                            "cont_times": 1,
                            "alarm_time": "YYYY-mm-dd HH:MM:SS",
                            "state": 0,    // 0��δ����1���Ѵ���
                            "comment": "xxx",
                            "commit_time": "YYYY-mm-dd HH:MM:SS",
                            "discover": [
                                {
                                    "person_id": 1,
                                    "person_name": "xxx",
                                    "gender": 3,    // 1���У�2��Ů��3��δ֪
                                    "card_no": "xxxxxxxx",
                                    "pic_url": "xxx"
                                }, ...
                            ],
                            "missing": [
                                {
                                    "person_id": 1,
                                    "person_name": "xxx",
                                    "gender": 3,    // 1���У�2��Ů��3��δ֪
                                    "card_no": "xxxxxxxx",
                                    "pic_url": "xxx"
                                }, ...
                            ]
                        }, ...
                    ]
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void QueryGroupAlarmList(string cond, out string result);

        /**
         * @brief  CommitGroupAlarmComment �ύ���Ÿ澯������
         * @since  V3.20180922
         *
         * @param comment ������
            example:
            {
                "alarm_id": 1,
                "comment": "xxx"
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void CommitGroupAlarmComment(string comment, out string result);

        /**
         * @brief  QueryRollcallCurrent ��ѯ����ĵ�ǰ��������
         * @since  V3.20180922
         * @since  V3.20181018
         *
         * @param cond ��ѯ����
            example:
            {
                "page_no": 1,           ����,ҳ��
                "page_size": 10,        ����,ҳ�ߴ�
                "operator": "admin",    ����,string,������
                "query_cond": {
                    "task_id": 1           ����,����id
                }
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0,
                "info": {
                    "page_no": 1,       // ҳ��
                    "page_size": 10,    // ҳ�ߴ�
                    "total_count": 1,   // ����
                    "items": [
                        {
                            "id": 1,                    // ��¼id
                            "event_id": 1,              // �¼�id
                            "task_id": 4,               // ����id
                            "task_name": "xxx",         // ������
                            "lib_id": 3,                // �׿�id
                            "lib_name": "xxx",          // �׿���
                            "person_id": 1,             // ��Աid
                            "person_name": "zhangsan",  // ��Ա����
                            "gender": 0,                // �Ա�1���У�2��Ů��0��δ֪
                            "card_no": "xxxxxxxx",      // ֤����
                            "group": 2,                 // �ڰ�����,�μ�<Whitelist>
                            "category": 0,              // ��Ա���,0:δ����
                            "pic_url": "xxx",           // �׿���Ƭ
                            "rollcall_state": 0,        // ����״̬,0:δ��,1:�ѵ�
                            "rollcall_time": "xxx",     // ����ʱ��
                            "compare_score": 0.98,      // �ȶԵ÷�
                            "capture_photo_url": "xxx", // ץ������ͼURL
                            "capture_scene_url": "xxx", // ץ�ĳ���ͼURL
                        }
                    ]
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void QueryRollcallCurrent(string cond, out string result);

        /**
         * @brief  QueryRollcallRecord ��ѯ������¼
         * @since  V3.20180922
         *
         * @param cond ��ѯ����
            example:
            {
                "page_no": 1,           ����,ҳ��
                "page_size": 10,        ����,ҳ�ߴ�
                "operator": "admin",    ����,string,������
                "query_cond": {
                    "task_id": 1,              ѡ��,����id
                    "task_name": "xxx",        ѡ��,��������ģ��ƥ��
                    "begin_time": "xxxx",      ѡ��,��ʼʱ�䣬��ʽ��YYYY-MM-DD HH:mm:ss
                    "end_time": "xxxx"         ѡ��,����ʱ�䣬��ʽ��YYYY-MM-DD HH:mm:ss
                }
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0,
                "info": {
                    "page_no": 1,       // ҳ��
                    "page_size": 10,    // ҳ�ߴ�
                    "total_count": 1,   // ����
                    "items": [
                        {
                            "event_id": 1,              // �¼�id
                            "task_id": 4,               // ����id
                            "task_name": "xxx",         // ������
                            "start_mode": 1,            // ������ʽ,1:�Զ�,2:�ֶ�
                            "start_time": "xxx",        // ��ʼʱ��
                            "end_time": "xxx",          // ����ʱ��
                            "headcount": 100,           // ������
                            "present": 80,              // �ѵ�
                            "absent ": 20,              // δ��
                        }
                    ]
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void QueryRollcallRecord(string cond, out string result);

        /**
         * @brief  QueryRollcallDetails ��ѯ��������
         * @since  V3.20180922
         * @since  V3.20181018
         *
         * @param cond ��ѯ����
            example:
            {
                "page_no": 1,           ����,ҳ��
                "page_size": 10,        ����,ҳ�ߴ�
                "operator": "admin",    ����,string,������
                "query_cond": {
                    "event_id": 1,             ѡ��,�¼�id
                    "task_id": 1,              ѡ��,����id
                    "task_name": "xxx",        ѡ��,����������ȷƥ��
                    "lib_id": 1,               ѡ��,�׿�id
                    "lib_name": "xxx",         ѡ��,�׿�������ȷƥ��
                    "person_name": "xxx",      ѡ��,��Ա������ģ��ƥ��
                    "present": 0,              ѡ��,0:δ��,1:�ѵ�
                    "begin_time": "xxxx",      ѡ��,��ʼʱ�䣬��ʽ��YYYY-MM-DD HH:mm:ss
                    "end_time": "xxxx"         ѡ��,����ʱ�䣬��ʽ��YYYY-MM-DD HH:mm:ss
                }
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0,
                "info": {
                    "page_no": 1,       // ҳ��
                    "page_size": 10,    // ҳ�ߴ�
                    "total_count": 1,   // ����
                    "items": [
                        {
                            "id": 1,                    // ��¼id
                            "event_id": 1,              // �¼�id
                            "task_id": 4,               // ����id
                            "task_name": "xxx",         // ������
                            "lib_id": 3,                // �׿�id
                            "lib_name": "xxx",          // �׿���
                            "person_id": 1,             // ��Աid
                            "person_name": "zhangsan",  // ��Ա����
                            "gender": 0,                // �Ա�1���У�2��Ů��0��δ֪
                            "card_no": "xxxxxxxx",      // ֤����
                            "group": 2,                 // �ڰ�����,�μ�<Whitelist>
                            "category": 0,              // ��Ա���,0:δ����
                            "pic_url": "xxx",           // �׿���Ƭ
                            "rollcall_state": 0,        // ����״̬,0:δ��,1:�ѵ�
                            "rollcall_time": "xxx",     // ����ʱ��
                            "compare_score": 0.98,      // �ȶԵ÷�
                            "capture_photo_url": "xxx", // ץ������ͼURL
                            "capture_scene_url": "xxx", // ץ�ĳ���ͼURL
                        }
                    ]
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void QueryRollcallDetails(string cond, out string result);

        /**
         * @brief  QueryWorkplaceStartedTask ��ѯ�������Ĺ������������Ϣ
         * @since  V3.20181106
         *
         * @param cond ��ѯ����
            example:
            {
                "page_no": 1,           ����,ҳ��
                "page_size": 10,        ����,ҳ�ߴ�
                "operator": "admin",    ����,string,������
                "query_cond": {
                    "task_name": "xxx",    ѡ��,������ ֧��ģ��ƥ��
                }
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0,
                "info": {
                    "page_no": 1,       // ҳ��
                    "page_size": 10,    // ҳ�ߴ�
                    "total_count": 1,   // ����
                    "items": [
                        {
                            "event_id": 1,              // �¼�id
                            "task_id": 4,               // ����id
                            "task_name": "xxx",         // ������
                            "start_mode": 1,            // ������ʽ,1:�Զ�,2:�ֶ�
                            "start_time": "xxx",        // ��ʼʱ��
                            "headcount": 100,           // ������
                            "present": 80,              // ��ǰ�Ϲ�����
                            "leave":10,                 // ��;�뿪����
                        }
                    ]
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void QueryWorkplaceStartedTask(string cond, out string result);

        /**
         * @brief  QueryWorkplaceCurrent ��ѯ����ĵ�ǰ�����������
         * @since  V3.20181009
         * @since  V3.20181018
         *
         * @param cond ��ѯ����
            example:
            {
                "page_no": 1,           ����,ҳ��
                "page_size": 10,        ����,ҳ�ߴ�
                "operator": "admin",    ����,string,������
                "query_cond": {
                    "task_id": 1           ����,����id
                }
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0,
                "info": {
                    "page_no": 1,       // ҳ��
                    "page_size": 10,    // ҳ�ߴ�
                    "total_count": 1,   // ����
                    "items": [
                        {
                            "id": 1,                    // ��¼id
                            "event_id": 1,              // �¼�id
                            "task_id": 4,               // ����id
                            "task_name": "xxx",         // ������
                            "lib_id": 3,                // �׿�id
                            "lib_name": "xxx",          // �׿���
                            "person_id": 1,             // ��Աid
                            "person_name": "zhangsan",  // ��Ա����
                            "gender": 0,                // �Ա�1���У�2��Ů��0��δ֪
                            "card_no": "xxxxxxxx",      // ֤����
                            "group": 2,                 // �ڰ�����,�μ�<Whitelist>
                            "category": 0,              // ��Ա���,0:δ����
                            "pic_url": "xxx",           // �׿���Ƭ
                            "work_state": 0,            // �������״̬,0:δ��,1:�ѵ�,2:���
                            "check_time": "xxx",        // �������ʱ��
                            "compare_score": 0.98,      // �ȶԵ÷�
                            "capture_photo_url": "xxx", // ץ������ͼURL
                            "capture_scene_url": "xxx", // ץ�ĳ���ͼURL
                        }
                    ]
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void QueryWorkplaceCurrent(string cond, out string result);

        /**
         * @brief  QueryWorkplaceRecord ��ѯ���������¼
         * @since  V3.20181009
         *
         * @param cond ��ѯ����
            example:
            {
                "page_no": 1,           ����,ҳ��
                "page_size": 10,        ����,ҳ�ߴ�
                "operator": "admin",    ����,string,������
                "query_cond": {
                    "task_id": 1,              ѡ��,����id
                    "task_name": "xxx",        ѡ��,��������ģ��ƥ��
                    "begin_time": "xxxx",      ѡ��,��ʼʱ�䣬��ʽ��YYYY-MM-DD HH:mm:ss
                    "end_time": "xxxx"         ѡ��,����ʱ�䣬��ʽ��YYYY-MM-DD HH:mm:ss
                }
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0,
                "info": {
                    "page_no": 1,       // ҳ��
                    "page_size": 10,    // ҳ�ߴ�
                    "total_count": 1,   // ����
                    "items": [
                        {
                            "event_id": 1,              // �¼�id
                            "task_id": 4,               // ����id
                            "task_name": "xxx",         // ������
                            "start_mode": 1,            // ������ʽ,1:�Զ�,2:�ֶ�
                            "start_time": "xxx",        // ��ʼʱ��
                            "end_time": "xxx",          // ����ʱ��
                            "headcount": 100,           // ������
                            "present": 80,              // ��ϯ����
                            "leave":10,                 // ��;�뿪����
                        }
                    ]
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void QueryWorkplaceRecord(string cond, out string result);

        /**
         * @brief  QueryWorkplaceDetails ��ѯ�����������
         * @since  V3.20181009
         * @since  V3.20181018
         *
         * @param cond ��ѯ����
            example:
            {
                "page_no": 1,           ����,ҳ��
                "page_size": 10,        ����,ҳ�ߴ�
                "operator": "admin",    ����,string,������
                "query_cond": {
                    "event_id": 1,             ѡ��,�¼�id
                    "task_id": 1,              ѡ��,����id
                    "task_name": "xxx",        ѡ��,����������ȷƥ��
                    "lib_id": 1,               ѡ��,�׿�id
                    "lib_name": "xxx",         ѡ��,�׿�������ȷƥ��
                    "person_name": "xxx",      ѡ��,��Ա������ģ��ƥ��
                    "work_state": 0,           ѡ��,����״̬,0:δ��,1:�ѵ�,2:���
                    "begin_time": "xxxx",      ѡ��,��ʼʱ�䣬��ʽ��YYYY-MM-DD HH:mm:ss
                    "end_time": "xxxx"         ѡ��,����ʱ�䣬��ʽ��YYYY-MM-DD HH:mm:ss
                }
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0,
                "info": {
                    "page_no": 1,       // ҳ��
                    "page_size": 10,    // ҳ�ߴ�
                    "total_count": 1,   // ����
                    "items": [
                        {
                            "id": 1,                    // ��¼id
                            "event_id": 1,              // �¼�id
                            "task_id": 4,               // ����id
                            "task_name": "xxx",         // ������
                            "video_id": 4,              // ����ͷid
                            "video_name": "xxx",        // ����ͷ����
                            "lib_id": 3,                // �׿�id
                            "lib_name": "xxx",          // �׿���
                            "person_id": 1,             // ��Աid
                            "person_name": "zhangsan",  // ��Ա����
                            "gender": 0,                // �Ա�1���У�2��Ů��0��δ֪
                            "card_no": "xxxxxxxx",      // ֤����
                            "group": 2,                 // �ڰ�����,�μ�<Whitelist>
                            "category": 0,              // ��Ա���,0:δ����
                            "pic_url": "xxx",           // �׿���Ƭ
                            "work_state": 0,            // �������״̬,0:δ��,1:�ѵ�,2:���
                            "check_time": "xxx",        // �������ʱ��
                            "compare_score": 0.98,      // �ȶԵ÷�
                            "capture_photo_url": "xxx", // ץ������ͼURL
                            "capture_scene_url": "xxx", // ץ�ĳ���ͼURL
                        }
                    ]
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void QueryWorkplaceDetails(string cond, out string result);

        /**
         * @brief  GetLatestPatrolAlarm ��ȡ���µ�Ѳ���澯��Ϣ
         * @since  V3.20181107
         *
         * @param cond <Ԥ��>
            example:
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0,
                "info":
                {
                    "task_id": 4,       int,����id
                    "task_name": "xxx", string,��������
                    "video_id": 3,      int,����ͷid
                    "video_name": "xxx",string,����ͷ��
                    "lib_id": 3,        int,�׿�id
                    "lib_name": "xxx",  string,�׿�����
                    "group_id": 3,      int,С��id
                    "group_name": "xxx",string,С������
                    "plan_begin_time": "xxx",   string,Ѳ���ƻ��Ŀ�ʼʱ��,��ʽ:HH:MM:SS
                    "plan_end_time": "xxx",     string,Ѳ���ƻ��Ľ���ʱ��,��ʽ:HH:MM:SS
                    "alarm_time": "xxx",        string,�澯ʱ��,��ʽ:YYYY-mm-dd HH:MM:SS
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void GetLatestPatrolAlarm(string cond, out string result);

        /**
         * @brief  QueryPatrolAlarmList ��ѯѲ���澯��Ϣ�б�
         * @since  V3.20181107
         *
         * @param cond ��ѯ����
            example:
            {
                "page_no": 1,           ����,int,ҳ��,Ĭ��1
                "page_size": 10,        ����,int,ҳ��С,��Ч������10,20,30,40,50
                "query_cond": {
                    "task_id": 1,       ѡ��,int,����id
                    "task_name": "xx",  ѡ��,string,��������,֧��ģ��ƥ��
                    "group_id": 1,      ѡ��,int,С��id
                    "group_name": "xx", ѡ��,string,С������,֧��ģ��ƥ��
                    "begin_time": "xxx",ѡ��,string,��ʼʱ��
                    "end_time": "xxx",  ѡ��,string,����ʱ��
                }
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0,
                "info":
                {
                    "page_no": 1,
                    "page_size": 10,
                    "total_count": 100,
                    "items": [
                        {
                            "id": 1,            int,��¼id
                            "task_id": 4,       int,����id
                            "task_name": "xxx", string,��������
                            "video_id": 3,      int,����ͷid
                            "video_name": "xxx",string,����ͷ��
                            "lib_id": 3,        int,�׿�id
                            "lib_name": "xxx",  string,�׿�����
                            "group_id": 3,      int,С��id
                            "group_name": "xxx",string,С������
                            "plan_begin_time": "xxx",   string,Ѳ���ƻ��Ŀ�ʼʱ��,��ʽ:HH:MM:SS
                            "plan_end_time": "xxx",     string,Ѳ���ƻ��Ľ���ʱ��,��ʽ:HH:MM:SS
                            "alarm_time": "xxx",        string,�澯ʱ��,��ʽ:YYYY-mm-dd HH:MM:SS
                        }, ...
                    ]
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void QueryPatrolAlarmList(string cond, out string result);

        /**
         * @brief  QueryPatrolList ��ѯѲ����Ϣ�б�
         * @since  V3.20181107
         *
         * @param cond ��ѯ����
            example:
            {
                "page_no": 1,           ����,int,ҳ��,Ĭ��1
                "page_size": 10,        ����,int,ҳ��С,��Ч������10,20,30,40,50
                "query_cond": {
                    "task_id": 1,       ѡ��,int,����id
                    "task_name": "xx",  ѡ��,string,��������,֧��ģ��ƥ��
                    "group_id": 1,      ѡ��,int,С��id
                    "group_name": "xx", ѡ��,string,С������,֧��ģ��ƥ��
                    "patrol_state": 1,  ѡ��,int,״̬,1:����Ѳ��,2:�쳣Ѳ��
                    "begin_time": "xxx",ѡ��,string,��ʼʱ��
                    "end_time": "xxx",  ѡ��,string,����ʱ��
                }
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0,
                "info":
                {
                    "page_no": 1,
                    "page_size": 10,
                    "total_count": 100,
                    "items": [
                        {
                            "id": 1,            int,��¼id
                            "task_id": 4,       int,����id
                            "task_name": "xxx", string,��������
                            "video_id": 3,      int,����ͷid
                            "video_name": "xxx",string,����ͷ��
                            "lib_id": 3,        int,�׿�id
                            "lib_name": "xxx",  string,�׿�����
                            "group_id": 3,      int,С��id
                            "group_name": "xxx",string,С������
                            "plan_begin_time": "xxx",   string,Ѳ���ƻ��Ŀ�ʼʱ��,��ʽ:HH:MM:SS
                            "plan_end_time": "xxx",     string,Ѳ���ƻ��Ľ���ʱ��,��ʽ:HH:MM:SS
                            "patrol_state": 1,  int,Ѳ��״̬,1:����Ѳ��,2:�쳣Ѳ��
                            "patrol_time": "xx",string,Ѳ��ʱ��,��ʽ:YYYY-mm-dd HH:MM:SS
                            "person_id": 0,     int,Ѳ����Աid��Ѳ���쳣�澯��
                            "person_name": "xx",string,Ѳ����Ա����
                            "gender": 1,        int,�Ա� 0:δ֪,1:��,2:Ů
                            "card_no": "xx",    string,֤����
                            "group": 2,         int,�ڰ�����,�μ�<Whitelist>
                            "category": 0,      int,��Ա���,0:δ����
                            "compare_score": 0.8,       float,�ȶԵ÷�
                            "pic_url": "xxx",   string,�Ϳ���Ƭurl
                            "capture_photo_url": "xxx", string,ץ��ͷ���url
                            "capture_scene_url": "xxx", string,ץ�ĳ�����url
                            "capture_timestamp": 10000, long, ץ��ʱ���
                        }, ...
                    ]
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void QueryPatrolList(string cond, out string result);

        /**
         * @brief  GetLibPicServer ��ȡ�׿�ͼƬ��������Ϣ
         * @since  V3.20181018
         *
         * @param cond <Ԥ��>
            example:
            {
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0,
                "info": {
                    "ip": "127.0.0.1",  // string,������ip
                    "port": 8001,       // int,�������˿�
                    "upload_url": "xx", // string,�ϴ�URL,��:/up
                }
            }
            Full upload URL: You have to make it yourself.
            example:
                http://127.0.0.1:8001/up
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void GetLibPicServer(string cond, out string result);

        /**
         * @brief  SearchCamera ��ȡ�ÿ�����
         * @since  V3.20190308
         *
         * @param cond ��������<Ԥ��>
            {
            }
         * @param result json��ʽ���ַ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0,
                "info":
                {
                    "items": [
                        {
                            "ip": "192.168.2.10",
                            "rtsp": "rtsp://192.168.2.10/h264",
                            "mfrs": "HIKVISION"
                        }
                    ]
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void SearchCamera(string cond, out string result);

        /**
         * @brief  GetSystemInfo ��ȡ��ǰ����������Ϣ��
         * @since  V3.20180922
         *
         * @param cond ��ȡ����
            example:
            {
                "ip": "192.168.2.106",
                "mac_addr": ""
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0,
                "info":
                {
                    "local_ip": "192.168.2.106",
                    "disk_free": 201432,            // Byte     ����װĿ¼�̷��Ŀ��д��̴�С(��D:�̴�С)
                    "disk_size": 4212323,           // Byte     ����װĿ¼�̷����ܴ��̴�С(��D:�̴�С)
                    "mem_use": 4321432,             // Byte     ʹ���ڴ�
                    "mem_free": 4321432,            // Byte     �����ڴ�
                    "mem_total": 4321432,           // Byte     ���ڴ�
                    "core_num": 3,                  // number   cpu����
                    "cpu": 43,                      // 0~100    cpuʹ����
                    "gpu_rate": 43,                 // 0~100    gpu rate      do not show this info
                    "gpu_mem": 43,                  // 0~100    �Դ�          do not show this info
                    "gpu_celsius": 43               // 0~100    gpu�¶�       do not show this info
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void GetSystemInfo(string cond, out string result);

        /**
         * @brief  GetStatisticsReport ��ȡͳ�Ʊ��档
         * @since  V3.2020/02/26
         * @update V3.2020/05/08 ���������Ž�ͨ��ͳ��
         * @update V3.20200513 ������֯idɸѡ����
         * @update V3.20200527 ����aiot�豸�б�����ͷ�б��ѯ����
         *
         * @param cond ��ȡ����
            example:
            {
                "org_id": 1,            ѡ��,int,��֯id
                "dev_list": "1,2",      ѡ��,string,aiot�豸�б�,�豸id֮���Զ��ż��
                "camera_list": "1,2",   ѡ��,string,����ͷ�б�,����ͷid֮���Զ��ż��
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0,
                "info":
                {
                    "today_capture": 43,            // ����ץ����
                    "today_blacklist_alarm": 43,    // ���պ������澯��
                    "today_fever_alarm": 43,        // ���շ��ո澯��
                    "total_photo_num": 43,          // �׿���Ƭ��
                    "total_video_num": 43,          // ��ƵԴ����
                    "working_task_num": 43,         // �����е�������
                    "face_device_capture": 43,      // �����Ž�����ץ����
                    "face_device_blacklist_alarm": 43,      // �����Ž����պ������澯��
                    "face_device_fever_alarm": 43,          // �����Ž����շ��ո澯��
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void GetStatisticsReport(string cond, out string result);

        /**
         * @brief  QuerySystemLogList ��ѯϵͳ��־��
         * @since  V3.20180922
         *
         * @param cond  ��ѯ��Ϣ��
            example:
            {
                "page_no": 1            ���ҳ�š�
                "page_size": 10         ���ҳ��С��
                "operator": "admin",    ����,string,������
                "query_cond": {
                    "ip": ""                    ѡ�ip��ַ��
                    "mac_addr": ""              ѡ�mac��ַ��
                    "level": 1                  ѡ���־���𣬲鿴�ĸ��������ϵ���־�� 0:ALL,1:TRACE,2:DEBUG,3:INFO,4:WARNING,5:ERROR,6:FATAL
                                                 ���� ѡ1���ͻ�鿴1:TRACE,2:DEBUG,3:INFO,4:WARNING,5:ERROR,6:FATAL����־
                                                      ѡ3���ͻ�鿴3:INFO,4:WARNING,5:ERROR,6:FATAL����־
                    "begin_time": ""            ѡ���ѯ�Ŀ�ʼʱ�䡣
                    "end_time": ""              ѡ���ѯ�Ľ���ʱ�䡣
                }
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0,
                "info":
                {
                    "items": [
                        {
                            "ip": "192.168.2.16",
                            "mac_addr": "A0-D2-3E-1D-B7-42",
                            "project": "4212323",             // ����Ҫչʾ
                            "module": "SDBusiness V1.0",      // ����Ҫչʾ
                            "event": "Open capture task",
                            "level": 1,                       // ��־����, 1:TRACE,2:DEBUG,3:INFO,4:WARNING,5:ERROR,6:FATAL
                            "message": "Normal",
                            "detail": "{}",
                            "create_time": "2017-08-09 13:00:00"
                        },
                        ...
                    ]
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void QuerySystemLogList(string cond, out string result);

        /**
         * @brief  QueryPersonCount ��ѯ�׿��е�����
         * @since  V3.20180922
         * @update V3.20190308 ����VIP�׿�����
         *
         * @param cond ��ѯ����
            example:
            {
                "lib_list": "xx"       ѡ��,�׿�id�б�id֮ǰ�Զ���','�ָ���Ĭ�ϲ�ѯ������
                "lib_type": 1,         ѡ��,�׿�����,1:��ͨ�׿�,2:VIP�׿�,3:�ÿ͵׿�,4:Ԥ���׿�,5:��Ѻ���˵׿�
                "group_by": 0          ѡ��,�������,1:���׿����ͷ���
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0,
                "info":
                {
                    "person_count": 0    // ��ѡ�׿��е�������
                    "items": [
                        {
                            "type": 1,      // �׿�����
                            "count": 10     // ����
                        },....
                    ]
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void QueryPersonCount(string cond, out string result);

        /**
         * @brief  QueryTodayGroupAlarmCount ��ѯ��������Ÿ澯����
         * @since  V3.20180922
         *
         * @param cond <Ԥ��>
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0,
                "info":
                {
                    "latest_id": 100,
                    "alarm_count": 10
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void QueryTodayGroupAlarmCount(string cond, out string result);

        /**
         * @brief  QueryStatistics ��ѯͳ����Ϣ
         * @since  V3.20180922
         *
         * @param cond <Ԥ��>
            example:
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0,
                "info":
                {
                    "today_visitor_count": 0    // ����ÿ�����
                    "today_rollcall_count": 0   // ����ĵ�����¼��
                    "total_rollcall_count": 0   // �ܵĵ�����¼��
                    // ���Ÿ澯
                    "group_alarm": [
                        {
                            "date": "xxx",      // ����
                            "count": 0          // ��¼��
                        }
                    ]
                    // ץ�ĸ澯
                    "capture_alarm": [
                        {
                            "date": "xxx",      // ����
                            "count": 0          // ��¼��
                        }
                    ]
                    // �����Ž�ͨ�м�¼
                    "smart_passage": [
                        {
                            "date": "xxx",      // ����
                            "count": 0          // ��¼��
                        }
                    ]
                    // ��ͨբ��ͨ�м�¼
                    "general_passage": [
                        {
                            "date": "xxx",      // ����
                            "count": 0          // ��¼��
                        }
                    ]
                    //Ѳ���澯  Modified:20181224
                    "partol_alarm":[
                    {
                        "data":"",              //����
                        "count":0               ��¼��
                    }
                    ]
                    //İ���˸澯  Modified:20181224
                    "stranger_alarm":[
                       {
                            "date":"",          //����
                            "count":0           //��¼��
                       }
                    ]
                    //�������澯 Modified:20181224
                    "blacklist_alarm":[
                        {
                            "date":"",          //����
                            "count":0           //��¼��
                        }
                    ]
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void QueryStatistics(string cond, out string result);

        /**
         * @brief  AddIcCard ����ԱIC����Ϣ
         * @since  V3.20190506
         *
         * @param cond IC����Ϣ
            example:
            {
                "person_id": 1,         ����,int,Ա��id
                "ic_card_no": "xxx1",   ����,string,IC����
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
        */
        void AddIcCard(string cond, out string result);

        /**
         * @brief  DeleteIcCard ɾ����ԱIC����Ϣ
         * @since  V3.20190506
         *
         * @param cond IC����Ϣ
            example:
            {
                "ic_card_no": "xxxx",         ����,string,ic����
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
        */
        void DeleteIcCard(string cond, out string result);

        /**
         * @brief  QueryIcCard ��ѯIC����Ϣ
         * @since  V3.20190506
         *
         * @param cond IC����Ϣ
            example:
            {
                "person_id": 1,         ����,int,Ա��id
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0, 
                "info": {
                    "items": [
                        {
                            "ic_card_no": "xxx1", string,ic����
                        }, ...
                    ]
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
        */
        void QueryIcCard(string cond, out string result);

        /**
         * @brief  QueryPersonWithIcCardInfo ��ѯ��Ա��IC����Ϣ
         * @since  V3.20190508
         *
         * @param cond ��ѯ����
            example:
            {
                "person_id": 1 ,    ����,int,��Ա��id
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0, 
                "info": {
                    "person_id": 1,     int,��Աid
                    "name": "",         string,��Ա����
                    "lib_name": "",     string,�׿�����
                    "birthday": "",     string,����
                    "card_no": "",      string,֤����
                    "phone": "",        string,�ֻ�����
                    "category": 6,      int,��Ա���
                    "pic_path": "",     string,ͼƬ·��
                    "group": 2,         int,�ڰ�����,�μ�<Whitelist>
                    "property": "{}",   string,��Ա�ض�����
                    "ic_card_list": [
                        "xxxx1"
                    ],                  json-array,IC�������б�
                }
            }
            property ��ʽ�������£�
            ҵ����Ա���ԣ�
            {
                "proprietor": {
                    "room_no": "", string,����
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
        */
        void QueryPersonWithIcCardInfo(string cond, out string result);

        /**
         * @brief  QueryPersonWithIcCardList ����IC����ѯ��Ա�б�
         * @since  V3.20190508
         *
         * @param cond ��ѯ����
            example:
            {
                "page_no": 1,       ����,int,ҳ��
                "page_size": 10,    ����,int,ÿҳ����
                "query_cond": {
                    "category": 6,          ����,int,��Ա���,ҵ������Ϊ6
                    "name": "",             ѡ��,string,��Ա����,ģ��ƥ��
                    "card_no": "xxxx",      ѡ��,string,֤������
                    "room_no": "xxxx",      ѡ��,string,����<ҵ������ʱ��ѡ>
                }
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0, 
                "info": {
                    "page_no": 1,
                    "page_size": 10,
                    "total_count": 200,
                    "items": [
                        {
                            "person_id": 1,     int,��Աid
                            "name": "",         string,��Ա����
                            "lib_name": "",     string,�׿�����
                            "birthday": "",     string,����
                            "card_no": "",      string,֤����
                            "phone": "",        string,�ֻ�����
                            "category": 6,      int,��Ա���
                            "pic_path": "",     string,ͼƬ·��
                            "group": 2,         int,�ڰ�����,�μ�<Whitelist>
                            "property": "{}",   string,��Ա�ض�����
                            "ic_card_count": 0, int,�Ѱ�IC��������
                        }, ...
                    ]
                }
            }
            property ��ʽ���嶨��μ���QueryPersonWithIcCardInfo��
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
        */
        void QueryPersonWithIcCardList(string cond, out string result);

        /**
         * @brief  QuerySummaryInfo ��ѯ������Ϣ
         * @since  V3.20190510
         *
         * @param cond ��ѯ����<Ԥ��>
            example:
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0,
                "info": {
                    "people": {
                        "total": 0,         // ������
                        "employee": 0,      // Ա������
                        "vip": 0,           // VIP����
                        "visitor": 0,       // �ÿ�����
                        "police": 0,        // ��������
                        "prisoner": 0,      // ��������
                        "proprietor": 0,    // ҵ������
                        "outsider": 0,      // ������������Э��
                        "drug_addict": 0,   // �䶾��Ա����
                        "visiting": 0,      // ̽����Ա����
                    }
                    "ic_card:": {
                        "give_out": 0,  // ���͵�IC������
                    }
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
        */
        void QuerySummaryInfo(string cond, out string result);

        /**
         * @brief  GetTodayAccessRecord ��ȡ���յ��Ž�ͨ�м�¼
         * @since  V3.20190510
         *
         * @param cond ��ѯ����
            example:
            {
                "dev_id": 1,        ѡ��,int,�豸id
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0,
                "info": {
                    "smart_access": {
                        "face_count": 0,    // ����ʶ��ͨ�м�¼��
                        "ic_card_count": 0, // IC��ˢ��ͨ�м�¼��
                        "id_card_count": 0  // ���֤ˢ��ͨ�м�¼��
                    },
                    "general_access": {
                        "face_count": 0,    // ����ʶ��ͨ�м�¼��
                    }
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
        */
        void GetTodayAccessRecord(string cond, out string result);

        /**
         * @brief  GetLast24hAccessRecord ��ȡ��ȥ24Сʱ���Ž�ͨ�м�¼
         * @since  V3.20190510
         *
         * @param cond ��ѯ����
            example:
            {
                "dev_id": 1,        ѡ��,int,�豸id
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0, 
                "info": {
                    "items": [
                        {
                            "time": 1,              // ʱ��,ȡֵ[1,24]
                            "smart_access": {
                                "face_count": 0,    // ����ʶ��ͨ�м�¼��
                                "ic_card_count": 0, // IC��ˢ��ͨ�м�¼��
                                "id_card_count": 0  // ���֤ˢ��ͨ�м�¼��
                            },
                            "general_access": {
                                "face_count": 0,    // ����ʶ��ͨ�м�¼��
                            }
                        }
                    ]
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
        */
        void GetLast24hAccessRecord(string cond, out string result);

        /**
         * @brief  GetLast7daysAccessRecord ��ȡ��ȥ7����Ž�ͨ�м�¼
         * @since  V3.20190510
         *
         * @param cond ��ѯ����
            example:
            {
                "dev_id": 1,        ѡ��,int,�豸id
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0, 
                "info": {
                    "items": [
                        {
                            "date": "06-08",        // ����,��ʽ:MM:dd
                            "smart_access": {
                                "face_count": 0,    // ����ʶ��ͨ�м�¼��
                                "ic_card_count": 0, // IC��ˢ��ͨ�м�¼��
                                "id_card_count": 0  // ���֤ˢ��ͨ�м�¼��
                            },
                            "general_access": {
                                "face_count": 0,    // ����ʶ��ͨ�м�¼��
                            }
                        }
                    ]
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
        */
        void GetLast7daysAccessRecord(string cond, out string result);

        /**
         * @brief  GetRealtimeAccessMessage ��ȡʵʱ�Ž�ͨ����Ϣ
         * @since  V3.20190510
         *
         * @param cond ��ѯ����<Ԥ��>
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0, 
                "info": {
                    "id_card_total": 100,   // ���֤ͨ�ż�¼����
                    "passage_message": "",  // ͨ����Ϣ
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
        */
        void GetRealtimeAccessMessage(string cond, out string result);

        /**
         * @brief  AddSimpleLeave ��������Ϣ
         * @since  V3.20190522
         * @update V3.20200102 ���ؼ�¼id
         *
         * @param info �����Ϣ
            example: 
            {
                "person_id" : 1,    ����,int,Ա��ID
                "reason" : "",      ����,string,���ԭ��
                "start_time" : "",  ����,string,��ٿ�ʼʱ��
                "end_time" : "",    ����,string,��ٽ���ʱ��
                "remark": ""        ѡ��,string,��ע��Ϣ
                "operator" : "",    ����,string,����Ա
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0, "info": {"id": 1}}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void AddSimpleLeave(string info, out string result);

        /**
         * @brief  ResumptionFromSimpleLeave ����
         * @since  V3.20190522
         *
         * @param info ��ټ�¼��Ϣ
            example: 
            {
                "id", 1         ����,int,��¼id
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void ResumptionFromSimpleLeave(string info, out string result);

        /**
         * @brief  DeleteSimpleLeave ɾ����ټ�¼
         * @since  V3.20190522
         *
         * @param cond ��ټ�¼��Ϣ
            example: 
            {
                "id", 1         ����,int,��¼id
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void DeleteSimpleLeave(string cond, out string result);

        /**
         * @brief  QuerySimpleLeaveList ��ѯ�����Ϣ
         * @since  V3.20190522
         *
         * @param cond ���������Ϣ
            example:
            {
                "page_no": 1,       ����,int,ҳ��
                "page_size": 10,    ����,int,ÿҳ����
                "query_cond": {
                    "lib_id": 0,        ѡ��,int,�׿�ID
                    "name": "",         ѡ��,string,Ա������
                    "begin_time": "",   ѡ��,string,��ʼʱ��
                    "end_time": "",     ѡ��,string,����ʱ��
                }
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0, 
                "info": {
                    "page_no":xx,
                    "page_size":xx,
                    "total_count":xx,
                    "items": [
                        {
                            "id": 1             int,��¼id
                            "lib_id", 1,        int,�׿�id
                            "lib_name": "",     string,�׿���
                            "person_id" : 1,    int,Ա��ID
                            "person_name" : "", string,Ա������
                            "start_time" : "",  string,��ٿ�ʼʱ��
                            "end_time" : "",    string,��ٽ���ʱ��
                            "reason" : "",      string,���ԭ��
                            "reported_time": "" string,��������
                            "remark": ""        string,��ע��Ϣ
                            "creator" : "",     string,������
                            "create_time": ""   string,����ʱ��
                        }, ...
                    ]
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void QuerySimpleLeaveList(string cond, out string result);

        /**
         * @brief  QueryPrisonRollcallRecord ��ѯ����������¼
         * @since  V3.20190522
         *
         * @param cond ��ѯ����
            example:
            {
                "page_no": 1,           ����,ҳ��
                "page_size": 10,        ����,ҳ�ߴ�
                "operator": "admin",    ����,string,������
                "query_cond": {
                    "task_id": 1,              ѡ��,����id
                    "lib_id": 1,               ѡ��,�׿�id
                    "begin_time": "xxxx",      ѡ��,��ʼʱ�䣬��ʽ��YYYY-MM-DD HH:mm:ss
                    "end_time": "xxxx"         ѡ��,����ʱ�䣬��ʽ��YYYY-MM-DD HH:mm:ss
                }
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0,
                "info": {
                    "page_no": 1,       // ҳ��
                    "page_size": 10,    // ҳ�ߴ�
                    "total_count": 1,   // ����
                    "items": [
                        {
                            "event_id": 1,      // �¼�id
                            "task_id": 4,       // ����id
                            "task_name": "xxx", // ������
                            "lib_id": 4,        // �׿�id
                            "lib_name": "xxx",  // �׿���
                            "start_time": "xxx",// ��ʼʱ��
                            "end_time": "xxx",  // ����ʱ��
                            "headcount": 100,   // Ӧ������
                            "present": 80,      // ��ϯ������ʵ����
                            "absent": 19,       // ȱϯ������δ����
                            "leave": 1,         // �������
                        }
                    ]
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void QueryPrisonRollcallRecord(string cond, out string result);

        /**
         * @brief  DeletePrisonRollcallRecord ɾ��������¼
         * @since  V3.20190528
         *
         * @param cond ɾ������
            example: 
            {
                "event_id": 3,           ����,int,�¼�id��
                "operator": "",          ����,string,�޸���,����ǰ��¼���û���
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0} ���ض�Ӧ�Ľ��
            ʧ�� - ִ��ʧ�� {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void DeletePrisonRollcallRecord(string cond, out string result);

        /**
         * @brief  BatchDeletePrisonRollcallRecord ����ɾ��������¼
         * @since  V3.20190528
         *
         * @param cond ɾ������
            example: 
            {
                "event_id_list": "1,2",  ����,string,�¼�id,����¼�idʹ��","�ָ���
                "operator": "",          ����,string,�޸���,����ǰ��¼���û���
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0} ���ض�Ӧ�Ľ��
            ʧ�� - ִ��ʧ�� {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void BatchDeletePrisonRollcallRecord(string cond, out string result);

        /**
         * @brief  QueryPrisonRollcallDetails ��ѯ������������
         * @since  V3.20190522
         *
         * @param cond ��ѯ����
            example:
            {
                "page_no": 1,           ����,ҳ��
                "page_size": 10,        ����,ҳ�ߴ�
                "operator": "admin",    ����,string,������
                "query_cond": {
                    "event_id": 1,      ѡ��,�¼�id
                    "rollcall_state":1  ѡ��,����״̬,0:δ��,1:�ѵ�,2:���
                }
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0,
                "info": {
                    "page_no": 1,       // ҳ��
                    "page_size": 10,    // ҳ�ߴ�
                    "total_count": 1,   // ����
                    "items": [
                        {
                            "id": 1,                    // ��¼id
                            "event_id": 1,              // �¼�id
                            "task_id": 4,               // ����id
                            "task_name": "xxx",         // ������
                            "lib_id": 3,                // �׿�id
                            "lib_name": "xxx",          // �׿���
                            "person_id": 1,             // ��Աid
                            "person_name": "zhangsan",  // ��Ա����
                            "gender": 0,                // �Ա�1:��,2:Ů,0:δ֪
                            "card_no": "xxxxxxxx",      // ֤����
                            "group": 2,                 // �ڰ�����,�μ�<Whitelist>
                            "category": 0,              // ��Ա���,0:δ����
                            "pic_url": "xxx",           // �׿���Ƭ
                            "compare_score": 0.98,      // �ȶԵ÷�
                            "rollcall_state": 0,        // ����״̬,0:δ��,1:�ѵ�,2:���
                            "rollcall_time": "xxx",     // ����ʱ��
                            "capture_photo_url": "xxx", // ץ������ͼURL
                            "capture_scene_url": "xxx", // ץ�ĳ���ͼURL
                        }
                    ]
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void QueryPrisonRollcallDetails(string cond, out string result);

        /**
         * @brief  QueryPrisonSigninRecordList ��ѯǩ��/ǩ���¼���¼�б�
         * @since  V3.20190522
         *
         * @param cond ��ѯ����
            example:
            {
                "page_no": 2,       ����,int,ҳ��
                "page_size": 10,    ����,int,ÿҳ����
                "operator": "admin",����,string,������
                "query_cond": {
                    "task_id": 0,   ѡ��,int,����id
                    "lib_id":0,     ѡ��,int,�׿�id
                    "begin_time":,"2019-01-01 11:11:11",     ѡ��,string,ǩ����ʼʱ��
                    "end_time":,"2019-01-02 11:11:11",       ѡ��,string,ǩ������ʱ��
                }
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0, 
                "info": {
                    "page_no": 2,
                    "page_size": 10,
                    "total_count": 32,
                    "items": [
                        {
                            "event_id": 2,      �¼�ID
                            "lib_id": 2,        �׿�ID
                            "lib_name": "xx",   �׿�����
                            "task_id": 2,       ����ID
                            "task_name": "xx",  ��������
                            "headcount": 100,   ����
                            "signin_count": "", ǩ������
                            "signout_count": "",ǩ������
                            "signin_start_time": "",    ǩ����ʼʱ��
                            "signin_end_time": "",      ǩ������ʱ��
                            "signout_start_time": "",   ǩ�˿�ʼʱ��
                            "signout_end_time": "",     ǩ�˽���ʱ��
                        }
                    ]
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
        */
        void QueryPrisonSigninRecordList(string cond, out string result);

        /**
         * @brief  QueryPrisonSigninDetailsList ��ѯǩ��/ǩ�˼�¼�б�
         * @since  V3.20190522
         *
         * @param cond ��ѯ����
            example:
            {
                "page_no": 2,       ����,int,ҳ��
                "page_size": 10,    ����,int,ÿҳ����
                "query_cond": {
                    "event_id": 0,  ����,int,�¼�id
                }
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0, 
                "info": {
                    "page_no": 2,
                    "page_size": 10,
                    "total_count": 32,
                    "items": [
                        {
                            "id":1,             ��¼ID
                            "event_id": 2,      �¼�ID
                            "lib_id": 2,        �׿�ID
                            "lib_name": "xx",   �׿�����
                            "task_id": 2,       ����ID
                            "task_name": "xx",  ��������
                            "person_id": 2,     ��ԱID
                            "person_name": "xx",��Ա����
                            "signin_time": "",  ǩ��ʱ��
                            "signout_time": "", ǩ��ʱ��
                            "modifier": "",     �޸���
                        }
                    ]
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
        */
        void QueryPrisonSigninDetailsList(string cond, out string result);

        /**
         * @brief  DeletePrisonSigninRecord ɾ��ǩ��/ǩ���¼���¼
         * @since  V3.20190522
         *
         * @param cond ɾ������
            example: 
            {
                "event_id": 3,           ����,int,�¼�id��
                "operator": "",          ����,string,�޸���,����ǰ��¼���û���
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0} ���ض�Ӧ�Ľ��
            ʧ�� - ִ��ʧ�� {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void DeletePrisonSigninRecord(string cond, out string result);

        /**
         * @brief  BatchDeletePrisonSigninRecord ����ɾ��ǩ��/ǩ���¼���¼
         * @since  V3.20190522
         *
         * @param cond ɾ������
            example: 
            {
                "event_id_list": "1,2",  ����,string,�¼�id,����¼�idʹ��","�ָ���
                "operator": "",          ����,string,�޸���,����ǰ��¼���û���
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0} ���ض�Ӧ�Ľ��
            ʧ�� - ִ��ʧ�� {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void BatchDeletePrisonSigninRecord(string cond, out string result);

        /**
         * @brief  AddPrisonSigninInfo ����ǩ��/ǩ����Ϣ
         * @since  V3.20190522
         * @update V3.20200102 ���ؼ�¼id
         *
         * @param  info ������¼��Ϣ
            example: 
            {
                "event_id": 1,  ���int���¼�id
                "lib_id": 1,    ���int���׿�id
                "person_id": 1,     ���int����Աid
                "signin_time": "",  ���string, ǩ����ʼʱ��
                "signout_time": "", ���string, ǩ�˿�ʼʱ��
                "operator": "",     ����,string,�޸���,����ǰ��¼���û���
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0, "info": {"id": 1}}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void AddPrisonSigninInfo(string info, out string result);

        /**
         * @brief  DeletePrisonSigninInfo ɾ��ǩ��/ǩ����Ϣ
         * @since  V3.20190522
         *
         * @param cond ɾ������
            example: 
            {
                "id": 3,           ����,int,��¼id��
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0} ���ض�Ӧ�Ľ��
            ʧ�� - ִ��ʧ�� {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void DeletePrisonSigninInfo(string cond, out string result);

        /**
         * @brief  BatchDeletePrisonSigninInfo ����ɾ��ǩ��/ǩ����Ϣ
         * @since  V3.20190522
         *
         * @param cond ɾ������
            example: 
            {
                "id_list": "1,2,3,4",  ����,string,��¼id,�����¼idʹ��","�ָ���
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0} ���ض�Ӧ�Ľ��
            ʧ�� - ִ��ʧ�� {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void BatchDeletePrisonSigninInfo(string cond, out string result);

        /**
         * @brief  UpdatePrisonSigninInfo ����ǩ��/ǩ����Ϣ
         * @since  V3.20190522
         *
         * @param cond �޸���Ϣ
            example: 
            {
                "id": 3,            ����,int,��¼id��
                "signin_time": "",  ����,string,ǩ��ʱ��
                "signout_time": "", ����,string,ǩ��ʱ��
                "operator": "",     ����,string,�޸���
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0} ���ض�Ӧ�Ľ��
            ʧ�� - ִ��ʧ�� {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void UpdatePrisonSigninInfo(string cond, out string result);

        /**
         * @brief  BatchUpdatePrisonSigninInfo ��������ǩ����Ϣ
         * @since  V3.20190522
         *
         * @param cond �޸���Ϣ
            example: 
            {
                "event_id": 1,      ����,int,�¼�id
                "id_list": "1,2",   ����,string,��¼id,�����¼idʹ��","�ָ���
                "signin_time": "",  ѡ��,string,ǩ��ʱ��
                "signout_time": "", ѡ��,string,ǩ��ʱ��
                "operator": "",     ����,string,�޸���
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0} ���ض�Ӧ�Ľ��
            ʧ�� - ִ��ʧ�� {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void BatchUpdatePrisonSigninInfo(string cond, out string result);

        /**
         * @brief  QueryInOutList ��ѯ����������Ϣ
         * @since  V3.20190522
         *
         * @param cond ��ѯ����
            example:
            {
                "page_no": 1,       ����,int,ҳ��
                "page_size": 10,    ����,int,ÿҳ����
                "operator": "admin",ѡ��,string,������
                "query_cond": {
                    "lib_id": 1,        ѡ��,int,�׿�id
                    "task_id": 1,       ѡ��,int,����id
                    "begin_time": "",   ѡ��,string,��ʼʱ��
                    "end_time": "",     ѡ��,string,����ʱ��
                    "complete": 0,      ѡ��,int,0:ȫ����¼,1:������¼,2:��������¼
                }
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0,
                "info": {
                    "page_no": 2,
                    "page_size": 10,
                    "total_count": 32,
                    "items": [
                        {
                            "id": 1             // ��¼���
                            "task_id": 3,       // ����id
                            "task_name": "xx",  // ��������
                            "area_id": 3,       // ����id
                            "area_name": "xx",  // ��������
                            "lib_id": 1,        // �׿�id
                            "lib_name": "lib",  // �׿�����
                            "person_id": 1,         // ��Աid
                            "person_name": "john",  // ����
                            "card_no": "",          // ֤����
                            "group": 2,             // �ڰ�����,�μ�<Whitelist>
                            "category": 0,          // ��Ա���,0:δ����
                            "pic_url": "http://ip:port/x.jpg",
                            "entry_photo_url": "",// ����ץ��������
                            "entry_scene_url": "",// ����ץ�ĳ�����
                            "leave_photo_url": "",// �뿪ץ��������
                            "leave_scene_url": "",// �뿪ץ�ĳ�����
                            "entry_time": "",       // ����ʱ�䣬��ʽ:yyyy-MM-dd HH:mm:ss
                            "leave_time": "",       // �뿪ʱ�䣬��ʽ:yyyy-MM-dd HH:mm:ss
                            "stay_time": "",        // ͣ��ʱ�䣬��ʽ:HH:mm:ss
                            "ignore": 0,            // ���Ա�ǣ�0:δ����,1:�Ѻ���
                            "operator", ""          // ���Բ���Ա
                        },
                        ...
                    ]
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
        */
        void QueryInOutList(string cond, out string result);

        /**
         * @brief  DeleteInOutRecord ɾ����������¼
         * @since  V3.20190522
         *
         * @param cond ɾ������
            example: 
            {
                "id": 3,            ����,int,��¼id��
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0} ���ض�Ӧ�Ľ��
            ʧ�� - ִ��ʧ�� {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void DeleteInOutRecord(string cond, out string result);

        /**
         * @brief  BatchDeleteInOutRecord ����ɾ����������¼
         * @since  V3.20190522
         *
         * @param cond ɾ������
            example: 
            {
                "id_list": "1,2",   ����,string,��¼id,�����¼idʹ��","�ָ���
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0} ���ض�Ӧ�Ľ��
            ʧ�� - ִ��ʧ�� {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void BatchDeleteInOutRecord(string cond, out string result);

        /**
         * @brief  IgnoreInOutRecord ���Գ�������¼
         * @since  V3.20190522
         *
         * @param cond ɾ������
            example: 
            {
                "id": 3,            ����,int,��¼id��
                "operator": "admin",ѡ��,string,������
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0} ���ض�Ӧ�Ľ��
            ʧ�� - ִ��ʧ�� {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void IgnoreInOutRecord(string cond, out string result);

        /**
         * @brief  BatchIgnoreInOutRecord �������Գ�������¼
         * @since  V3.20190522
         *
         * @param cond ɾ������
            example: 
            {
                "id_list": "1,2",   ����,string,��¼id,�����¼idʹ��","�ָ���
                "operator": "admin",ѡ��,string,������
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0} ���ض�Ӧ�Ľ��
            ʧ�� - ִ��ʧ�� {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void BatchIgnoreInOutRecord(string cond, out string result);

        /**
         * @brief  GetRealtimeAlarm ��ȡʵʱ�澯��Ϣ
         * @since  V3.20190522
         * @update V3.20190822 ֧��İ���˿�ʶ������
         * @update V3.20200217 ���������Ž��豸ץ������
         * @update V3.20200306 ���ӿ���ʶ���ֶ�
         * @update V3.20200508 ������֯�ص���Ϣ����
         *
         * @param cond ��ѯ���� <Ԥ��>
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0,
                "info": {
                    "alarm_type": 1,    �澯����,1:����ץ��,2:����ȱϯ�澯,3:���������澯,4:�����Ž��豸ץ��
                    "alarm_info": {}    �澯��Ϣ,json-array
                }
            }
            for alarm_info:
            1:����ץ�ĸ澯
            {
                "capture_info":
                {
                    "capture_id": "fdsafsdadsasd",
                    "task_id": 3,           // ����id
                    "task_name": "xx",      // ��������
                    "video_id": 2,          // ��Ƶid
                    "video_name": "xxx",    // ��Ƶ����
                    "video_location": "",   // ��Ƶλ�û�·��
                    "org_id": 1,            // ��֯id
                    "organization": "",     // ��֯��
                    "site_id": 1,           // ��ַid
                    "site_name": "",        // ��ַ��
                    "wear_mask": true,      // �Ƿ��������
                    "temperature": 36.5,    // ����,��λ:���϶�
                    "is_fever": true,       // �Ƿ���,true:����,false:δ����
                    "capture_photo_url": "",// ץ��������
                    "capture_scene_url": "",// ץ�ĳ�����
                    "capture_time": "2018-08-02 23:00:00"
                },
                "compare_results": [
                    {
                        "lib_id": 1,            // �׿�id
                        "lib_name": "lib",      // �׿�����
                        "person_id": 1,         // ��Աid
                        "person_name": "john",  // ����
                        "card_no": "",          // ֤����
                        "group": 2,             // �ڰ�����,�μ�<Whitelist>
                        "category": 0,          // ��Ա���,0:δ����
                        "pic_url": "http://ip:port/x.jpg",
                        "compare_score": 0.0,   // �ȶԵ÷�
                        "classify": 0           // ʶ�����,�μ�<ResultClassify>
                        "stranger":             // İ���˿�ȶ���Ϣ,ʶ��Ϊİ����ʱ��Ч
                        {
                            "is_first": true,       // �Ƿ��״����
                            "stranger_id": "",      // İ����id
                            "pic_url": "",          // ͼƬ·��
                            "compare_score": 0.0,   // �ȶԵ÷�
                        }
                    },
                    ...
                ]
            }
            2:����ȱϯ�澯
            {
                "rollcall_info":
                {
                    "task_id": 3,       // ����id
                    "task_name": "xx",  // ��������
                    "area_id": 3,       // ����id
                    "area_name": "xx",  // ��������
                    "lib_id": 1,        // �׿�id
                    "lib_name": "lib",  // �׿�����
                    "headcount": 100,   // Ӧ������
                    "present": 80,      // ��ϯ������ʵ����
                    "absent": 20,       // ȱϯ������δ����
                    "leave": 1,         // �������
                    "start_time": "xx"  // ������ʼʱ��
                    "end_time": "xx"    // ������ʼʱ��
                },
                "absentees": [
                    {
                        "person_id": 1,         // ��Աid
                        "person_name": "john",  // ����
                        "card_no": "",          // ֤����
                        "group": 2,             // �ڰ�����,�μ�<Whitelist>
                        "category": 0,          // ��Ա���,0:δ����
                        "pic_url": "http://ip:port/x.jpg",
                    },
                    ...
                ]
            }
            3:���������澯
            {
                "stay_info":
                {
                    "task_id": 3,       // ����id
                    "task_name": "xx",  // ��������
                    "area_id": 3,       // ����id
                    "area_name": "xx",  // ��������
                    "lib_id": 1,        // �׿�id
                    "lib_name": "lib",  // �׿�����
                    "person_id": 1,         // ��Աid
                    "person_name": "john",  // ����
                    "card_no": "",          // ֤����
                    "group": 2,             // �ڰ�����,�μ�<Whitelist>
                    "category": 0,          // ��Ա���,0:δ����
                    "pic_url": "http://ip:port/x.jpg",
                    "entry_photo_url": "",// ץ��������
                    "entry_scene_url": "",// ץ�ĳ�����
                    "entry_time": "",       // ����ʱ�䣬��ʽ:yyyy-MM-dd HH:mm:ss
                    "stay_time": ""         // ͣ��ʱ�䣬��ʽ:HH:mm:ss
                }
            }
            4:�����Ž��豸ץ��
            {
                "capture_info":
                {
                    "dev_id": 1,            // �豸id
                    "dev_name": "",         // �豸��
                    "in_out": 0,            // �豸������ʶ,0:δ֪,1:����,2:����
                    "org_id": 1,            // ��֯id
                    "organization": "",     // ��֯��
                    "site_id": 1,           // ��ַid
                    "site_name": "",        // ��ַ��
                    "lib_id": 1,            // �׿�id
                    "lib_name": 1,          // �׿���
                    "person_id": 1,         // ��Աid
                    "name": "zhangsan",     // ��Ա����
                    "gender": 0,            // �Ա�0:δ֪,1:��,2:Ů
                    "card_no": "",          // ֤����
                    "group": 2,             // �ڰ�����,�μ�<Whitelist>
                    "category": 0,          // ��Ա���,0:δ����
                    "compare_score": 0.98,  // �ȶԵ÷�
                    "wear_mask": true,      // �Ƿ��������
                    "temperature": 36.5,    // ����,��λ:���϶�
                    "is_fever": true,       // �Ƿ���,true:����,false:δ����
                    "classify": 0,          // ʶ�����,�μ�<ResultClassify>
                    "capture_time": "",     // ץ��ʱ��,��ʽ:2018-08-03 10:30:00
                    "pic_url": ""           // ע��ͼƬURL
                    "capture_url": "",      // ץ��ͼƬURL
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void GetRealtimeAlarm(string cond, out string result);

        /**
         * @brief  GetRealtimePersonCount ��ȡָ�������ʵʱ����
         * @since  V3.20190522
         *
         * @param cond ��ѯ����
            example:
            {
                "area_id": 1,       ����,int,����id
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0,
                "info": {
                    "person_count": 90,     // ����
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
        */
        void GetRealtimePersonCount(string cond, out string result);

        /**
         * @brief  GetTodayCaptureInfo ��ȡ���յ�ץ����Ϣ
         * @since  V3.20190522
         *
         * @param cond ��ѯ����
            example:
            {
                "task_id": 1,       ѡ��,int,����id
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0,
                "info": {
                    "task_id": 1,       // ����id
                    "task_name": "",    // ������
                    "area_id": 1,       // ����id
                    "area_name": "",    // ������
                    "whitelist": 90,    // ������
                    "blacklist": 10,    // ������
                    "stranger": 50      // İ����
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
        */
        void GetTodayCaptureInfo(string cond, out string result);

        /**
         * @brief  GetTodayInOutInfo ��ȡ���յĽ�����Ϣ
         * @since  V3.20190522
         *
         * @param cond ��ѯ����
            example:
            {
                "task_id": 1,       ����,int,����id
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0,
                "info": {
                    "task_id": 3,       // ����id
                    "task_name": "xx",  // ��������
                    "area_id": 3,       // ����id
                    "area_name": "xx",  // ��������
                    "enter": 90,        // ��������
                    "leave": 10,        // �뿪����
                    "stay": 50          // ��������
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
        */
        void GetTodayInOutInfo(string cond, out string result);

        /**
         * @brief  GetLatestPrisonRollcallInfo ��ȡ����ļ���������Ϣ
         * @since  V3.20190522
         *
         * @param cond ��ѯ����
            example:
            {
                "task_id": 1,       ѡ��,int,����id
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0,
                "info": {
                    "task_id": 3,       // ����id
                    "task_name": "xx",  // ��������
                    "area_id": 3,       // ����id
                    "area_name": "xx",  // ��������
                    "lib_id": 1,        // �׿�id
                    "lib_name": "lib",  // �׿�����
                    "headcount": 100,   // Ӧ������
                    "present": 80,      // ��ϯ������ʵ����
                    "absent": 20,       // ȱϯ������δ����
                    "leave": 1,         // �������
                    "start_time": "xx"  // ������ʼʱ��
                    "end_time": "xx"    // ������ʼʱ��
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
        */
        void GetLatestPrisonRollcallInfo(string cond, out string result);

        /**
         * @brief  GetLatestPrisonSigninInfo ��ȡ����ļ���ǩ����Ϣ
         * @since  V3.20190522
         *
         * @param cond ��ѯ����
            example:
            {
                "task_id": 1,       ѡ��,int,����id
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0,
                "info": {
                    "task_id": 3,       // ����id
                    "task_name": "xx",  // ��������
                    "area_id": 3,       // ����id
                    "area_name": "xx",  // ��������
                    "lib_id": 1,        // �׿�id
                    "lib_name": "lib",  // �׿�����
                    "headcount": 100,   // ����
                    "signin": 90,       // ǩ������
                    "signout": 10,      // ǩ������
                    "start_time": "xx"  // ǩ����ʼʱ��
                    "end_time": "xx"    // ǩ�˽���ʱ��
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
        */
        void GetLatestPrisonSigninInfo(string cond, out string result);

        /**
         * @brief  CheckVideoRefreshStatus ���ת����Ƶ���Ƿ���Ҫˢ��
         * @since  V3.20190624
         *
         * @param voCond ��ѯ����
            example:
            {
                "rtmp_addr": ""  // RTMP��ַ
            }
         * @param voRes �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0,
                "info":
                {
                    "need_flash": true  // �Ƿ���Ҫ����ˢ��
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void CheckVideoRefreshStatus(string voCond, out string voRes);

        /**
         * @brief  QueryLabelStatistics ��Ⱥ����(��ǩͳ��)
         * @since  V3.20190628
         *
         * @param voCond ��ѯ��ǩ�б���ʼ��ֹ����
            example:
            {
                "label_list" : "xxx",   // �����ǩ�б�����ö��ŷָ������3������:"1,2,3"
                "start_time" : "xxx",   // ѡ�ͳ�ƵĿ�ʼʱ�䣬2018-08-02 00:00:00
                "end_time" : "xxx"      // ѡ�ͳ�ƵĽ���ʱ�䣬2018-08-02 23:59:59
            }
         * @param voRes �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0,
                "info":
                {
                    "label_num": x,
                    "label_info": [
                        {
                            "id": x,            // ���
                            "label_id": x,      // ��ǩid
                            "label_name": "xxx" // ��ǩ����
                        },...
                    ],
                    "block_num": x,
                    "block_info": [
                        {
                            "id": x,        // ���
                            "number": xx    // ����
                        },...
                    ]
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
         void QueryLabelStatistics(string voCond, out string voRes);


         /**
         * @brief  QueryLabelStatisticsDetails ��Ⱥ��������
         * @since  V3.20190702
         *
         * @param voCond ��ѯ��ǩ�б���ʼ��ֹ����
            example:
            {
                "label_info" : [
                    {
                        "label_id" : x,
                        "selected" : x //1ѡ�У�0δ��ѡ��
                    },...
                ],
                "start_time" : "xxx", //2018-08-02 00:00:00
                "end_time" : "xxx", //2018-08-02 23:59:59
                //only_vip page_no page_size total_countͬʱ��������vip_name����
                "only_vip" : x, //��ѡ ���鿴vip 0��1
                "page_no" : x, //��ѡ ҳ��
                "page_size": x, //��ѡ ��ҳ��ʾ����
                "total_count" : x, //��ѡ ����
                "vip_name" : "xxx" //��ѡ vip�û���

            }
         * @param voRes �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0,
                "info":
                {
                    "page_no": x, //ҳ��
                    "page_size": x, //��ҳ����
                    "total_count": x, //����
                    "items" :[
                        {
                            "person_type" : x //��Ա����VIP:2or�ο�:0
                            "person_name" : "xxx",
                            "capture_photo" : "xxx", //�ֳ�ͼ��ַ
                            "library_photo" : "xxx", //�׿�ͼ��ַ
                            "last_capture_time" : "xxxx-xx-xx xx:xx:xx", //���ץ��ʱ��
                            "label_capture_number" : [
                                {
                                    "label_id" : x,
                                    "label_name": "xxx",
                                    "number" : x
                                },...
                            ]
                        },...
                    ]
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
         void QueryLabelStatisticsDetails(string voCond, out string voRes);

        /**
         * @brief GetCameraScene ��ȡ����ͷ����ͼ
         * @since V3.20190606
         *
         * @para vCond ����ͷrtsp��ַ
            example:
            {
                "rtsp": "",       string,����,����ͷrtspȡ����ַ
            }
         * @para result �ɹ���ʧ�ܡ���:
            �ɹ� - ���ض�Ӧ�Ľ��
            {
                "code": 0,
                "info":
                {
                    "camera_scene_url: ""            string,����ͷ����ͼ
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
        */
        void GetCameraScene(string vCond, out string result);


        /**
         * @brief AddPointMapping ������ӳ����Ϣ
         * @since  V3.20190606
         *
         * @para vInfo ��ӳ����Ϣ
            example:
            {
                "area_id": 1,                int,����,����id
                "panorama_url": "",          string,����,ȫ��ͼ��ַ
                "duration": 1,               int,����,������ɼ����
                "detect_model": "face",      string,������ģ��,��ȡֵ:face,person
                "point_mapping":[
                    {
                        "video_id": 1,              int,�������ͷid
                        "camera_scene_url": "",     string,����,����ͷ����ͼ��ַ
                        "point_info": "{}",         json-string,����,json��ʽ�������ֶ�
                    }
                    ...
                    ]
            }
                [�ֶ�] point_info ȡֵ:
                {
                    "point_camera": {   //����ͷ����ͼ����������ʱ�뷽��ѡȡA,B,C,D
                        "height_rate":0.2,      float,����,����ͼ���ű���
                        "width_rate":0.2,      float,����,����ͼ���ű���
                        "Ax": 1,        int,����,A��x����
                        "Ay": 1,        int,����,A��y����
                        "Bx": 1,        int,����,B��x����
                        "By": 1,        int,����,B��y����
                        "Cx": 1,        int,����,C��x����
                        "Cy": 1,        int,����,C��y����
                        "Dx": 1,        int,����,D��x����
                        "Dy": 1         int,����,D��y����
                    },
                    "point_panorama": {      //ȫ��ͼ����������ʱ�뷽��ѡȡA,B,C,D
                        "height_rate":0.2,      float,����,����ͼ���ű���
                        "width_rate":0.2,      float,����,����ͼ���ű���
                        "Ax": 1,        int,����,A��x����
                        "Ay": 1,        int,����,A��y����
                        "Bx": 1,        int,����,B��x����
                        "By": 1,        int,����,B��y����
                        "Cx": 1,        int,����,C��x����
                        "Cy": 1,        int,����,C��y����
                        "Dx": 1,        int,����,D��x����
                        "Dy": 1         int,����,D��y����
                    }
                }
         * @para result �ɹ���ʧ�ܡ���:
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
        */
        void AddPointMapping(string vInfo, out string result);

        /**
         * @brief UpdatePointMapping �޸ĵ�ӳ����Ϣ
         * @since V3.20190715
         *
         * @para vInfo ��ӳ����Ϣ
            example:
            {
                "area_id": 1,                int,����,����id
                "panorama_url": "",          string,����,ȫ��ͼ��ַ
                "duration": 1,               int,����,������ɼ����
                "detect_model": "face",      string,������ģ��,��ȡֵ:face,person
                "point_mapping":[
                    {
                        "video_id": 1,              int,�������ͷid
                        "camera_scene_url": "",     string,����,����ͷ����ͼ��ַ
                        "point_info": "{}",         json-string,����,json��ʽ�������ֶ�
                    }
                    ...
                ]
            }
                [�ֶ�] point_info ȡֵ:
                {
                    "point_camera": {   //����ͷ����ͼ����������ʱ�뷽��ѡȡA,B,C,D
                        "height_rate":0.2,      float,����,����ͼ���ű���
                        "width_rate":0.2,      float,����,����ͼ���ű���
                        "Ax": 1,        int,����,A��x����
                        "Ay": 1,        int,����,A��y����
                        "Bx": 1,        int,����,B��x����
                        "By": 1,        int,����,B��y����
                        "Cx": 1,        int,����,C��x����
                        "Cy": 1,        int,����,C��y����
                        "Dx": 1,        int,����,D��x����
                        "Dy": 1         int,����,D��y����
                    },
                    "point_panorama": {      //ȫ��ͼ����������ʱ�뷽��ѡȡA,B,C,D
                        "height_rate":0.2,      float,����,����ͼ���ű���
                        "width_rate":0.2,      float,����,����ͼ���ű���
                        "Ax": 1,        int,����,A��x����
                        "Ay": 1,        int,����,A��y����
                        "Bx": 1,        int,����,B��x����
                        "By": 1,        int,����,B��y����
                        "Cx": 1,        int,����,C��x����
                        "Cy": 1,        int,����,C��y����
                        "Dx": 1,        int,����,D��x����
                        "Dy": 1         int,����,D��y����
                    }
                }
         * @para result �ɹ���ʧ�ܡ���:
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
        */
        void UpdatePointMapping(string vInfo, out string result);

        /**
         * @brief DeletePointMapping ɾ����ӳ����Ϣ
         * @since V3.20190611
         *
         * @para vRecord ��ӳ����Ϣ
            example:
            {
                "area_id": 1,       int,����,����id
            }
         * @para result �ɹ���ʧ�ܡ���:
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
        */
        void DeletePointMapping(string vRecord, out string result);

        /**
         * @brief QueryHeatmapAreaList ��ȡ���趨����ͼ����
         * @since V3.20190606
         *
         * @para vCond ��ѯ����
            example:
            {
                "page_no": 1,               int,����,ҳ��
                "page_size": 1,             int,����,ÿҳ����
                "qyery_cond":
                {
                    "area_id": 1,               int,ѡ��,����id
                }
            }
         * @para result �ɹ���ʧ�ܡ���:
            �ɹ� - ���ض�Ӧ�Ľ��
            {
                "code": 0,
                "info":
                {
                    "page_no": 2,
                    "page_size": 10,
                    "total_count": 1,
                    "items": [
                        {
                            "area_id": 1,           int,����id
                            "area_name": "name",    string,������
                            "level": 1,             int,���򼶱�,1:һ��,2:����,3:����
                            "panorama_url": 1,      string,����ȫ��ͼ
                            "create_time": "2019-07-17 14:00:00"    string,����ʱ��
                        }
                    ]
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
        */
        void QueryHeatmapAreaList(string vCond, out string result);

        /**
         * @brief QueryCameraPointMappingInfo ��ѯָ������ͷӳ����Ϣ
         * @since V3.20190611
         *
         * @para vCond ��ѯ����
            example:
            {
                "area_id": 1,               int,����,����id
                "video_id": 1,              int,����,����ͷid
            }
         * @para result �ɹ���ʧ�ܡ���:
            �ɹ� - ���ض�Ӧ�Ľ��
            {
                "code": 0,
                "info":
                {
                    "id": 1,                     int,��¼id
                    "area_id": 1,                int,����id
                    "area_name": "",             string,������
                    "panorama_url": "",          string,ȫ��ͼ��ַ
                    "duration": 1,               int,������ɼ����
                    "detect_model": "person",    string,���ģ��
                    "video_id": 1,               int,����ͷid
                    "video_name": "",            string,����ͷ��
                    "camera_scene_url": "",      string,����ͷ����ͼ��ַ
                    "point_info": "{}",          json-string,json��ʽ�������ֶ�
                } 
            }
            [�ֶ�] point_info ȡֵ:
                {
                   "point_camera": {   //����ͷ����ͼ����������ʱ�뷽��ѡȡA,B,C,D
                        "height_rate":0.2,      float,����,����ͼ���ű���
                        "width_rate":0.2,      float,����,����ͼ���ű���
                        "Ax": 1,        int,����,A��x����
                        "Ay": 1,        int,����,A��y����
                        "Bx": 1,        int,����,B��x����
                        "By": 1,        int,����,B��y����
                        "Cx": 1,        int,����,C��x����
                        "Cy": 1,        int,����,C��y����
                        "Dx": 1,        int,����,D��x����
                        "Dy": 1         int,����,D��y����
                    },
                    "point_panorama": {      //ȫ��ͼ����������ʱ�뷽��ѡȡA,B,C,D
                        "height_rate":0.2,      float,����,����ͼ���ű���
                        "width_rate":0.2,      float,����,����ͼ���ű���
                        "Ax": 1,        int,����,A��x����
                        "Ay": 1,        int,����,A��y����
                        "Bx": 1,        int,����,B��x����
                        "By": 1,        int,����,B��y����
                        "Cx": 1,        int,����,C��x����
                        "Cy": 1,        int,����,C��y����
                        "Dx": 1,        int,����,D��x����
                        "Dy": 1         int,����,D��y����
                    }
                }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
        */
        void QueryCameraPointMappingInfo(string vCond, out string result);

        /**
         * @brief QueryPointMappingInfoByArea ��ѯ��������ͼӳ����Ϣ
         * @since V3.20190712
         *
         * @para vCond ��ѯ����
            example:
            {
                "area_id": 1,               int,����,����id
            }
         * @para result �ɹ���ʧ�ܡ���:
            �ɹ� - ���ض�Ӧ�Ľ��
            {
                "code": 0,
                "info":
                {
                    "area_id": 1,                int,����id
                    "area_name": "",             string,������
                    "panorama_url": "",          string,ȫ��ͼ��ַ
                    "duration": 1,               int,������ɼ����
                    "detect_model": "person",    string,���ģ��
                    "items": [
                        {
                            "id": 1,                     int,��¼id
                            "video_id": 1,               int,����ͷid
                            "video_name": "",            string,����ͷ��
                            "camera_scene_url": "",      string,����ͷ����ͼ��ַ
                            "point_info": "{}",          json-string,json��ʽ�������ֶ�
                        }
                    ]
                } 
            }
            [�ֶ�] point_info ȡֵ:
                {
                   "point_camera": {   //����ͷ����ͼ����������ʱ�뷽��ѡȡA,B,C,D
                        "height_rate": 0.8,     float,�߶����ű���
                        "wide_rate": 0.8,       float,������ű���
                        "Ax": 1,        int,����,A��x����
                        "Ay": 1,        int,����,A��y����
                        "Bx": 1,        int,����,B��x����
                        "By": 1,        int,����,B��y����
                        "Cx": 1,        int,����,C��x����
                        "Cy": 1,        int,����,C��y����
                        "Dx": 1,        int,����,D��x����
                        "Dy": 1         int,����,D��y����
                    },
                    "point_panorama": {      //ȫ��ͼ����������ʱ�뷽��ѡȡA,B,C,D
                        "height_rate": 0.8,     float,�߶����ű���
                        "wide_rate": 0.8,       float,������ű���
                        "Ax": 1,        int,����,A��x����
                        "Ay": 1,        int,����,A��y����
                        "Bx": 1,        int,����,B��x����
                        "By": 1,        int,����,B��y����
                        "Cx": 1,        int,����,C��x����
                        "Cy": 1,        int,����,C��y����
                        "Dx": 1,        int,����,D��x����
                        "Dy": 1         int,����,D��y����
                    }
                }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
        */
        void QueryPointMappingInfoByArea(string vCond, out string result);

        /**
         * @brief DeleteCameraPointMapping ɾ������ͷӳ����Ϣ
         * @since V3.20190611
         *
         * @para vRecord ����ͷӳ����Ϣ
            example:
            {
                "area_id": 1,       int,����,����id
                "video_id": 1       int,����,����ͷid
            }
         * @para result �ɹ���ʧ�ܡ���:
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
        */
        void DeleteCameraPointMapping(string vRecord, out string result);


        /**
         * @brief QueryHeatmapData ��ȡ����ͼ����
         * @since V3.20190606
         *
         * @para vCond ��ѯ����
            example:
            {
                "area_id": 1,               int,����,����id
                "start_time": "",           string,����,��ʼʱ��
                "stop_time": ""             string,����,����ʱ��
            }
         * @para result �ɹ���ʧ�ܡ���:
            �ɹ� - ���ض�Ӧ�Ľ��
            {
                "code": 0,
                "info":
                {
                    "items": [
                        {
                            "x": 1,         int,x����
                            "y": 1,         int,y����
                            "heat": 1,      int,����ֵ
                        }
                    ]
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
        */
        void QueryHeatmapData(string vCond, out string result);
        
        //////////////////////////////�̳���ҳ��幦�ܶ��忪ʼ/////////////////////////////////////////
       /**
         * @brief  QueryCustomersConsititution ��������
         * @since  V3.20190618
         *
         * @param data json��ʽ���ַ�����
         example: 
         {
             "type": 0,  ����,int,��ѯ���� 0-���� 1-���� 2-��һ�ܣ��������� 3-��һ�£��������� 4-�����£���������
         }
         * @param result ���json��ʽ�ַ�����
         �ɹ� - ���ض�Ӧ���
         {
             "code": 0,
             "info": {
                 "male" : 1, int,��������
                 "female" : 98, int,Ů������
                 "unknow" : 1, int,δ֪�Ա�����
                 "age_sections": [
                     {
                         "age":"0-12", string,�����ǩ
                         "count":1, int,�����������
                     },
                     ...
                 ]
             }
         }
         ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
        */
        void QueryCustomersConsititution(string cond, out string result);

        /**
         * @brief  QueryCustomersLinkRelative ��������(��15�����ݣ���������)
         * @since  V3.20190618
         *
         * @param data json��ʽ���ַ�����
         example: 
         {
         }
         * @param result ���json��ʽ�ַ�����
         �ɹ� - ���ض�Ӧ���
         {
             "code": 0,
             "info": {
                 "items": [
                     {
                         "date": "2019-06-18",   string,����
                         "total": 100,   int,���տ�����
                         "relative": 10  int,����������
                     },
                     ...
                 ]
             }
         }
         ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
        */
        void QueryCustomersLinkRelative(string cond, out string result);

        /**
         * @brief  QueryCapiteStayTime �˾�ͣ��ʱ��(��30�����ݣ�������)
         * @since  V3.20190618
         *
         * @param data json��ʽ���ַ�����
         example: 
         {
         }
         * @param result ���json��ʽ�ַ�����
         �ɹ� - ���ض�Ӧ���
         {
             "code": 0,
             "info": {
                 "item" : [
                     "date": "2019-06-18",   string,����
                     "male": 1,  int,����ƽ��ͣ��ʱ��
                     "female":12 int,Ů��ƽ��ͣ��ʱ��
                 ]
             }
         }
         ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
        */
        void QueryCapiteStayTime(string cond, out string result);

        /**
         * @brief  QueryAverageCustomerCountByTime ʱ�ο�����ֵ(��30�����ݣ���Сʱͳ�ƣ���������)
         * @since  V3.20190618
         *
         * @param data json��ʽ���ַ�����
         example: 
         {
            "area_id": x //ѡ��,����id
         }
         * @param result ���json��ʽ�ַ�����
         �ɹ� - ���ض�Ӧ���
         {
             "code": 0,
             "info": {
                 "items": [
                     {
                         "hour" : 1,    int,hour
                         "count" : 100   int,������ֵ
                     },
                     ...
                 ]
             }
         }
         ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
        */
        void QueryAverageCustomerCountByTime(string cond, out string result);

        /**
         * @brief  QueryCustomersArrivedInfo ���Ϲ˿ͶԱ�(��30�����ݣ���������)
         * @since  V3.20190618
         *
         * @param data json��ʽ���ַ�����
         example: 
         {
         }
         * @param result ���json��ʽ�ַ�����
         �ɹ� - ���ض�Ӧ���
         {
             "code": 0,
             "info": {
                "item" : [
                    {
                        "name":"newbee",    int,�¹˿�ռ��
                        "percent":1
                    },
                    {
                        "name":"second",    int,���ι��ռ��
                        "percent":2
                    },
                    {
                        "name":"multi",    int,��ι��ռ��
                        "percent":3
                    },
                    {
                        "name":"vip",    int,VIP�˿�ռ��
                        "percent":94
                    }
                 ]
             }
         }
         ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
        */
        void QueryCustomersArrivedInfo(string cond, out string result);

        /**
         * @brief  QueryCommercialAblility ҵ̬������(��30�����ݣ���������)
         * @since  V3.20190618
         *
         * @param data json��ʽ���ַ�����
         example: 
         {
         }
         * @param result ���json��ʽ�ַ�����
         �ɹ� - ���ض�Ӧ���
         {
             "code": 0,
             "info": {
                 "items": [
                     {
                         "area_id": 0,   int,��������id
                         "area_name": "",    string,������
                         "customer_count": 0 int,������
                     },
                     ...
                 ]
             }
         }
         ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
        */
        void QueryCommercialAblility(string cond, out string result);

        /**
         * @brief  QueryStoreCustomersRank ���̿�������(��30�����ݣ���������)
         * @since  V3.20190618
         *
         * @param data json��ʽ���ַ�����
         example: 
         {
         }
         * @param result ���json��ʽ�ַ�����
         �ɹ� - ���ض�Ӧ���
         {
             "code": 0,
             "info": {
                 "items": [
                     {
                         "area_id": 0,   int,��������id
                         "area_name": "",    string,������
                         "customer_count": 0 int,������
                     },
                     ...
                 ]
             }
         }
         ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
        */
        void QueryStoreCustomersRank(string cond, out string result);

        /**
         * @brief  QueryMarketMainPageInfos ��ѯ�̳���ҳ��Ϣ
         * @since  V3.20190627
         *
         * @param data json��ʽ���ַ�����
         example: 
         {
             "type": 0,  ����,int,��ѯ���� 0-���� 1-���� 2-��һ�ܣ��������� 3-��һ�£��������� 4-�����£���������
         }
         * @param result ���json��ʽ�ַ�����
         �ɹ� - ���ض�Ӧ���
         {
             "code": 0,
             "info": {
                 "items": {
                     "customers_consititution":{
                         "male" : 1, int,������ռ�ٷֱ�
                         "female" : 98, int,Ů����ռ�ٷֱ�
                         "unknow" : 1, int,δ֪�Ա���ռ�ٷֱ�
                         "age_sections": [
                             {
                                 "age":"0-12", string,�����ǩ
                                 "percent":1, int,���������ռ�ٷֱ�
                             },
                             ...
                         ]
                     },
                     "relative":[
                         {
                             "date": "2019-06-18",   string,����
                             "total": 100,   int,���տ�����
                             "relative": 10  int,����������
                         },
                         ...
                     ],
                    "capite_stay_time":[
                         {
                             "date": "2019-06-18",
                             "male": 1,
                             "female":12
                         },
                         ...
                     ],
                     "average_customer_count_by_time":[
                         {
                             "hour" : 1,    int,hour
                             "count" : 100   int,������ֵ
                         },
                         ...
                     ],
                     "customers_arrived": {
                         "newbee" : 1,   int,�¹˿�ռ��
                         "second" : 1,   int,���ι��ռ��
                         "multi" : 1,   int,��ι��ռ��
                         "vip" : 1   int,VIP�˿�ռ��
                     },
                     "commercial_ablility": [
                         {
                             "area_id": 0,   int,��������id
                             "area_name": "",    string,������
                             "customer_count": 0 int,������
                         },
                         ...
                     ],
                     "store_customers_rank": [
                         {
                             "area_id": 0,   int,��������id
                             "area_name": "",    string,������
                             "customer_count": 0 int,������
                         },
                         ...
                     ]
                 }
             }
         }
         ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
        */
        void QueryMarketMainPageInfos(string cond, out string result);

        /**
         * @brief  QueryTodayCustomerCount ��ѯ���տ�������
         * @since  V3.20190709
         *
         * @param data json��ʽ���ַ�����
         example: 
         {
         }
         * @param result ���json��ʽ�ַ�����
         �ɹ� - ���ض�Ӧ���
         {
             "code": 0,
             "info": {
                 "date":"2019-07-01", string,��ѯ����
                "customer_count": 0 int,���տ�����
             }
         }
         ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
        */
        void QueryTodayCustomerCount(string cond, out string result);

        /**
         * @brief  QueryStoreRelationship ��ѯ������ض�
         * @since  V3.20190710
         *
         * @param data json��ʽ���ַ�����
         example: 
         {
         }
         * @param result ���json��ʽ�ַ�����
         �ɹ� - ���ض�Ӧ���
         {
             "code": 0,
             "info": {
                "items":{
                    "relationship":[
                        {
                            "area_name1":"name1",   string,��������
                            "area_name2":"name2",   string,��������
                            "relevancy":1   int,��ض�
                        },
                        ...
                    ],
                    "area_names":"name1,name2,name3"   string,��������,��","�ָ�
                }
             }
         }
         ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
        */
        void QueryStoreRelationship(string cond, out string result);

        /**
         * @brief  QueryMainPageStoreIncome ��ѯ��ҳ��������
         * @since  V3.20190731
         *
         * @param data json��ʽ���ַ�����
         example: 
         {
            "date_count":1  int,ѡ��,��ѯ�����¼����������
         }
         * @param result ���json��ʽ�ַ�����
         �ɹ� - ���ض�Ӧ���
         {
             "code": 0,
             "info": {
                "items":[
                    {
                        "date":"2019-07-01", string,��������
                        "income": 0 int,������������
                    }
                    ...
                ]
             }
         }
         ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
        */
        void QueryMainPageStoreIncome(string cond, out string result);
        /////////////////////////////////�̳���ҳ��幦�ܶ������/////////////////////////////////////////

        /**
         * @brief  AddStoreIncome �������������¼
         * @since  V3.20190731
         * @update V3.20200102 ���ؼ�¼id
         *
         * @param data json��ʽ���ַ�����
         example: 
         {
            "area_name":1, int,����,��������
            "date":"2019-01-01", string,����,��������
            "income":1, int,����,��������
         }
         * @param result ���json��ʽ�ַ�����
         �ɹ� - {"code": 0, "info": {"id": 1}}
         ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
        */
        void AddStoreIncome(string cond, out string result);

        /**
         * @brief  UpdateStoreIncome �޸����������¼
         * @since  V3.20190731
         *
         * @param data json��ʽ���ַ�����
         example: 
         {
            "id":1, int,����,������¼id
            "income":1, int,����,��������
         }
         * @param result ���json��ʽ�ַ�����
         �ɹ� - {"code": 0}
         ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
        */
        void UpdateStoreIncome(string cond, out string result);

        /**
         * @brief  QueryStoreIncomeList ��ѯ���������¼�б�
         * @since  V3.20190731
         *
         * @param data json��ʽ���ַ�����
         example: 
         {
            "area_id":1 int,����,����ID
            "query_date":"2019-01" string,����,��ѯ���·�
         }
         * @param result ���json��ʽ�ַ�����
         �ɹ� - ���ض�Ӧ���
         {
             "code": 0,
             "info": {
                "items":[
                    {
                        "id":1, int,��¼id
                        "date":"2019-07-01", string,��������
                        "income": 0 int,����������
                        "area_id":1 int,����id
                        "area_name":"xxx" string,��������
                    }
                    ...
                ]
             }
         }
         ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
        */
        void QueryStoreIncomeList(string cond, out string result);

        /**
         * @brief AddRetrieveMap �����켣������ͼ
         * @since  V3.20190702
         * @update V3.20200102 ���ص�ͼid
         * @update V3.20200605 ������֯id
         *
         * @para vInfo �켣������ͼ��Ϣ
            example:
            {
                "org_id": 1,            int,����,��֯id
                "name": "",             string,����,��ͼ��
                "map_url": "",          string,����,��ͼurl
                "video_list": "1,2",    string,����,����ͷ�б�
                "attribute":"{}",       json-string,����,json��ʽ�������ֶ�
                "remark": ""            string,ѡ��,��ע��Ϣ
            }
         * @para result �ɹ���ʧ�ܡ���:
            �ɹ� - {"code": 0, "info": {"id": 1}}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
        */
        void AddRetrieveMap(string vInfo, out string result);

        /**
         * @brief DeleteRetrieveMap ɾ���켣������ͼ
         * @since V3.20190702
         *
         * @para vRecord �켣������ͼ��Ϣ
            example:
            {
                "id": 1,           int,����,��ͼid
            }
          * @para result �ɹ���ʧ�ܡ���:
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
        */
        void DeleteRetrieveMap(string vRecord, out string result);

        /**
         * @brief UpdateRetrieveMap �޸Ĺ켣������ͼ
         * @since V3.20190702
         *
         * @para vInfo �켣������ͼ��Ϣ
            example:
            {
                "id": 1,                int,����,��ͼid
                "name": "map1",         string,ѡ��,��ͼ��
                "map_url": "",          string,ѡ��,��ͼurl
                "video_list": "1,2",    string,ѡ��,����ͷ�б�
                "attribute":"{}",       json-string,ѡ��,json��ʽ�������ֶ�
                "remark": ""            string,ѡ��,��ע��Ϣ
            }
         * @para result �ɹ���ʧ�ܡ���:
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
        */
        void UpdateRetrieveMap(string vInfo, out string result);

        /**
         * @brief QueryRetrieveMapInfo ��ѯ�켣������ͼ��Ϣ
         * @since V3.20190702
         * @update V3.20200605 ������֯��Ϣ
         *
         * @para vCond ��ѯ����
            example:
            {
                "id": 1,               int,����,��ͼid
            }
         * @para result �ɹ���ʧ�ܡ���:
            �ɹ� - ���ض�Ӧ�Ľ��
            {
                "code": 0,
                "info":
                {
                    "id": 1,                int,��¼id
                    "name": "",             string,��ͼ��
                    "map_url": "",          string,��ͼurl
                    "video_list": [ {"id": 1, "name": "xx", "state": 0} ], ��Ƶ�б�,[{id,name,state},...],�ֶ�state,0:����,1:����
                    "attribute":"{}",       json-string,json��ʽ�������ֶ�
                    "remark": ""            string,��ע��Ϣ
                } 
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
        */
        void QueryRetrieveMapInfo(string vCond, out string result);

        /**
         * @brief QueryRetrieveMapList ��ѯ�켣������ͼ�б�
         * @since V3.20190702
         *
         * @para vCond ��ѯ����
            example:
            {
                "page_no": 1,               int,����,ҳ��
                "page_size": 10,            int,����,ÿҳ����
                "org_id": 1,                int,����,��֯id
                "query_cond":
                {
                    "name": "",             string,ѡ��,��ͼ��
                }
            }
         * @para result �ɹ���ʧ�ܡ���:
            �ɹ� - ���ض�Ӧ�Ľ��
            {
                "code": 0,
                "info":
                {
                    "page_no": 2,
                    "page_size": 10,
                    "total_count": 1,
                    "items": [
                        {
                            "id": 1,                int,��ͼid
                            "name": "",             string,��ͼ��
                            "org_id": 1,            int,��֯id
                            "organization": "",     string,��֯��
                            "map_url": "",          string,��ͼurl
                            "video_list": [ {"id": 1, "name": "xx", "state": 0} ], ��Ƶ�б�,[{id,name,state},...],�ֶ�state,0:����,1:����
                            "attribute":"{}",       json-string,json��ʽ�������ֶ�
                            "remark": ""            string,��ע��Ϣ
                        }
                    ]
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
        */
        void QueryRetrieveMapList(string vCond, out string result);

        /**
         -----------------------------------------------------------------------
         �ÿͻ�
         -----------------------------------------------------------------------
        **/
        /**
         * @brief  AddVisitorDevice ��ӷÿͻ�
         * @since V3.20200609
         *
         * @param device ���ڻ���Ϣ
            example:
            {
                "name": "",     ����,string,�ÿͻ���ʶ
                "sn": "",       ����,string,�ÿͻ����к�
                "org_id": 9,    ����,int,��֯id
                "site_id": 1,   ����,int,�ص�id
                "lib_id": 1,    ����,int,�׿�id
                "remark": 1,    ����,string,��ע��Ϣ
            }
         * @param result �ɹ���ʧ�ܡ�����
             �ɹ� - {"code": 0}
             ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
        */
        void AddVisitorDevice(string cond, out string result);

        /**
         * @brief  DeleteVisitorDevice ɾ���ÿͻ�
         * @since V3.20200609
         *
         * @param device �ÿͻ���Ϣ
            example:
            {
                "id": 9,        ����,int,��¼id
            }
         * @param result �ɹ���ʧ�ܡ�����
             �ɹ� - {"code": 0}
             ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
        */
        void DeleteVisitorDevice(string cond, out string result);

        /**
         * @brief  UpdateVisitorDevice �޸ķÿͻ�
         * @since V3.20200609
         *
         * @param device �ÿͻ���Ϣ
            example:
            {
                "id": 9,        ����,int,��¼id
                "name": "",     ѡ��,string,�ÿͻ���ʶ
                "sn": "",       ѡ��,string,�ÿͻ����к�
                "site_id": 1,   ѡ��,int,�ص�id
                "lib_id": 1,    ѡ��,int,�׿�id
                "remark": 1,    ѡ��,string,��ע��Ϣ
            }
         * @param result �ɹ���ʧ�ܡ�����
             �ɹ� - {"code": 0}
             ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
        */
        void UpdateVisitorDevice(string cond, out string result);

        /**
         * @brief  QueryVisitorDeviceList ��ѯ�ÿͻ��б�
         * @since V3.20200609
         *
         * @param cond ��ѯ����
            example:
            {
                "page_no": 1,       ����,int,ҳ��
                "page_size": 10,    ����,int,ÿҳ����
                "org_id": 1,        ����,int,��֯id
                "query_cond": {
                    "name": "",             ѡ��,string,�ÿͻ���ʶ,ģ��ƥ��
                    "site_list": "",        ѡ��,string,�ص��б�,�ص�idֱ���Զ��ż��
                }
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0, 
                "info": {
                    "page_no":xx,
                    "page_size":xx,
                    "total_count":xx,
                    "items": [
                        {
                            "dev_id": 1,            // �豸��
                            "name": "office",       // �豸��
                            "sn": "xxx",            // �豸���кź�
                            "org_id":1,             // �豸��������id
                            "organization":"xx",    // �豸������������
                            "site_id":1,            // �豸�����ص�id
                            "site_name":"xx",       // �豸�����ص�����
                            "lib_id": 1,            // �豸�󶨵׿�id
                            "lib_name": "",         // �豸�󶨵׿���
                            "remark":"xxx",         // ��ע
                            "online": true,         // ����״̬,true:����,false:����
                            "create_time":"xxx"     // ����ʱ��
                            "update_time":"xxx"     // ����ʱ��
                        }, ...
                    ]
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void QueryVisitorDeviceList(string cond, out string result);
        
/*****************************************������ؽӿ�*************************************/
        /**
         * @brief SetHolidays ���ýڼ���
         * @since  V1.20200409
         * @update V2.20200513
         *
         * @param info �ڼ�����Ϣ
             example:
             {
                "org_id":0,     ����,int,��֯ID
                "year": 2019,   ����,int,��
                "workdays": "1212", ����,string,�������б�,�Ը���һ��һ����,1-������ 2-��Ϣ��
                "operator": "jobs", ����,string,������
             }
         * @param result �ɹ���ʧ�ܡ�����
             �ɹ� - {"code": 0}
             ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
        */
        void SetHolidays(string info, out string result);

        /**
         * @brief GetHolidays ��ȡ�ڼ���
         * @since  V1.20200409
         * @update V2.20200513
         *
         * @param info �ڼ�����Ϣ
             example:
             {
                "year": 2019    ����,int,��
                "org_id":0      ����,int,��֯ID
                "operator": "jobs",     ����,string,������
             }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0, 
                "info": {
                    "year": 2019,   int,��
                    "workdays": "1212",   string,�������б�,�Ը���һ��һ����,1-������ 2-��Ϣ��
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
        */
        void GetHolidays(string info, out string result);

        /**
         * @brief  AddLeaveInfo ��������Ϣ
         * @since  V1.20200409
         *
         * �������:
         * 1:����
         * 2:�λ�
         * 3:�¼�
         * 4:����
         * 5:����
         * 6:���
         * 7:����
         * 8:�����
         * 9:ɥ��
         * 10:����
         * @param info �����Ϣ
            example: 
            {
                "type" : 1,         ����,int,�������
                "lib_id" : 1,       ����,int,��ԱID
                "lib_name" : "xxx", ����,string,��Ա����
                "people_id" : 1,    ����,int,��ԱID
                "people_name" : "xxx",  ����,string,��Ա����
                "start_date" : "",  ����,string,��ٿ�ʼʱ��
                "end_date" : "",    ����,string,��ٽ���ʱ��
                "remark" : "",     ѡ��,string,��ע
                "org_id" : 1,       ����,int,��֯ID
                "operator": "jobs",     ����,string,������
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void AddLeaveInfo(string info, out string result);

        /**
         * @brief  UpdateLeaveInfo ���������Ϣ
         * @since  V1.20200409
         *
         * �������:
         * 1:����
         * 2:�λ�
         * 3:�¼�
         * 4:����
         * 5:����
         * 6:���
         * 7:����
         * 8:�����
         * 9:ɥ��
         * 10:����
         * @param info �����Ϣ
            example: 
            {
                "id":0,             ����,int,��¼id
                "type" : 1,         ѡ��,int,�������
                "lib_id" : 1,       ѡ��,int,��ԱID
                "lib_name" : "xxx", ѡ��,string,��Ա����
                "people_id" : 1,    ѡ��,int,��ԱID
                "people_name" : "xxx",  ѡ��,string,��Ա����
                "start_date" : "",  ѡ��,string,��ٿ�ʼʱ��
                "end_date" : "",    ѡ��,string,��ٽ���ʱ��
                "remark" : "",      ѡ��,string,��ע
                "org_id" : 1,       ����,int,��֯ID
                "operator": "jobs",     ����,string,������
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
        */
        void UpdateLeaveInfo(string info, out string result);

        /**
         * @brief  DeleteLeaveInfo ɾ�������Ϣ
         * @since  V1.20200409
         *
         * @param info �����Ϣ
            example: 
            {
                "id":0,             ����,int,��¼id
                "org_id" : 1,       ����,int,��֯ID
                "operator": "jobs", ����,string,������
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
        */
        void DeleteLeaveInfo(string info, out string result);

        /**
         * @brief  QueryLeaveList ��ѯ�����Ϣ
         * @since  V1.20200409
         *
         * @param cond ���������Ϣ
            example:
            {
                "page_no": 1,       ����,int,ҳ��
                "page_size": 10,    ����,int,ÿҳ����
                "org_id": 0,        ����,int,��֯id
                "query_cond": {
                    "type" : 0,         ѡ��,int,�������
                    "name": "",         ѡ��,string,Ա������
                    "lib_id": 0,        ѡ��,int,�׿�id
                    "begin_time": "",   ѡ��,string,��ʼʱ��
                    "end_time": "",     ѡ��,string,����ʱ��
                }
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0, 
                "info": {
                    "page_no":xx,
                    "page_size":xx,
                    "total_count":xx,
                    "items": [
                        {
                            "id" : 1,           int,��¼���
                            "org_id" : 1,       int,��֯ID
                            "type" : 1,         int,�������
                            "lib_id" : 1,       int,��ԱID
                            "lib_name" : "xxx", string,��Ա����
                            "people_id" : 1,    int,��ԱID
                            "people_name" : "xxx",  string,��Ա����
                            "start_date" : "",  string,��ٿ�ʼʱ��
                            "end_date" : "",    string,��ٽ���ʱ��
                            "remark" : "",      string,��ע
                        }, ...
                    ]
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void QueryLeaveList(string cond, out string result);

        /**
         * @brief  AddReSigninInfo ��Ӳ�ǩ��Ϣ
         * @since  V1.20200409
         * @update  V2.20200514
         *
         * @param info ��ǩ��Ϣ
            example: 
            {
                "lib_id" : 1,       ����,int,�׿�ID
                "lib_name" : "",    ����,string,�׿�����
                "people_id" : 1,    ����,int,Ա��ID
                "people_name" : "", ����,string,Ա������
                "type" : 1,         ����,int,��ǩ����,1:�ϰ�,2:�°�
                "rule_id" : 1,      ����,int,����������ID
                "rule_name" : "",   ����,int,��������������
                "sub_rule_id" : 1,  ����,int,�����ӹ���ID
                "sub_rule_name" : "",   ����,int,�����ӹ�������
                "signin_date" : "", ����,string,��ǩ���� ��ʽ:"2020-01-01"
                "remark" : "",      ѡ��,string,��ǩԭ��
                "org_id" : 1,       ����,int,��֯ID
                "operator": "jobs",     ����,string,������
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void AddReSigninInfo(string info, out string result);

        /**
         * @brief  UpdateReSigninInfo �޸Ĳ�ǩ��Ϣ
         * @since  V1.20200409
         *
         * @param info ��ǩ��Ϣ
            example: 
            {
                "rule_id" : 0,      ����,int,��¼id
                "lib_id" : 1,       ѡ��,int,�׿�ID
                "lib_name" : "",    ѡ��,string,�׿�����
                "people_id" : 1,    ѡ��,int,Ա��ID
                "people_name" : "", ѡ��,string,Ա������
                "type" : 1,         ѡ��,int,��ǩ����,1:�ϰ�,2:�°�
                "signin_date" : "", ����,string,��ǩ���� ��ʽ:"2020-01-01"
                "remark" : "",      ѡ��,string,��ǩԭ��
                "org_id" : 1,       ����,int,��֯ID
                "operator": "jobs", ����,string,������
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void UpdateReSigninInfo(string info, out string result);

        /**
         * @brief  DeleteReSigninInfo ɾ����ǩ��Ϣ
         * @since  V1.20200409
         *
         * @param info ��ǩ��Ϣ
            example: 
            {
                "rule_id" : 1,           ����,int,��¼ID
                "org_id" : 1,       ����,int,��֯ID
                "operator": "jobs", ����,string,������
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void DeleteReSigninInfo(string info, out string result);

        /**
         * @brief  QueryReSigninList ��ѯ��ǩ��Ϣ
         * @since  V1.20200409
         *
         * @param cond ���������Ϣ
            example:
            {
                "page_no": 1,       ����,int,ҳ��
                "page_size": 10,    ����,int,ÿҳ����
                "org_id": 0,        ����,int,�׿�id
                "query_cond": {
                    "name": "",         ѡ��,string,Ա������
                    "lib_id": 0,        ѡ��,int,�׿�id
                    "type": 0,          ѡ��,int,"1-�ϰ� 2-�°�"
                    "begin_time": "",   ѡ��,string,��ʼʱ��
                    "end_time": "",     ѡ��,string,����ʱ��
                }
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0, 
                "info": {
                    "page_no":xx,
                    "page_size":xx,
                    "total_count":xx,
                    "items": [
                        {
                            "id" : 1,           int,��¼���
                            "org_id" : 1,       int,��֯id
                            "lib_id" : 1,       int,�׿�id
                            "lib_name" : "",    string,�׿�����
                            "rule_name" : "",   string,��������������
                            "sub_rule_name" : "",    string,�����ӹ�������
                            "people_id" : 1,    int,Ա��id
                            "people_name" : "", string,Ա������
                            "type" : 1,         int,��ǩ����,1:�ϰ�,2:�°�
                            "signin_time" : "", string,��ǩʱ�� ��ʽ:"2020-01-01"
                            "remark" : "",      string,��ǩԭ��
                        }, ...
                    ]
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void QueryReSigninList(string cond, out string result);

        /**
         * @brief  AddAttendanceRule ��ӿ��ڹ���
         * @since  V1.20200409
         * @update  V2.20200514
         *
         * @param cond ���������Ϣ
            example:
            {
                "name":"",                  ����,string,���ڹ�����
                "enable_holiday":0,         ����,int,�ڼ�����Ϣ��ʶ��0-�ڼ��ղ����� 1-�ڼ��տ���
                "type":1,                   ����,int,�������� 1-�̶����� 2-ʱ������ 3-�Ű࿼��
                "enable_over_work":0,       ����,int,�Ƿ����Ӱ�   0-�ر� 1-����
                "property": {}              ����,�������typeȷ��
                "org_id" : 1,               ����,int,��֯ID
                "operator": "jobs",         ����,string,������
                "dead_line":"00 04:00:00"   ѡ��,string,�°࿨��ֹʱ��,�̶���ʱ�����ڱ���
                "enable_dead_line_cross":0  ѡ��,int,�°࿨��ֹʱ���Ƿ���� 0-������ 1-����,�̶���ʱ�����ڱ���
                "unsign_threshold":30,      ѡ��,int,ǩ���ӳ���ֵ, ��λ/����(�̶�ʱ��-©��/������ֵ ʱ������-������ֵ �Ű࿼��-©����ֵ)
                "over_work_threshold":30,   ѡ��,int,�Ӱ࿪ʼ�ӳ���ֵ, ��λ/����
                "remark":"",                ѡ��,string,��ע
                "dead_line_threshold":240,  ѡ��,int,��ֹʱ��,���ʱ���Ӻ���ֵ,�ְ࿼�ڱ���
                "team_count":3,             ѡ��,int,��������,�ְ࿼�ڱ���
                "shift_period":3,           ѡ��,int,�Ű�����,�ְ࿼�ڱ���
                "shift_times":3,            ѡ��,int,ÿ���Ű����,�ְ࿼�ڱ���
                "start_date":"2020-05-07",  ѡ��,string,������ʼ����,�Ű࿼�ڱ���
            }
            type=1:�̶�ʱ�����ڹ���
            "property": {
                "rule_info":    //�����������������ʱ�䲻���棬ʱ��˳������
                [
                    { 
                        "name":"rule_name",                 string,�ӹ�������
                        "start_signin_time":"00 09:00:00",  string,��ʼǩ��ʱ��
                        "end_signin_time":"00 09:00:00",    string,����ǩ��ʱ��
                        "start_signout_time":"00 18:00:00", string,��ʼǩ��ʱ��
                        "end_signout_time":"00 18:00:00",   string,����ǩ��ʱ��
                    },...
                ]
            }
            type=2:ʱ�����ڹ���
            "property": {
            
            }
            type=3:�ְ࿼�ڹ���
            "property": {
                "rule_info":
                [
                    {
                        "index":0,                          int,�ù�����������,0-��һ�� 1-�ڶ���,�Դ�����
                        "rule_index":0,                     int,�ù�������,0-��һ�� 1-�ڶ���,�Դ�����
                        "team_index":0,                     int,�ù����������
                        "sub_rule_name":"A����",            string,�ù������ð���
                        "start_signin_time":"00 07:00:00",  string,ǩ����ʼʱ��
                        "end_signin_time":"00 09:00:00",    string,ǩ������ʱ��
                        "start_signout_time":"00 17:00:00", string,ǩ�˿�ʼʱ��
                        "end_signout_time":"00 19:00:00"    string,ǩ�˽���ʱ��
                    },...
                ]
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void AddAttendanceRule(string cond, out string result);

        /**
         * @brief  UpdateAttendanceRule ���¿��ڹ���
         * @since  V1.20200409
         *
         * @param cond ���������Ϣ
            example:
            {                
                "rule_id":0,                     ����,int,���ڹ���ID
                "name":"",                  ����,string,���ڹ�����
                "enable_holiday":0,         ����,int,�ڼ�����Ϣ��ʶ��0-�ڼ��ղ����� 1-�ڼ��տ���
                "type":1,                   ����,int,�������� 1-�̶����� 2-ʱ������ 3-�Ű࿼��
                "enable_over_work":0,       ����,int,�Ƿ����Ӱ�   0-�ر� 1-����
                "property": {}              ����,�������typeȷ��
                "org_id" : 1,               ����,int,��֯ID
                "operator": "jobs",         ����,string,������
                "dead_line":"00 04:00:00"   ѡ��,string,�°࿨��ֹʱ��,�̶���ʱ�����ڱ���
                "enable_dead_line_cross":0  ѡ��,int,�°࿨��ֹʱ���Ƿ���� 0-������ 1-����,�̶���ʱ�����ڱ���
                "unsign_threshold":30,      ѡ��,int,ǩ���ӳ���ֵ, ��λ/����(�̶�ʱ��-©��/������ֵ ʱ������-������ֵ �Ű࿼��-©����ֵ)
                "over_work_threshold":30,   ѡ��,int,�Ӱ࿪ʼ�ӳ���ֵ, ��λ/����
                "remark":"",                ѡ��,string,��ע
                "dead_line_threshold":240,  ѡ��,int,��ֹʱ��,���ʱ���Ӻ���ֵ,�ְ࿼�ڱ���
                "team_count":3,             ѡ��,int,��������,�ְ࿼�ڱ���
                "shift_period":3,           ѡ��,int,�Ű�����,�ְ࿼�ڱ���
                "shift_times":3,            ѡ��,int,ÿ���Ű����,�ְ࿼�ڱ���
                "start_date":"2020-05-07"   ѡ��,string,������ʼ����,�Ű࿼�ڱ���
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void UpdateAttendanceRule(string cond, out string result);

        /**
         * @brief  DeleteAttendanceRule ɾ�����ڹ���
         * @since  V1.20200409
         *
         * @param cond ���������Ϣ
            example:
            {
                "rule_id":0,        ����,int,���ڹ���ID
                "type":0,           ����,int,���ڹ�������
                "org_id" : 1,       ����,int,��֯ID
                "operator": "jobs", ����,string,������
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void DeleteAttendanceRule(string cond, out string result);

        /**
         * @brief  GetSimpleAttendanceRuleList ��ѯ�򵥿��ڹ����б�
         * @since  V1.20200409
         *
         * @param cond ���������Ϣ
            example:
            {
                "page_no": 1,       ����,int,ҳ��
                "page_size": 10,    ����,int,ÿҳ����
                "org_id":0,         ����,int,��֯ID
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {                
                "code": 0, 
                "info": {
                    "page_no":xx,
                    "page_size":xx,
                    "total_count":xx,
                    "items": [
                        {
                            "rule_id":0,        int,���ڹ���ID
                            "name":"",          string,���ڹ�����
                            "type":1,           int,�������� 1-�̶����� 2-ʱ������ 3-�Ű࿼��
                        }
                    ]
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void GetSimpleAttendanceRuleList(string cond, out string result);

        /**
         * @brief  GetSimpleSubAttendanceRuleList ��ѯ���ӹ����б�
         * @since  V1.20200409
         *
         * @param cond ���������Ϣ
            example:
            {
                "page_no": 1,       ����,int,ҳ��
                "page_size": 10,    ����,int,ÿҳ����
                "org_id":0,         ����,int,��֯ID
                "rule_id":0,        ����,int,������ID
                "type":0,           ѡ��,int,����type 1-�̶����� 2-ʱ������ 3-�Ű࿼��
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {                
                "code": 0, 
                "info": {
                    "page_no":xx,
                    "page_size":xx,
                    "total_count":xx,
                    "items": [
                        {
                            "rule_id":0,    int,���ڹ���ID
                            "name":"",          string,���ڹ�����
                            "type":1,           int,�������� 1-�̶����� 2-ʱ������ 3-�Ű࿼��
                            "property" : {}
                        }
                    ]
            }
            for property:
            type 1-�̶�����
            {
                "start_signin_time" : "00 09:00:00",
                "end_signin_time" : "00 09:30:00",
                "start_signout_time" : "01 09:00:00",
                "end_signout_time" : "01 09:30:00"
                "rule_id" :1,
                "sub_rule_name" : "",
                "type" : 1
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void GetSimpleSubAttendanceRuleList(string cond, out string result);

        /**
         * @brief  QueryAttendanceRuleList ��ѯ���ڹ����б�
         * @since  V1.20200409
         *
         * @param cond ���������Ϣ
            example:
            {
                "page_no": 1,       ����,int,ҳ��
                "page_size": 10,    ����,int,ÿҳ����
                "org_id":0,         ����,int,��֯ID
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {                
                "code": 0, 
                "info": {
                    "page_no":xx,
                    "page_size":xx,
                    "total_count":xx,
                    "items": [
                        {
                            "rule_id":0,        int,���ڹ���ID
                            "org_id":0,         int,��֯ID
                            "name":"",          string,���ڹ�����
                            "type":1,           int,�������� 1-�̶����� 2-ʱ������ 3-�Ű࿼��
                            "bind_count":0      int,������
                            "remark":"xxx"      string,��ע
                        }
                    ]
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void QueryAttendanceRuleList(string cond, out string result);

        /**
         * @brief  QueryAttendanceRuleBindList ��ѯ���ڹ�����б�
         * @since  V1.20200409
         *
         * @param cond ���������Ϣ
            example:
            {
                "page_no": 1,       ����,int,ҳ��
                "page_size": 10,    ����,int,ÿҳ����
                "type": 1,          ����,int,�������� 1-�̶����� 2-ʱ������ 3-�ְ࿼��
                "rule_id": 1,       ����,int,������ID
                "org_id":0,         ����,int,��֯ID
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {                
                "code": 0, 
                "info": {
                    "page_no":xx,
                    "page_size":xx,
                    "total_count":xx,
                    "items": [
                        {
                            "rule_id":0,        int,���ڹ���ID
                            "org_id":0,         int,��֯ID
                            "rule_name":"",     string,���ڹ�����
                            "type":1,           int,�������� 1-�̶����� 2-ʱ������ 3-�Ű࿼��
                            "people_id":1       int,��ԱID
                            "people_name":""    string,��Ա����
                        }
                    ]
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void QueryAttendanceRuleBindList(string cond, out string result);

        /**
         * @brief  QueryAttendanceRuleInfo ��ѯ���ڹ�����Ϣ
         * @since  V1.20200409
         * @update  V2.20200514
         *
         * @param cond ���������Ϣ
            example:
            {
                "org_id":0,         ����,int,��֯ID
                "type":1,           ����,int,��������, 1-�̶�ʱ������ 2-���̶�ʱ�� 3-�ְ�
                "rule_id":0,        ����,int,������ID
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {                
                "rule_id" : 1,          int,������ID
                "rule_name" : "",       int,����������
                "enable_holiday" : 1,   int,�ڼ��տ��� 0-������ 1-����
                "enable_cross_day" : 1, int,�Ƿ���� 0-������ 1-����
                "unsign_threshold" : 30,int,©����ֵ����λ/����
                "enable_over_work" : 1, int,�Ƿ����Ӱ� 0-�ر� 1-����
                "over_work_threshold" : 30, int,�Ӱ���ֵ,��λ/����
                "dead_line" : "01 04:00:00",int,��ֹ����
                "type" : 1,             int,�������� 1-�̶�ʱ��2-���̶�ʱ�� 3-�ְ�
                "remark" : "",          string,��ע
                "org_id" : 1,           int,��֯ID
                "rule_info" : [         �ӹ�����Ϣ
                    {}
                ],
                "dead_line_threshold":240,  int,��ֹʱ��,���ʱ���Ӻ���ֵ,�ְ࿼�ڶ���
                "team_count":3,             int,��������,�ְ࿼�ڶ���
                "shift_period":3,           int,�Ű�����,�ְ࿼�ڶ���
                "shift_times":3,            int,ÿ���Ű����,�ְ࿼�ڶ���
                "start_date":"2020-05-07",  string,������ʼ����,�ְ࿼�ڶ���
           }
            for rule_info:
            type = 1 �̶�ʱ������
            {
                "sub_rule_id" : 1,  int,�ӹ���ID
                "sub_rule_name" : "",                  string,�ӹ�������
                "start_signin_time" : "00 09:00:00",   string,��ʼǩ��ʱ��
                "end_signin_time" : "00 09:30:00",     string,����ǩ��ʱ��
                "start_signout_time" : "00 18:00:00",  string,��ʼǩ��ʱ��
                "end_signout_time" : "00 18:30:00"     string,����ǩ��ʱ��
            }
            type = 2 ʱ������
            {
            }
            type = 3 �ְ࿼��
            {
                "index":0,                          int,�ù�����������,0-��һ�� 1-�ڶ���,�Դ�����
                "rule_index":0,                     int,�ù�������,0-��һ�� 1-�ڶ���,�Դ�����
                "team_index":0,                     int,�ù����������
                "sub_rule_name":"A����",            string,�ù������ð���
                "start_signin_time":"00 07:00:00",  string,ǩ����ʼʱ��
                "end_signin_time":"00 09:00:00",    string,ǩ������ʱ��
                "start_signout_time":"00 17:00:00", string,ǩ�˿�ʼʱ��
                "end_signout_time":"00 19:00:00"    string,ǩ�˽���ʱ��
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void QueryAttendanceRuleInfo(string cond, out string result);

        /**
         * @brief  BatchSetAttendanceRule �������ÿ��ڹ���
         * @since  V1.20200409
         * @update  V2.20200514
         *
         * @param cond ���������Ϣ
            example:
            {
                "rule_id":0,            ����,int,���ڹ���ID
                "people_id_list":"1",   ����,string,��ԱID�б�
                "org_id" : 1,           ����,int,��֯ID
                "operator": "jobs",     ����,string,������
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void BatchSetAttendanceRule(string cond, out string result);

        /**
         * @brief  SetPeopleAttendanceRule ���ÿ��ڹ���
         * @since  V1.20200409
         *
         * @param cond ���������Ϣ
            example:
            {
                "rule_id":0,            ����,int,���ڹ���ID
                "people_id":1,          ����,int,��ԱID
                "org_id" : 1,           ����,int,��֯ID
                "operator": "jobs"      ����,string,������
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - {"code": 0}
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void SetPeopleAttendanceRule(string cond, out string result);

        /**
         * @brief  QueryCurMonthAttendance ��ѯ���¿���ͳ��
         * @since  V1.20200409
         *
         * @param cond ���������Ϣ
            example:
            {
                "org_id" : 1,           ����,int,��֯ID
                "start_time":"2020-04-01",  ����,string,��ʼʱ��
                "end_time":"2020-04-01",    ����,string,����ʱ��
                "operator": "jobs",     ����,string,������
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0, 
                "info": {
                    "org_id" : 1,               int,��֯ID
                    "late_count" : 1,           int,�ٵ�����
                    "early_leave_count" : 1,    int,������Ա����
                    "unsignin_count" : 1,       int,©������
                    "absent_count" : 1,         int,ȱ������
                    "leave_count" : 1,          int,�������
                    "resign_count" : 1          int,��ǩ����
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void QueryCurMonthAttendance(string cond, out string result);

        /**
         * @brief  QueryAttendanceToday ��ѯ���տ���ͳ��
         * @since  V1.20200409
         *
         * @param cond ���������Ϣ
            example:
            {
                "org_id" : 1,           ����,int,��֯ID
                "operator": "jobs",     ����,string,������
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0, 
                "info": {
                    "org_id" : 1,               int,��֯ID
                    "people_count" : 1,         int,Ӧ����Ա����
                    "arrive_count" : 1,         int,ʵ����Ա����
                    "late_count" : 1,           int,�ٵ�����
                    "unsignin_count" : 1,       int,©������
                    "leave_count" : 1           int,�������
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void QueryAttendanceToday(string cond, out string result);

        /**
         * @brief  QueryAttendanceList ��ѯ���ڼ�¼�б�
         * @since  V1.20200409
         *
         * @param cond ���������Ϣ
            example:
            {
                "page_no": 1,           ����,int,ҳ��
                "page_size": 10,        ����,int,ÿҳ����
                "org_id" : 1,           ����,int,��֯ID
                "operator": "jobs",     ����,string,������
                "query_cond": {
                    "start_time":"2020-04-01",  ѡ��,string,��ʼʱ��
                    "end_time":"2020-04-01",    ѡ��,string,����ʱ��
                    "lib_id":1,                 ѡ��,int,�׿�id
                    "people_name":"",           ѡ��,string,Ա������
                    "rule_id":1,                ѡ��,int,���ڹ���ID
                    "state":0                   ѡ��,int,�쳣״̬ 1-�ٵ� 2-���� 3-©�� 4-ȱ�� 5-��� 6-�Ӱ� 7-����
                }
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0, 
                "info": {
                    "page_no":xx,
                    "page_size":xx,
                    "total_count":xx,
                    "items": [
                        {
                            "id" : 1,                   int,��¼���
                            "org_id" : 1,               int,��֯ID
                            "people_id" : 1,            int,��ԱID
                            "people_name" : "xxx",      string,��Ա����
                            "lib_id" : 1,               int,��ԱID
                            "lib_name" : "xxx",         string,��Ա����
                            "rule_id" : 1,              int,���ڹ���ID
                            "rule_name" : "",           string,���ڹ�������
                            "attend_date" : "2020-01-01",   string,��������
                            "signin_time" : "09:00:00",     string,ǩ��ʱ��
                            "signout_time" : "09:00:00",    string,ǩ��ʱ��
                            "late_mins" : 30,           int,�ٵ�ʱ�� ��λ/����
                            "early_leave_mins" : 30,    int,����ʱ�� ��λ/����
                            "over_work_mins" : 30,      int,�Ӱ�ʱ�� ��λ/����
                            "forget_sigin_times" : 1,        int,©�򿨴���,ÿ���������2��,2�μ�Ϊȱ��
                            "absent_times" : 0,         int,ȱ�ڴ���,ÿ���������ȱ�ڴ���һ��
                            "resign_times" : 0,         int,��ǩ����
                            "is_leave" : 0              int,�Ƿ����
                        }, ...
                    ]
                    "others":{                          ����ͳ������
                        "total_late_mins" : 30,         int,���гٵ����Ӻ�
                        "total_late_times" : 30,        int,���гٵ�������
                        "total_early_leave_mins" : 30,  int,�������˷��Ӻ�
                        "total_early_leave_times" : 30, int,��������������
                        "total_over_work_mins" : 30,    int,���мӰ���Ӻ�
                        "total_over_work_times" : 30,   int,���мӰ�������
                        "total_forget_sigin_times" : 30,     int,����©�򿨴���
                        "total_absent_times" : 30,      int,����ȱ�ڴ���
                        "total_leave_days" : 30         int,�����������
                    }
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void QueryAttendanceList(string cond, out string result);

        /**
         * @brief  QueryTodayAttendanceList ��ѯ���տ��ڼ�¼�б�
         * @since  V1.20200409
         *
         * @param cond ���������Ϣ
            example:
            {

                "page_no": 1,           ����,int,ҳ��
                "page_size": 10,        ����,int,ÿҳ����
                "org_id" : 1,           ����,int,��֯ID
                "operator": "jobs",     ����,string,������
                "query_cond": {
                    "lib_id":1,                 ѡ��,int,�׿�id
                    "rule_id":1,                ѡ��,int,���ڹ���ID
                    "state":0                   ѡ��,int,�쳣״̬ 1-�ٵ� 3-©�� 5-���
                }
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0, 
                "info": {
                    "page_no":xx,
                    "page_size":xx,
                    "total_count":xx,
                    "items": [
                        {
                            "org_id" : 1,               int,��֯ID
                            "people_id" : 1,            int,��ԱID
                            "people_name" : "xxx",      string,��Ա����
                            "lib_id" : 1,               int,��ԱID
                            "lib_name" : "xxx",         string,��Ա����
                            "rule_id" : 1,              int,���ڹ���ID
                            "rule_name" : "",           string,���ڹ�������
                            "signin_time" : "2020-04-01 09:00:00",     string,ǩ��ʱ��
                            "state" : 0                 int,1-�ٵ� 3-©�� 5-�ٵ�
                        }, ...
                    ]
                    "others":{                          ����ͳ������
                        "total_late_times" : 30,        int,���гٵ�������
                        "total_forget_sigin_times" : 30,     int,����©�򿨴���
                        "total_people" : 30,            int,���п�����Ա��
                        "total_leave_times" : 30        int,��������˴�
                    }
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void QueryTodayAttendanceList(string cond, out string result);

        /**
         * @brief  QueryAttendanceMainPage ��ѯ��ҳ���ڼ�¼ͳ��
         * @since  V1.20200409
         *
         * @param cond ���������Ϣ
            example:
            {

                "site_list" : "1,2",        ����,string,����ID�б�
                "begin_date":"2020-04-01",  ����,string,��ʼʱ��
                "end_date":"2020-04-01",    ����,string,����ʱ��
                "org_id" : 1,               ����,int,��֯ID
                "operator": "jobs",         ����,string,������
            }
         * @param result �ɹ���ʧ�ܡ�����
            �ɹ� - ���ض�Ӧ���
            {
                "code": 0, 
                "info": {
                    "resign_count" : 30,            int,��ǩ�ܺ�
                    "late_count" : 30,              int,�ٵ��ܺ�
                    "absent_count" : 30,            int,�����ܺ�
                    "sign_count" : 30,              int,�����ܺ�
                    "record_count" : 30             int,��¼�ܺ�
                }
            }
            ʧ�� - {"code": <��0>, "msg": "����˵��", "user_visible": false}
         */
        void QueryAttendanceMainPage(string cond, out string result);
/*****************************************������ؽӿڽ���*************************************/        
    };
};
