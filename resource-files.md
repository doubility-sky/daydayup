## 美术资源命名方法简则

### 准则
- 使用**小写**字母与**下划线**组成
- 尽量使用清晰、无歧义的英文名词/动词
- 难以找到对应表达意义的英文单词，可以使用中文拼音


### 格式
- `xxx_yyy_idx.fff`
- xxx 为用途类型简称，如：  
  - `btn` 按钮  
  - `img` 图片  
  - `eff` 特效  
    
- `yyy` 为图片信息描述，如：  
  - 确定：`confirm`  
  - 取消：`cancel`  
  - 登录背景：`login_bg`
  - 大厅背景：`hall_bg`
    
- `idx` 为图片索引  
  - 图片只有独立的单张则省略  
  - 相关联的多个图片从 1 开始顺序编号  
    - 按钮通则：  
      ```
      btn_confirm_1.png 正常状态  
      btn_confirm_2.png 按下状态  
      btn_confirm_3.png 不可用状态  
      ```
  - 如相关联图片数量超过两位数
    - 为方便 `windows` 等操作系统排列一致，进行数字补零  
      如：`01, 02, ..., 10, 11, ..., 99`  
    - 扑克牌：
      ```  
      img_card_01.png   ♦️A  
      img_card_02.png   ♦️2  
      ...  ...  
      img_card_12.png   ♦️Q  
      img_card_13.png   ♦️K  
      img_card_14.png   ♣️A
      ... ...
      ```
    
- `fff` 为文件后缀
