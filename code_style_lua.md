# Code Style - Lua
### Reference
- [LuaStyleGuide](http://lua-users.org/wiki/LuaStyleGuide)
    - To append to an array, it can be terser and more efficient to do t[#t+1] = 1 rather than table.insert(t, 1).
- [OpenResty 最佳实践](https://moonbingbing.gitbooks.io/openresty-best-practices/content/ngx_lua/lua_opt.html)


```lua

-- NOTE0: 代码可读性第一！
-- 变量命名规范
--   在一切能使用local修饰的情况下，使用local进行修饰
--   驼峰命名法
--     小驼峰式命名法：第一个单字以小写字母开始；第二个单字的首字母大写，例如：firstName、lastName。
--     大驼峰式命名法：每一个单字的首字母都采用大写字母，例如：FirstName、LastName、CamelCase，也被称为Pascal命名法。
--   下划线命名法
--     小下划线命名法：所有字母均为小写，例如登录按钮：login_btn。
--     大下划线命名法：所有字母均为大写，常见于常量，例如：最小间隔时间MIN_GAP_TIME。
--   常数一般采用大下划线命名法。这样每个字母都大写，十分醒目，且各个单词都用下划线分割，便于阅读。
--     比如：MAX_SPEED表示最大速度，IS_SHOW_DEBUG_ERROR_MSG表示是否显示报错消息等等。
-- 现在项目中，两种混合使用，但在局部代码块中务必使用同一个风格!

-- NOTE1: 函数体，或大型代码块之间，一般空2行。
--        如果相邻函数体内无空行，或者相关性更紧密，空1行也可以。
--        方便起见，最好都空2行！

-- NOTE2: 单行注释符号后面添加空格

-- NOTE3: 函数体，以及连续代码块内，空行不超过1行
--        函数体开始后、函数体结尾前 没有必要则无需空行

-- NOTE4: 在可读性的前提下，应该尽量减少缩进


local os = require("os")

local _global_var = 42
                                                           -- Good! as NOTE1
                                                           -- Good! as NOTE1
do
    local function test(x)
        x = x or "idunno"                                  -- Good! as NOTE0
        if x == false or x == nil then x = "idunno" end    -- Bad!! as NOTE0
        
        print(x == "yes" and "YES!" or x)                  -- Good! as NOTE0
        if x == "yes" then print("YES!") else print(x) end -- Bad!! as NOTE0
    end

    local function bad_check(x)                            -- Bad!! as NOTE4
        if is_valid_1(x) then
            x = do1(x)
            if is_valid_2(x) then
                x = do2(x)
                if is_valid_3(x) then
                    return true
                end
            end
        end
        return false
    end

    local function good_check(x)                           -- Good! as NOTE4
        if not is_valid_1(x) then
            -- logging something
            return false, "condition1 failed!"
        end
        x = do1(x)
        if not is_valid_2(x) then
            -- logging something
            return false, "condition2 failed!"
        end
        x = do2(x)
        if not is_valid_3(x) then
            -- logging something
            return false, "condition3 failed!"
        end
        return true
    end

    for i = 1, 10 do
        print(i)
    end
    for i = 1, 10 do
        print(i)
    end
end
                                                           -- Good! as NOTE1
                                                           -- Good! as NOTE1
do
    for i = 1, 100 do
        print(i)
    end
    for i = 1, 100 do
        print(i)
    end
end
                                                           -- Good! as NOTE1
                                                           -- Good! as NOTE1
function f1()
    return 42
end
                                                           -- Good! as NOTE1
function ff1()
    return 73
end
                                                           -- Good! as NOTE1
function ff2()
    return nil
end
                                                           -- Good! as NOTE1
                                                           -- Good! as NOTE1
function f2()
    local a = 42  -- the answer A                          -- Good! as NOTE2
    local b = 73  --the answer B                           -- Bad!! as NOTE2

    for i = 1, a do
        print(i)
    end
                                                           -- Good! as NOTE3
    return a
    
end
                                                           -- Bad!! as NOTE1
function f3()
                                                           -- Bad!! as NOTE3
    f1()
    f2()

    for i = 1, 10 do
        f3()
    end
end
function f4()                                              -- Bad!! as NOTE1
end

```