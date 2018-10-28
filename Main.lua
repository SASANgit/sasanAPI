serpent = require('serpent')
serp = require 'serpent'.block
http = require("socket.http")
https = require("ssl.https")
http.TIMEOUT = 10
lgi = require ('lgi')
bot=dofile('utils.lua')
json=dofile('json.lua')
JSON = (loadfile  "./libs/dkjson.lua")()
redis = (loadfile "./libs/JSON.lua")()
redis = (loadfile "./libs/redis.lua")()
database = Redis.connect('127.0.0.1', 6379)
notify = lgi.require('Notify')
tdcli =dofile('tdcli.lua')
notify.init ("Telegram updates")
sudos = dofile('config.lua')
chats = {}
day = 86400
bot_id_SASI = {string.match(token, "^(%d+)(:)(.*)")}
bot_id = tonumber(bot_id_SASI[1])
function load_SASI(fileName)
	local SASAN = io.open(fileName)
	if not SASAN then
	return {}
	end
	local SASANZARE = SASAN:read('*all')
	SASAN:close()
	local SASANAPI = JSON.decode(SASANZARE)
	return SASANAPI
end
function save_SASI(fileName, data)
	local SASAN = JSON.encode(data)
	local SASANZARE = io.open(fileName, 'w')
	SASANZARE:write(SASAN)
	SASANZARE:close()
end
function SASISet(SASAN, SASANZARE)
  local SASANAPI = 'SASI_'..bot_id..'.json'
  if (SASAN and SASANZARE and SASANAPI) then
  local SASI_data = load_SASI(SASANAPI)
  if not SASI_data then
  SASI_data = {}
  save_SASI(SASANAPI, SASI_data)
  end
  SASI_data[tostring(SASAN)] = {
  SASAN = SASANZARE
  }
  save_SASI(SASANAPI, SASI_data)
  end
  if not SASAN then print('no SASAN') end
  if not SASANZARE then print('no SASANZARE') end
  if not SASANAPI then print('no SASANAPI') end
  end
  function SASIGet(SASAN)
  local SASANAPI = 'SASI_'..bot_id..'.json'
  local SASI_text = nil
  local SASI_data = load_SASI(SASANAPI)
  if SASI_data then
  if SASI_data[tostring(SASAN)] then
  SASI_text = SASI_data[tostring(SASAN)].SASAN
  end
  end
  return SASI_text
  end
  function SASIDel(SASAN)
    local SASANAPI = 'SASI_'..bot_id..'.json'
    if (SASAN) then
    local SASI_data = load_SASI(SASANAPI)
    if not SASI_data then
    data = {}
    save_SASI(SASANAPI, SASI_data)
    end
    SASI_data[tostring(SASAN)] = {
    SASAN = nil
    }
    save_SASI(SASANAPI, SASI_data)
end
end
  function SASIDel1(SASAN)
    local SASANAPI = 'SASI_'..bot_id..'.json'
    if (SASAN) then
    local SASI_data = load_SASI(SASANAPI)
    if not SASI_data then
    data = {}
    save_SASI(SASANAPI, SASI_data)
end
    if SASI_data[tostring(SASAN)].SASAN then
    SASI_data[tostring(SASAN)] = {
    SASAN = nil
    }
end
  if #SASI_data[tostring(SASAN)] == 1 then
  for k,v in pairs(SASI_data[tostring(SASAN)]) do
  table.remove(SASI_data[tostring(SASAN)],k)
end
end
  save_SASI(SASANAPI, SASI_data)
end
end
function SASISet2(SASAN, SASANZARE)
    local SASANAPI = 'SASI2_'..bot_id..'.json'
    if (SASAN and SASANZARE and SASANAPI) then
    local SASI_data = load_SASI(SASANAPI)
    if not SASI_data then
    SASI_data = {}
    save_SASI(SASANAPI, SASI_data)
end
    SASI_data[tostring(SASAN)] = {
    SASAN = SASANZARE
    }
    save_SASI(SASANAPI, SASI_data)
end
    if not SASAN then print('no SASAN') end
    if not SASANZARE then print('no SASANZARE') end
    if not SASANAPI then print('no SASANAPI') end
end
    function SASIGet2(SASAN)
    local SASANAPI = 'SASI2_'..bot_id..'.json'
    local SASI_text = nil
    local SASI_data = load_SASI(SASANAPI)
    if SASI_data[tostring(SASAN)] then
    SASI_text = SASI_data[tostring(SASAN)].SASAN
end
    return SASI_data
end
function SASISetl(SASAN, SASANZARE)
  local SASANAPI = 'SASI_'..bot_id..'.json'
  if (SASAN and SASANZARE and SASANAPI) then
  local SASI_data = load_SASI(SASANAPI)
  if not SASI_data then
  SASI_data = {}
  save_SASI(SASANAPI, SASI_data)
  end
  if not (SASI_data[tostring(SASAN)]) then
	SASI_data[tostring(SASAN)] = {}
	end
  table.insert(SASI_data[tostring(SASAN)], SASANZARE)
	save_SASI(SASANAPI, SASI_data)
	end
  if not SASAN then print('no SASAN') end
  if not SASANZARE then print('no SASANZARE') end
  if not SASANAPI then print('no SASANAPI') end
end
function SASIGetl(SASAN)
  local SASANAPI = 'SASI_'..bot_id..'.json'
  local SASI_text = nil
  local SASI_data = load_SASI(SASANAPI)
  if SASI_data then
  SASI_text = SASI_data[tostring(SASAN)]
  end
  return SASI_text
  end
  function SASIC(SASAN)
    local SASANAPI = 'SASI_'..bot_id..'.json'
    local SASI_text = nil
    local SASI_data = load_SASI(SASANAPI)
    if SASI_data then
    SASI_text2 = SASI_data[tostring(SASAN)]
    if SASI_text2 then
    for i=1, #SASI_text2 do
    SASI_text = i
    end
  end
end
return SASI_text
end

function is_sudo(msg)
  local var = false
  for k,v in pairs(sudo_users) do
  if msg.sender_user_id_ == v then
  var = true
  end
end
  local SASI_add_sudo = redis:get('sudoo'..msg.sender_user_id_..''..bot_id)
  if SASI_add_sudo then
  var = true
  end
   return var
  end
  function sleep(n)
os.execute("sleep " .. tonumber(n))
end
-----------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------
function is_admin(user_id)
local var = false
  local hashs =  'bot:admins:'
local admin = database:sismember(hashs, user_id)
   if admin then
var = true
   end
  for k,v in pairs(sudo_users) do
if user_id == v then
var = true
end
  end
  local SASI_add_sudo = redis:get('sudoo'..user_id..''..bot_id)
  if SASI_add_sudo then
  var = true
  end
return var
end


function is_creator(user_id, chat_id)
local var = false
local hash =  'bot:creator:'..chat_id
local creator = database:sismember(hash, user_id)
  local hashs =  'bot:admins:'
local admin = database:sismember(hashs, user_id)
   if creator then
var = true
   end
   if admin then
var = true
   end
for k,v in pairs(sudo_users) do
if user_id == v then
var = true
end
  end
  local SASI_add_sudo = redis:get('sudoo'..user_id..''..bot_id)
  if SASI_add_sudo then
  var = true
  end
return var
end
-----------------------------------------------------------------------------------------------
function is_vip(user_id, chat_id)
local var = false

local hash =  'bot:mods:'..chat_id
local mod = database:sismember(hash, user_id)
	local hashs =  'bot:admins:'
local admin = database:sismember(hashs, user_id)
	local hashss =  'bot:owners:'..chat_id
local owner = database:sismember(hashss, user_id)
	local hashss =  'bot:creator:'..chat_id
local creator = database:sismember(hashss, user_id)
	local hashsss =  'bot:vipgp:'..chat_id
local vip = database:sismember(hashsss, user_id)
	 if mod then
	var = true
	 end
	 if owner then
	var = true
	 end
	 if creator then
	var = true
	 end
	 if admin then
	var = true
	 end
	 if vip then
	var = true
	 end
for k,v in pairs(sudo_users) do
if user_id == v then
var = true
end
	end
  local SASI_add_sudo = redis:get('sudoo'..user_id..''..bot_id)
  if SASI_add_sudo then
  var = true
  end
return var
end
-----------------------------------------------------------------------------------------------
function is_owner(user_id, chat_id)
local var = false
local hash =  'bot:owners:'..chat_id
local owner = database:sismember(hash, user_id)
  local hashs =  'bot:admins:'
local admin = database:sismember(hashs, user_id)
	local hashss =  'bot:creator:'..chat_id
local creator = database:sismember(hashss, user_id)
   if owner then
var = true
   end
   if admin then
var = true
   end
	 if creator then
	var = true
	 end
for k,v in pairs(sudo_users) do
if user_id == v then
var = true
end
  end
  local SASI_add_sudo = redis:get('sudoo'..user_id..''..bot_id)
  if SASI_add_sudo then
  var = true
  end
return var
end

-----------------------------------------------------------------------------------------------
function is_mod(user_id, chat_id)
local var = false
local hash =  'bot:mods:'..chat_id
local mod = database:sismember(hash, user_id)
	local hashs =  'bot:admins:'
local admin = database:sismember(hashs, user_id)
	local hashss =  'bot:owners:'..chat_id
local owner = database:sismember(hashss, user_id)
	local hashss =  'bot:creator:'..chat_id
local creator = database:sismember(hashss, user_id)
	 if mod then
	var = true
	 end
	 if owner then
	var = true
	 end
	 if creator then
	var = true
	 end
	 if admin then
	var = true
	 end
for k,v in pairs(sudo_users) do
if user_id == v then
var = true
end
	end
  local SASI_add_sudo = redis:get('sudoo'..user_id..''..bot_id)
  if SASI_add_sudo then
  var = true
  end
return var
end
-----------------------------------------------------------------------------------------------
function is_banned(user_id, chat_id)
local var = false
	local hash = 'bot:banned:'..chat_id
local banned = database:sismember(hash, user_id)
	 if banned then
	var = true
	 end
return var
end

function is_gbanned(user_id)
  local var = false
  local hash = 'bot:gbanned:'
  local banned = database:sismember(hash, user_id)
  if banned then
var = true
  end
  return var
end


---------- {Show Files} -----------
  red = '\27[31m'
  reset = '\27[m'
  Blue = "\27[34m"
  Green = "\27[32m"
  print(Green.."\nFiles Now Started : \n "..reset)
  local plugins = database:smembers("files"..bot_id)
	for i,v in ipairs(plugins) do
  print(Blue..i..red..' - \27[10;33m'..v..',\27[m')
  end
  print(Green.."\nThes all Files.\n\n\n"..reset)
  io.popen("mkdir plugins")
----------- {end} ----------


-----------------------------------------------------------------------------------------------
function is_muted(user_id, chat_id)
local var = false
	local hash = 'bot:muted:'..chat_id
local banned = database:sismember(hash, user_id)
	 if banned then
	var = true
	 end
return var
end

function is_gmuted(user_id)
  local var = false
  local hash = 'bot:gmuted:'
  local banned = database:sismember(hash, user_id)
  if banned then
var = true
  end
  return var
end
-----------------------------------------------------------------------------------------------
local function getMessage(chat_id, message_id,cb)
  tdcli_function ({
ID = "GetMessage",
chat_id_ = chat_id,
message_id_ = message_id
  }, cb, nil)
end
-----------------------------------------------------------------------------------------------
local function check_filter_words(msg, value)
  local hash = 'bot:filters:'..msg.chat_id_
  if hash then
local names = database:hkeys(hash)
local text = ''
for i=1, #names do
	   if string.match(value:lower(), names[i]:lower()) and not is_vip(msg.sender_user_id_, msg.chat_id_)then
	local id = msg.id_
   local msgs = {[0] = id}
   local chat = msg.chat_id_
  delete_msg(chat,msgs)
 end
end
  end
end
-----------------------------------------------------------------------------------------------
function resolve_username(username,cb)
  tdcli_function ({
ID = "SearchPublicChat",
username_ = username
  }, cb, nil)
end
  -----------------------------------------------------------------------------------------------
function changeChatMemberStatus(chat_id, user_id, status)
  tdcli_function ({
ID = "ChangeChatMemberStatus",
chat_id_ = chat_id,
user_id_ = user_id,
status_ = {
ID = "ChatMemberStatus" .. status
},
  }, dl_cb, nil)
end
  -----------------------------------------------------------------------------------------------
function getInputFile(file)
  if file:match('/') then
infile = {ID = "InputFileLocal", path_ = file}
  elseif file:match('^%d+$') then
infile = {ID = "InputFileId", id_ = file}
  else
infile = {ID = "InputFilePersistentId", persistent_id_ = file}
  end

  return infile
end
os.execute('cd .. &&  rm -fr ../.telegram-cli')
os.execute('cd .. &&  rm -rf ../.telegram-cli')
function del_all_msgs(chat_id, user_id)
  tdcli_function ({
ID = "DeleteMessagesFromUser",
chat_id_ = chat_id,
user_id_ = user_id
  }, dl_cb, nil)
end



  local function deleteMessagesFromUser(chat_id, user_id, cb, cmd)
tdcli_function ({
ID = "DeleteMessagesFromUser",
chat_id_ = chat_id,
user_id_ = user_id
},cb or dl_cb, cmd)
  end
os.execute('cd .. &&  rm -rf .telegram-cli')
os.execute('cd .. &&  rm -fr .telegram-cli')
function getChatId(id)
  local chat = {}
  local id = tostring(id)

  if id:match('^-100') then
local channel_id = id:gsub('-100', '')
chat = {ID = channel_id, type = 'channel'}
  else
local group_id = id:gsub('-', '')
chat = {ID = group_id, type = 'group'}
  end

  return chat
end
  -----------------------------------------------------------------------------------------------
function chat_leave(chat_id, user_id)
  changeChatMemberStatus(chat_id, user_id, "Left")
end
  -----------------------------------------------------------------------------------------------
function from_username(msg)
   function gfrom_user(extra,result,success)
   if result.username_ then
   F = result.username_
   else
   F = 'nil'
   end
return F
   end
  local username = getUser(msg.sender_user_id_,gfrom_user)
  return username
end
  -----------------------------------------------------------------------------------------------
function chat_kick(chat_id, user_id)
  changeChatMemberStatus(chat_id, user_id, "Kicked")
end
  -----------------------------------------------------------------------------------------------
function do_notify (user, msg)
  local n = notify.Notification.new(user, msg)
  n:show ()
end
  -----------------------------------------------------------------------------------------------
local function getParseMode(parse_mode)
  if parse_mode then
local mode = parse_mode:lower()

if mode == 'markdown' or mode == 'md' then
P = {ID = "TextParseModeMarkdown"}
elseif mode == 'html' then
P = {ID = "TextParseModeHTML"}
end
  end
  return P
end
  -----------------------------------------------------------------------------------------------
local function getMessage(chat_id, message_id,cb)
  tdcli_function ({
ID = "GetMessage",
chat_id_ = chat_id,
message_id_ = message_id
  }, cb, nil)
end
-----------------------------------------------------------------------------------------------
function sendContact(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, phone_number, first_name, last_name, user_id)
  tdcli_function ({
ID = "SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = reply_to_message_id,
disable_notification_ = disable_notification,
from_background_ = from_background,
reply_markup_ = reply_markup,
input_message_content_ = {
ID = "InputMessageContact",
contact_ = {
  ID = "Contact",
  phone_number_ = phone_number,
  first_name_ = first_name,
  last_name_ = last_name,
  user_id_ = user_id
},
},
  }, dl_cb, nil)
end
-----------------------------------------------------------------------------------------------
function sendPhoto(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, photo, caption)
  tdcli_function ({
ID = "SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = reply_to_message_id,
disable_notification_ = disable_notification,
from_background_ = from_background,
reply_markup_ = reply_markup,
input_message_content_ = {
ID = "InputMessagePhoto",
photo_ = getInputFile(photo),
added_sticker_file_ids_ = {},
width_ = 0,
height_ = 0,
caption_ = caption
},
  }, dl_cb, nil)
end
-----------------------------------------------------------------------------------------------
function getUserFull(user_id,cb)
  tdcli_function ({
ID = "GetUserFull",
user_id_ = user_id
  }, cb, nil)
end
-----------------------------------------------------------------------------------------------
function vardump(value)
  print(serpent.block(value, {comment=false}))
end
-----------------------------------------------------------------------------------------------
function dl_cb(arg, data)
end
-----------------------------------------------------------------------------------------------
URL33 = require('socket.url')
local function send(chat_id, reply_to_message_id, disable_notification, text, disable_web_page_preview, parse_mode)
  local TextParseMode = getParseMode(parse_mode)
  local text2 = text
  local text_key = database:get('key_ts'..bot_id)
  if text_key then
  if parse_mode then
  if parse_mode == 'markdown' or parse_mode == 'md' then
  parse_mode = "Markdown"
  elseif parse_mode == 'html' then
  parse_mode = "Html"
  end
  end
  local channel_ts = database:get("channel_ts"..bot_id)
  local channel_user_ts = database:get("channel_user_ts"..bot_id)
  keyboard = {}
  keyboard.inline_keyboard = {
  {
  {text = ''..(channel_ts or "🔖 PRIME NEWS")..'', url=''..(channel_user_ts or 't.me/SASIBotNews')..''},
  },
  }
  local SASAN = "https://api.telegram.org/bot" ..token.. '/sendMessage?chat_id=' .. chat_id
  if reply_to_message_id ~= 0 then
  SASAN = SASAN .. '&reply_to_message_id=' .. reply_to_message_id/2097152/0.5 -- فاک یو
  end
  if disable_web_page_preview then
  SASAN = SASAN .. '&disable_web_page_preview=true'
  end
  if text then
  SASAN = SASAN..'&text='..URL33.escape(text2)
  end
  if parse_mode then
  SASAN = SASAN .. '&parse_mode='..parse_mode
  end
  SASAN = SASAN..'&reply_markup='..JSON.encode(keyboard)
  https.request(SASAN)
  else
  tdcli_function ({
  ID = "SendMessage",
  chat_id_ = chat_id,
  reply_to_message_id_ = reply_to_message_id,
  disable_notification_ = disable_notification,
  from_background_ = 1,
  reply_markup_ = nil,
  input_message_content_ = {
  ID = "InputMessageText",
  text_ = text,
  disable_web_page_preview_ = disable_web_page_preview,
  clear_draft_ = 0,
  entities_ = {},
  parse_mode_ = TextParseMode,
  },
    }, dl_cb, nil)
  end
  end
-----------------------------------------------------------------------------------------------
function sendaction(chat_id, action, progress)
  tdcli_function ({
ID = "SendChatAction",
chat_id_ = chat_id,
action_ = {
ID = "SendMessage" .. action .. "Action",
progress_ = progress or 100
}
  }, dl_cb, nil)
end
-----------------------------------------------------------------------------------------------
function changetitle(chat_id, title)
  tdcli_function ({
ID = "ChangeChatTitle",
chat_id_ = chat_id,
title_ = title
  }, dl_cb, nil)
end
-----------------------------------------------------------------------------------------------
function edit(chat_id, message_id, reply_markup, text, disable_web_page_preview, parse_mode)
  local TextParseMode = getParseMode(parse_mode)
  tdcli_function ({
ID = "EditMessageText",
chat_id_ = chat_id,
message_id_ = message_id,
reply_markup_ = reply_markup,
input_message_content_ = {
ID = "InputMessageText",
text_ = text,
disable_web_page_preview_ = disable_web_page_preview,
clear_draft_ = 0,
entities_ = {},
parse_mode_ = TextParseMode,
},
  }, dl_cb, nil)
end
-----------------------------------------------------------------------------------------------
function setphoto(chat_id, photo)
  tdcli_function ({
ID = "ChangeChatPhoto",
chat_id_ = chat_id,
photo_ = getInputFile(photo)
  }, dl_cb, nil)
end
-----------------------------------------------------------------------------------------------
function add_user(chat_id, user_id, forward_limit)
  tdcli_function ({
ID = "AddChatMember",
chat_id_ = chat_id,
user_id_ = user_id,
forward_limit_ = forward_limit or 50
  }, dl_cb, nil)
end
-----------------------------------------------------------------------------------------------
function delmsg(arg,data)
  for k,v in pairs(data.messages_) do
delete_msg(v.chat_id_,{[0] = v.id_})
  end
end
-----------------------------------------------------------------------------------------------
function unpinmsg(channel_id)
  tdcli_function ({
ID = "UnpinChannelMessage",
channel_id_ = getChatId(channel_id).ID
  }, dl_cb, nil)
end
-----------------------------------------------------------------------------------------------
local function blockUser(user_id)
  tdcli_function ({
ID = "BlockUser",
user_id_ = user_id
  }, dl_cb, nil)
end
-----------------------------------------------------------------------------------------------
local function unblockUser(user_id)
  tdcli_function ({
ID = "UnblockUser",
user_id_ = user_id
  }, dl_cb, nil)
end
-----------------------------------------------------------------------------------------------
local function getBlockedUsers(offset, limit)
  tdcli_function ({
ID = "GetBlockedUsers",
offset_ = offset,
limit_ = limit
  }, dl_cb, nil)
end
-----------------------------------------------------------------------------------------------
function delete_msg(chatid,mid)
  tdcli_function ({
  ID="DeleteMessages",
  chat_id_=chatid,
  message_ids_=mid
  },
  dl_cb, nil)
end
-----------------------------------------------------------------------------------------------
function chat_del_user(chat_id, user_id)
  changeChatMemberStatus(chat_id, user_id, 'Editor')
end
-----------------------------------------------------------------------------------------------
function getChannelMembers(channel_id, offset, filter, limit)
  if not limit or limit > 200 then
limit = 200
  end
  tdcli_function ({
ID = "GetChannelMembers",
channel_id_ = getChatId(channel_id).ID,
filter_ = {
ID = "ChannelMembers" .. filter
},
offset_ = offset,
limit_ = limit
  }, dl_cb, nil)
end
-----------------------------------------------------------------------------------------------
function getChannelFull(channel_id)
  tdcli_function ({
ID = "GetChannelFull",
channel_id_ = getChatId(channel_id).ID
  }, dl_cb, nil)
end
-----------------------------------------------------------------------------------------------
local function channel_get_bots(channel,cb)
local function callback_admins(extra,result,success)
limit = result.member_count_
getChannelMembers(channel, 0, 'Bots', limit,cb)
channel_get_bots(channel,get_bots)
end

  getChannelFull(channel,callback_admins)
end
-----------------------------------------------------------------------------------------------
local function getInputMessageContent(file, filetype, caption)
  if file:match('/') then
infile = {ID = "InputFileLocal", path_ = file}
  elseif file:match('^%d+$') then
infile = {ID = "InputFileId", id_ = file}
  else
infile = {ID = "InputFilePersistentId", persistent_id_ = file}
  end

  local inmsg = {}
  local filetype = filetype:lower()

  if filetype == 'animation' then
inmsg = {ID = "InputMessageAnimation", animation_ = infile, caption_ = caption}
  elseif filetype == 'audio' then
inmsg = {ID = "InputMessageAudio", audio_ = infile, caption_ = caption}
  elseif filetype == 'document' then
inmsg = {ID = "InputMessageDocument", document_ = infile, caption_ = caption}
  elseif filetype == 'photo' then
inmsg = {ID = "InputMessagePhoto", photo_ = infile, caption_ = caption}
  elseif filetype == 'sticker' then
inmsg = {ID = "InputMessageSticker", sticker_ = infile, caption_ = caption}
  elseif filetype == 'video' then
inmsg = {ID = "InputMessageVideo", video_ = infile, caption_ = caption}
  elseif filetype == 'voice' then
inmsg = {ID = "InputMessageVoice", voice_ = infile, caption_ = caption}
  end

  return inmsg
end

-----------------------------------------------------------------------------------------------
function send_file(chat_id, type, file, caption,wtf)
local mame = (wtf or 0)
  tdcli_function ({
ID = "SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = mame,
disable_notification_ = 0,
from_background_ = 1,
reply_markup_ = nil,
input_message_content_ = getInputMessageContent(file, type, caption),
  }, dl_cb, nil)
end
-----------------------------------------------------------------------------------------------
function getUser(user_id, cb)
  tdcli_function ({
ID = "GetUser",
user_id_ = user_id
  }, cb, nil)
end
-----------------------------------------------------------------------------------------------
function pin(channel_id, message_id, disable_notification)
   tdcli_function ({
ID = "PinChannelMessage",
channel_id_ = getChatId(channel_id).ID,
message_id_ = message_id,
disable_notification_ = disable_notification
   }, dl_cb, nil)
end
-----------------------------------------------------------------------------------------------
function tdcli_update_callback(data)
-------------------------------------------
if (data.ID == "UpdateNewMessage") then
local msg = data.message_
if tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
if (msg.content_.text_ == 'فایل ها' or msg.content_.text_ == 'files') then
local plugins = database:smembers("files"..bot_id)
local SASAN = io.popen('cd plugins && ls'):read("*all")
local prime_files2 = ''
for i=1,#plugins do
prime_files2 = prime_files2..'{'..plugins[i]..'}\n'
end
send(msg.chat_id_, msg.id_, 1, '🗂 SASI Prime Files : \n '..SASAN..'\n ---------------------- \n\n📌 Enabled Files : \n'..prime_files2..'', 1, 'html')
end
text = msg.content_.text_
if text then
local text = msg.content_.text_:gsub("افزودن فایل",'add file')
if text:match("^(active) (.*)(.lua)$")then
local name_t = {string.match(text, "^(active) (.*)(.lua)$")}
function load(filename)
local f = io.open(filename)
if not f then
return "SASAN"
end
local s = f:read('*all')
f:close()
return s
end
local f = load("plugins/"..name_t[2]..".lua")
if f ~= "SASAN" then
if f:match("^(.*)(SASI_SPS)(.*)$") then
database:sadd("files"..bot_id,name_t[2]..'.lua')
send(msg.chat_id_, msg.id_, 1, "📌 Actived {"..name_t[2]..".lua}", 1, 'html')
else
send(msg.chat_id_, msg.id_, 1, '📚 SASI Prime Cant support this file , i can only support all of files from this channel :(t.me/SASIBotFiles)', 1, 'md')
end
else
send(msg.chat_id_, msg.id_, 1, '📚 SASI Prime Cant support this file , i can only support all of files from this channel :(t.me/SASIBotFiles)', 1, 'md')
end
end
local text = msg.content_.text_:gsub("حذف فایل",'del file')
if text:match("^(deactive) (.*)(.lua)$") then
local name_t = {string.match(text, "^(deactive) (.*)(.lua)$")}
database:srem("files"..bot_id,name_t[2]..'.lua')
send(msg.chat_id_, msg.id_, 1, "📌 Deactived : {"..name_t[2]..".lua}", 1, 'html')
end
if (text:match("^(del all file)$") or text:match("^(حذف فایل ها)$"))then
database:del("files"..bot_id)
send(msg.chat_id_, msg.id_, 1, "🗑 All files has been removed !", 1, 'html')
end
local text = msg.content_.text_:gsub("حذف فایل",'remove file')
if text:match("^(remove file) (.*)(.lua)$") then
local name_t = {string.match(text, "^(remove file) (.*)(.lua)$")}
io.popen("rm -fr plugins/"..name_t[2]..'.lua')
database:srem("files"..bot_id,name_t[2]..'.lua')
send(msg.chat_id_, msg.id_, 1, "📌 Deactived : {"..name_t[2]..".lua}", 1, 'html')
end
if (msg.content_.text_ == 'افزودن فایل' or  msg.content_.text_ == 'add file') then
send(msg.chat_id_, msg.id_, 1, "📌 Please Send Supported files !", 1, 'html')
database:set("addfiel"..msg.sender_user_id_,"yes")
end
local text = msg.content_.text_:gsub("دریافت فایل",'get file')
if text:match("^(get file) (.*)(.lua)$") then
local name_t = {string.match(text, "^(get file) (.*)(.lua)$")}
send(msg.chat_id_, msg.id_, 1, "⏰  Please Wait ! \n Uploading : {"..name_t[2]..".lua}", 1, 'html')
local SPSe = 'https://api.telegram.org/bot' .. token .. '/sendDocument'
local curl = 'curl "' .. SPSe .. '" -F "chat_id=' .. msg.chat_id_ .. '" -F "document=@' .. 'plugins/'..name_t[2]..'.lua' .. '"'
io.popen(curl)
end
end
if data.message_.content_.document_ then
local infooo = database:get("addfiel"..msg.sender_user_id_)
if (infooo and infooo == "yes") then
send(msg.chat_id_, msg.id_, 1, "📤┇درحال آپلود ..", 1, 'html')
local id_SASI = data.message_.content_.document_.document_.persistent_id_
function download_to_file(url, file_path)
local respbody = {}
local options = {
url = url,
sink = ltn12.sink.table(respbody),
redirect = true
}
local response = nil
options.redirect = false
response = {https.request(options)}
local code = response[2]
local headers = response[3]
local status = response[4]
if code ~= 200 then return false, code end
file = io.open(file_path, "w+")
file:write(table.concat(respbody))
file:close()
return file_path, code
end
local url_SASI3 = 'https://api.telegram.org/bot' .. token .. '/getfile?file_id='..id_SASI
local SASANAPI = https.request(url_SASI3)
local SASI6 = JSON.decode(SASANAPI)
local photo_SASI = download_to_file('https://api.telegram.org/file/bot'..token..'/'..SASI6.result.file_path, 'plugins/'..data.message_.content_.document_.file_name_)
send(msg.chat_id_, msg.id_, 1, "✔️┇فایل با موفقیت آپلود شد !", 1, 'html')
database:del("addfiel"..msg.sender_user_id_)
end
end
end -- end if sudo
local plugins = database:smembers("files"..bot_id)
for i=1,#plugins do
local SPSee = dofile("plugins/"..plugins[i])
local kt = SPSee.SASI_SPS(data)
if kt == 'end' then
return false
end
end
if tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
  if text then
  if (text and text == 'تبلیغ شیشه ای فعال' or text:match("^inline on$") ) then
  database:set('key_ts'..bot_id,"yes")
  if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, "> Inline has been enable", 1, 'html')
  else
  send(msg.chat_id_, msg.id_, 1, "✅┇ تبلیغات شیشه ای روشن شد !", 1, 'html')
  end
  end
  if (text and text == 'تبلیغ شیشه ای غیرفعال' or text:match("^inline off$") ) then
  database:del('key_ts'..bot_id)
  if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, "> inline has been disable", 1, 'html')
  else
  send(msg.chat_id_, msg.id_, 1, "⚠️┇تبلیغات شیشه ای خاموش شد !", 1, 'html')
  end
  end
  local text = msg.content_.text_:gsub("تنظیم تبلیغ",'set inline text')
  if text:match("^([Ss][Ee][Tt] [Ii][Nn][Ll][Ii][Nn][Ee] [Tt][Ee][Xx][Tt]) (.*)$") then
  local name_t = {string.match(text, "^([Ss][Ee][Tt] [Ii][Nn][Ll][Ii][Nn][Ee] [Tt][Ee][Xx][Tt]) (.*)$")}
  database:set("channel_ts"..bot_id, name_t[2])
  if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, "> Text is set {"..name_t[2].."}", 1, 'html')
  else
  send(msg.chat_id_, msg.id_, 1, "📡┇متن تبلیغاتی به {"..name_t[2].."} تنظیم شد ", 1, 'html')
  end
  end
  local text = msg.content_.text_:gsub("تنظیم لینک تبلیغاتی",'set inline link')
  if text:match("^([Ss][Ee][Tt] [Ii][Nn][Ll][Ii][Nn][Ee] [Ll][Ii][Nn][Kk]) [Hh][Tt][Tt][Pp](.*)$") then
  local name_t = {string.match(text, "^([Ss][Ee][Tt] [Ii][Nn][Ll][Ii][Nn][Ee] [Ll][Ii][Nn][Kk]) (.*)$")}
  database:set("channel_user_ts"..bot_id, name_t[2])
  if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, "> link is set {"..name_t[2].."}", 1, 'html')
  else
  send(msg.chat_id_, msg.id_, 1, "📡┇لینک تبلیغاتی تنظیم به {"..name_t[2].."} تنظیم شد !", 1, 'html')
  end
  end
  end
  end --sudo

if msg.content_.text_ then
 text = msg.content_.text_
 if tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
if (text == 'اتو اد فعال' or text:match("[Ee][Nn][Aa][Bb][Ll][Ee] [Aa][Dd][Dd] [Aa][Uu][Tt][Oo]")) then
database:set("add"..bot_id, "yes")
if database:get('bot:lang:'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '> Add auto has been enable', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, "✅┇اتو اد فعال شد !", 1, 'html')
end
end
if (text == 'اتو اد غیرفعال !' or text:match("[Dd][Ii][Ss][Aa][Bb][Ll][Ee] [Aa][Dd][Dd] [Aa][Uu][Tt][Oo]")) then
database:del("add"..bot_id)
if database:get('bot:lang:'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '> Add auto has been disable', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, "❎┇اتو اد غیرفعال شد !", 1, 'html')
end
end
local text = msg.content_.text_:gsub("[Ss][Ee][Tt] [Nn][Uu][Mm][Bb][Ee][Rr] [Mm][Ee][Mm][Bb][Ee][Rr][Ss]",'تنظیم تعداد اعضا')
if text:match("^(تنظیم تعداد اعضا) (.*)$") then
local SASIj = {string.match(text, "^(تنظیم تعداد اعضا) (.*)$")}
database:set("ts_a"..bot_id,SASIj[2])
if database:get('bot:lang:'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '> set : '..SASIj[2], 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, "🔘┇ تنظیم شد : "..SASIj[2], 1, 'html')
end
end
end
if (text == "add" or text == 'نصب ربات') then
local SASANZARE = database:get("add"..bot_id)
if SASANZARE then
local SASAN = "https://api.telegram.org/bot" ..token.. '/getChatMember?chat_id=' .. msg.chat_id_ .. '&user_id='..msg.sender_user_id_
local stats = https.request(SASAN)
local data = json:decode(stats)
if (data.result and data.result.can_promote_members or data.result.status == 'creator') then
    local SASAN = "https://api.telegram.org/bot" ..token.. '/getChatMembersCount?chat_id=' .. msg.chat_id_
    local stats = https.request(SASAN)
    local data2 = json:decode(stats)
    local SASIn = database:get("ts_a"..bot_id) or 1000
    if (data2.result and (tonumber(data2.result) == tonumber(SASIn) or tonumber(data2.result) > tonumber(SASIn))) then
    local txt = {string.match(text, "^([Aa][Dd][Dd])$")}
    if database:get("bot:charge:"..msg.chat_id_) then
    if database:get('bot:lang:'..msg.chat_id_) then
    send(msg.chat_id_, msg.id_, 1, '*Bot is already Added Group*', 1, 'md')
    else
    send(msg.chat_id_, msg.id_, 1, "❕┇در لیست گروه های امن ربات بود !", 1, 'md')
    end
    end
    if not database:get("bot:charge:"..msg.chat_id_) then
    database:set("bot:charge:"..msg.chat_id_,true)
    if database:get('bot:lang:'..msg.chat_id_) then
    send(msg.chat_id_, msg.id_, 1, "*> Your ID :* _"..msg.sender_user_id_.."_\n*> Bot Added To Group*", 1, 'md')
    else
    send(msg.chat_id_, msg.id_, 1, "گروه به لیست گروه های امن ربات افزوده شد !", 1, 'md')
    end
    if database:get('bot:lang:'..msg.chat_id_) then
    send(sudo_add, 0, 1, "*> Your ID :* _"..msg.sender_user_id_.."_\n*> added bot to new group*" , 1, 'md')
    else
    send(sudo_add, 0, 1, "🔘┇گروه جدیدی نصب شد ! \n🎫┇فرد نصب کننده : ~⪼ ("..msg.sender_user_id_..")\n🌐┇اطلاعات گروه : \n\n🎫┇شناسه گروه : ~⪼ ("..msg.chat_id_..")" , 1, 'md')
    end
    if data.result.can_promote_members  then
    database:sadd('bot:owners:'..msg.chat_id_,msg.sender_user_id_)
    end
    database:set("bot:enable:"..msg.chat_id_,true)
    if data.result.status == 'creator' then
    database:sadd('bot:creator:'..msg.chat_id_, msg.sender_user_id_)
    end
    end
    else
   if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, "> A few group can not be add", 1, 'md')
   else
    send(msg.chat_id_, msg.id_, 1, "⚠️┇برخی از گروه ها قادر به نصب شدن نیستند !", 1, 'md')
    end
end
    else
  if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, "> You are not a creator or a manager", 1, 'md')
  else
  send(msg.chat_id_, msg.id_, 1, "⚠️┇شما دسترسی ندارید !", 1, 'md')
  end
end
   end
   end
   if (text == "unadd" or text == 'لغو نصب') then
    local SASANZARE = database:get("add"..bot_id)
    if SASANZARE then
    local SASAN = "https://api.telegram.org/bot" ..token.. '/getChatMember?chat_id=' .. msg.chat_id_ .. '&user_id='..msg.sender_user_id_
    local stats = https.request(SASAN)
    local data = json:decode(stats)
    if (data.result and data.result.status == 'creator') then
        local txt = {string.match(text, "^([Aa][Dd][Dd])$")}
        if not database:get("bot:charge:"..msg.chat_id_) then
        if database:get('bot:lang:'..msg.chat_id_) then
        send(msg.chat_id_, msg.id_, 1, '*Bot is already remove Group*', 1, 'md')
        else
        send(msg.chat_id_, msg.id_, 1, "❕┇گروه در لیست گروه های امن ربات نبود !", 1, 'md')
        end
        end
        if database:get("bot:charge:"..msg.chat_id_) then
        database:set("bot:charge:"..msg.chat_id_,true)
        if database:get('bot:lang:'..msg.chat_id_) then
        send(msg.chat_id_, msg.id_, 1, "*> Your ID :* _"..msg.sender_user_id_.."_\n*> Bot Removed To Group!*", 1, 'md')
        else
        send(msg.chat_id_, msg.id_, 1, "گروه از لیست گروه های امن ربات حذف شد !", 1, 'md')
        end
        if database:get('bot:lang:'..msg.chat_id_) then
        send(sudo_add, 0, 1, "*> Your ID :* _"..msg.sender_user_id_.."_\n*> unadd bot *" , 1, 'md')
        else
        send(sudo_add, 0, 1, "🔘┇گروه لغو نصب شد ! \n🎫┇توسط  ~⪼ ("..msg.sender_user_id_..")\n🌐┇اطلاعات گروه \n\n🎫┇شناسه گروه ~⪼ ("..msg.chat_id_..")" , 1, 'md')
        end
        database:del("bot:enable:"..msg.chat_id_)
        end
        else
  if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, "> You are not a creator or a manager", 1, 'md')
  else
  send(msg.chat_id_, msg.id_, 1, "⚠️┇شما دسترسی کافی ندارید !", 1, 'md')
  end
  end
  end
  end
  end
if data.message_.content_.photo_ then
local SASAN = database:get('bot:setphoto'..msg.chat_id_..':'..msg.sender_user_id_)
if SASAN then
local id_SASI = nil
if data.message_.content_.photo_.sizes_[0] then
id_SASI = data.message_.content_.photo_.sizes_[0].photo_.persistent_id_
end

if data.message_.content_.photo_.sizes_[1] then
id_SASI = data.message_.content_.photo_.sizes_[1].photo_.persistent_id_
end

if data.message_.content_.photo_.sizes_[2] then
id_SASI = data.message_.content_.photo_.sizes_[2].photo_.persistent_id_
end

if data.message_.content_.photo_.sizes_[3] then
id_SASI = data.message_.content_.photo_.sizes_[3].photo_.persistent_id_
end
tdcli.changeChatPhoto(msg.chat_id_, id_SASI)
send(msg.chat_id_, msg.id_, 1, ':|', 1, 'md')
database:del('bot:setphoto'..msg.chat_id_..':'..msg.sender_user_id_)
end
end
local d = data.disable_notification_
local chat = chats[msg.chat_id_]
	-------------------------------------------
	if msg.date_ < (os.time() - 30) then
 return false
end
	-------------------------------------------
-------------------------------------------
if msg and msg.send_state_.ID == "MessageIsSuccessfullySent" then
	  --vardump(msg)
	   function get_mymsg_contact(extra, result, success)
 --vardump(result)
 end
	getMessage(msg.chat_id_, msg.reply_to_message_id_,get_mymsg_contact)
   return false
end
-------------* EXPIRE *-----------------
if not database:get("bot:charge:"..msg.chat_id_) then
if database:get("bot:enable:"..msg.chat_id_) then
for k,v in pairs(sudo_users) do
end
end
end
--------- ANTI FLOOD -------------------
	local hash = 'flood:max:'..msg.chat_id_
if not database:get(hash) then
  floodMax = 10
else
  floodMax = tonumber(database:get(hash))
end

local hash = 'flood:time:'..msg.chat_id_
if not database:get(hash) then
  floodTime = 1
else
  floodTime = tonumber(database:get(hash))
end
if not is_vip(msg.sender_user_id_, msg.chat_id_) then
  local hashse = 'anti-flood:'..msg.chat_id_
  if not database:get(hashse) then
if not is_vip(msg.sender_user_id_, msg.chat_id_) then
local hash = 'flood:'..msg.sender_user_id_..':'..msg.chat_id_..':msg-num'
local msgs = tonumber(database:get(hash) or 0)
if msgs > (floodMax - 1) then
  local user = msg.sender_user_id_
  local chat = msg.chat_id_
  local channel = msg.chat_id_
		 local user_id = msg.sender_user_id_
		 local banned = is_banned(user_id, msg.chat_id_)
   if banned then
		local id = msg.id_
  local msgs = {[0] = id}
 	local chat = msg.chat_id_
 		 del_all_msgs(msg.chat_id_, msg.sender_user_id_)
		else
		 local id = msg.id_
   local msgs = {[0] = id}
   local chat = msg.chat_id_
		chat_kick(msg.chat_id_, msg.sender_user_id_)
		 del_all_msgs(msg.chat_id_, msg.sender_user_id_)
		user_id = msg.sender_user_id_
		local bhash =  'bot:banned:'..msg.chat_id_
  database:sadd(bhash, user_id)
send(msg.chat_id_, msg.id_, 1, '🎫┇کاربر ~⪼ *('..msg.sender_user_id_..')* \n❕┇این کار خلاف مقررات ثبت شده است لطفا از ارسال مجدد آن خود داری کنید !\n', 1, 'md')
	  end
end
database:setex(hash, floodTime, msgs+1)
end
  end
	end

	local hash = 'flood:max:warn'..msg.chat_id_
if not database:get(hash) then
  floodMax = 10
else
  floodMax = tonumber(database:get(hash))
end

local hash = 'flood:time:'..msg.chat_id_
if not database:get(hash) then
  floodTime = 1
else
  floodTime = tonumber(database:get(hash))
end
if not is_vip(msg.sender_user_id_, msg.chat_id_) then
  local hashse = 'anti-flood:warn'..msg.chat_id_
  if not database:get(hashse) then
if not is_vip(msg.sender_user_id_, msg.chat_id_) then
local hash = 'flood:'..msg.sender_user_id_..':'..msg.chat_id_..':msg-num'
local msgs = tonumber(database:get(hash) or 0)
if msgs > (floodMax - 1) then
  local user = msg.sender_user_id_
  local chat = msg.chat_id_
  local channel = msg.chat_id_
		 local user_id = msg.sender_user_id_
		 local banned = is_banned(user_id, msg.chat_id_)
   if banned then
		local id = msg.id_
  local msgs = {[0] = id}
 	local chat = msg.chat_id_
 		 del_all_msgs(msg.chat_id_, msg.sender_user_id_)
		else
		 local id = msg.id_
   local msgs = {[0] = id}
   local chat = msg.chat_id_
		 del_all_msgs(msg.chat_id_, msg.sender_user_id_)
		user_id = msg.sender_user_id_
		local bhash =  'bot:muted:'..msg.chat_id_
  database:sadd(bhash, user_id)
send(msg.chat_id_, msg.id_, 1, '🎫┇کاربر ~⪼ *('..msg.sender_user_id_..')* \n❕┇این کار خلاف مقررات ثبت شده است لطفا از ارسال مجدد آن خود داری کنید !\n', 1, 'md')
	  end
end
database:setex(hash, floodTime, msgs+1)
end
  end
	end

	local hash = 'flood:max:del'..msg.chat_id_
if not database:get(hash) then
  floodMax = 10
else
  floodMax = tonumber(database:get(hash))
end

local hash = 'flood:time:'..msg.chat_id_
if not database:get(hash) then
  floodTime = 1
else
  floodTime = tonumber(database:get(hash))
end
if not is_vip(msg.sender_user_id_, msg.chat_id_) then
  local hashse = 'anti-flood:del'..msg.chat_id_
  if not database:get(hashse) then
if not is_vip(msg.sender_user_id_, msg.chat_id_) then
local hash = 'flood:'..msg.sender_user_id_..':'..msg.chat_id_..':msg-num'
local msgs = tonumber(database:get(hash) or 0)
if msgs > (floodMax - 1) then
  local user = msg.sender_user_id_
  local chat = msg.chat_id_
  local channel = msg.chat_id_
		 local user_id = msg.sender_user_id_
		 local banned = is_banned(user_id, msg.chat_id_)
   if banned then
		local id = msg.id_
  local msgs = {[0] = id}
 	local chat = msg.chat_id_
 		 del_all_msgs(msg.chat_id_, msg.sender_user_id_)
		else
		 local id = msg.id_
   local msgs = {[0] = id}
   local chat = msg.chat_id_
		 del_all_msgs(msg.chat_id_, msg.sender_user_id_)
		user_id = msg.sender_user_id_
send(msg.chat_id_, msg.id_, 1, '🎫┇کاربر ~⪼ *('..msg.sender_user_id_..')* \n❕┇این کار خلاف مقررات ثبت شده است لطفا از ارسال مجدد آن خود داری کنید !\n', 1, 'md')
	  end
end
database:setex(hash, floodTime, msgs+1)
end
  end
	end
	-------------------------------------------
database:incr("bot:allmsgs")
  if msg.chat_id_ then
  local id = tostring(msg.chat_id_)
  if id:match('-100(%d+)') then
  if not database:sismember("bot:groups",msg.chat_id_) then
  database:sadd("bot:groups",msg.chat_id_)
  end
  elseif id:match('^(%d+)') then
  if not database:sismember("bot:userss",msg.chat_id_) then
  database:sadd("bot:userss"..bot_id,msg.chat_id_)
  end
  else
  if not database:sismember("bot:groups",msg.chat_id_) then
  database:sadd("bot:groups",msg.chat_id_)
  end
 end
end
	-------------------------------------------
-------------* MSG TYPES *-----------------
   if msg.content_ then
   	if msg.reply_markup_ and  msg.reply_markup_.ID == "ReplyMarkupInlineKeyboard" then
		print("Send INLINE KEYBOARD")
	msg_type = 'MSG:Inline'
	-------------------------
elseif msg.content_.ID == "MessageText" then
	text = msg.content_.text_
		print("SEND TEXT")
	msg_type = 'MSG:Text'
	-------------------------
	elseif msg.content_.ID == "MessagePhoto" then
	print("SEND PHOTO")
	if msg.content_.caption_ then
	caption_text = msg.content_.caption_
	end
	msg_type = 'MSG:Photo'
	-------------------------
	elseif msg.content_.ID == "MessageChatAddMembers" then
	print("NEW ADD TO GROUP")
	msg_type = 'MSG:NewUseSASId'
	-------------------------
	elseif msg.content_.ID == "MessageChatJoinByLink" then
		print("JOIN TO GROUP")
	msg_type = 'MSG:NewUserLink'
	-------------------------
	elseif msg.content_.ID == "MessageSticker" then
		print("SEND STICKER")
	msg_type = 'MSG:Sticker'
	-------------------------
	elseif msg.content_.ID == "MessageAudio" then
		print("SEND MUSIC")
	if msg.content_.caption_ then
	caption_text = msg.content_.caption_
	end
	msg_type = 'MSG:Audio'
	-------------------------
	elseif msg.content_.ID == "MessageVoice" then
		print("SEND VOICE")
	if msg.content_.caption_ then
	caption_text = msg.content_.caption_
	end
	msg_type = 'MSG:Voice'
	-------------------------
	elseif msg.content_.ID == "MessageVideo" then
		print("SEND VIDEO")
	if msg.content_.caption_ then
	caption_text = msg.content_.caption_
	end
	msg_type = 'MSG:Video'
	-------------------------
	elseif msg.content_.ID == "MessageAnimation" then
		print("SEND GIF")
	if msg.content_.caption_ then
	caption_text = msg.content_.caption_
	end
	msg_type = 'MSG:Gif'
	-------------------------
	elseif msg.content_.ID == "MessageLocation" then
		print("SEND LOCATION")
	if msg.content_.caption_ then
	caption_text = msg.content_.caption_
	end
	msg_type = 'MSG:Location'
	-------------------------
	elseif msg.content_.ID == "MessageChatJoinByLink" or msg.content_.ID == "MessageChatAddMembers" then
	msg_type = 'MSG:NewUser'
	-------------------------
	elseif msg.content_.ID == "MessageContact" then
		print("SEND CONTACT")
	if msg.content_.caption_ then
	caption_text = msg.content_.caption_
	end
	msg_type = 'MSG:Contact'
	-------------------------
	end
   end
-------------------------------------------
-------------------------------------------
if ((not d) and chat) then
if msg.content_.ID == "MessageText" then
  do_notify (chat.title_, msg.content_.text_)
else
  do_notify (chat.title_, msg.content_.ID)
end
end
  -----------------------------------------------------------------------------------------------
-- end functions --
  -----------------------------------------------------------------------------------------------
  -----------------------------------------------------------------------------------------------
  -----------------------------------------------------------------------------------------------
  -----------------------------------------------------------------------------------------------
-- start code --
  -----------------------------------------------------------------------------------------------
  -------------------------------------- Process mod --------------------------------------------
  -----------------------------------------------------------------------------------------------

  -------------------------------------------------------------------------------------------------------
  -------------------------------------------------------------------------------------------------------
  --------------------------******** START MSG CHECKS ********-------------------------------------------
  -------------------------------------------------------------------------------------------------------
  -------------------------------------------------------------------------------------------------------
if is_banned(msg.sender_user_id_, msg.chat_id_) then
  local id = msg.id_
  local msgs = {[0] = id}
  local chat = msg.chat_id_
		  chat_kick(msg.chat_id_, msg.sender_user_id_)
delete_msg(chat,msgs)
		  return
end

if is_gbanned(msg.sender_user_id_, msg.chat_id_) then
  local id = msg.id_
  local msgs = {[0] = id}
  local chat = msg.chat_id_
		  chat_kick(msg.chat_id_, msg.sender_user_id_)
delete_msg(chat,msgs)
		  return
end

if is_gmuted(msg.sender_user_id_, msg.chat_id_) then
  local id = msg.id_
  local msgs = {[0] = id}
  local chat = msg.chat_id_
delete_msg(chat,msgs)
		  return
end


if is_muted(msg.sender_user_id_, msg.chat_id_) then
  local id = msg.id_
  local msgs = {[0] = id}
  local chat = msg.chat_id_
  local user_id = msg.sender_user_id_
delete_msg(chat,msgs)
		  return
end
if database:get('bot:muteall'..msg.chat_id_) and not is_vip(msg.sender_user_id_, msg.chat_id_) then
  local id = msg.id_
  local msgs = {[0] = id}
  local chat = msg.chat_id_
  delete_msg(chat,msgs)
  return
end

if database:get('bot:muteallwarn'..msg.chat_id_) and not is_vip(msg.sender_user_id_, msg.chat_id_) then
  local id = msg.id_
  local msgs = {[0] = id}
  local chat = msg.chat_id_
  delete_msg(chat,msgs)
send(msg.chat_id_, 0, 1, "🎫┇کاربر ~⪼ *('..msg.sender_user_id_..')* \n❕┇این کار خلاف مقررات ثبت شده است لطفا از ارسال مجدد آن خود داری کنید !\n", 1, 'html')
  return
end

if database:get('bot:muteallban'..msg.chat_id_) and not is_vip(msg.sender_user_id_, msg.chat_id_) then
  local id = msg.id_
  local msgs = {[0] = id}
  local chat = msg.chat_id_
  delete_msg(chat,msgs)
 chat_kick(msg.chat_id_, msg.sender_user_id_)
send(msg.chat_id_, 0, 1, "🎫┇کاربر ~⪼ *('..msg.sender_user_id_..')* \n❕┇این کار خلاف مقررات ثبت شده است لطفا از ارسال مجدد آن خود داری کنید !\n", 1, 'html')
  return
end
database:incr('user:msgs'..msg.chat_id_..':'..msg.sender_user_id_)
	database:incr('group:msgs'..msg.chat_id_)
if msg.content_.ID == "MessagePinMessage" then
  if database:get('pinnedmsg'..msg.chat_id_) and database:get('bot:pin:mute'..msg.chat_id_) then
   unpinmsg(msg.chat_id_)
   local pin_id = database:get('pinnedmsg'..msg.chat_id_)
   pin(msg.chat_id_,pin_id,0)
   end
end
database:incr('user:msgs'..msg.chat_id_..':'..msg.sender_user_id_)
	database:incr('group:msgs'..msg.chat_id_)
if msg.content_.ID == "MessagePinMessage" then
  if database:get('pinnedmsg'..msg.chat_id_) and database:get('bot:pin:warn'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, "🎫┇کاربر ~⪼ *('..msg.sender_user_id_..')* \n❕┇این کار خلاف مقررات ثبت شده است لطفا از ارسال مجدد آن خود داری کنید !\n", 1, 'md')
   unpinmsg(msg.chat_id_)
   local pin_id = database:get('pinnedmsg'..msg.chat_id_)
   pin(msg.chat_id_,pin_id,0)
   end
end
if database:get('bot:viewget'..msg.sender_user_id_) then
if not msg.forward_info_ then
		send(msg.chat_id_, msg.id_, 1, 'لظفا پستی را از کانال ارسال کنید !\n', 1, 'md')
		database:del('bot:viewget'..msg.sender_user_id_)
	else
		send(msg.chat_id_, msg.id_, 1, '📊 تعداد بازدید های پست شما : <b>('..msg.views_..')</b> ', 1, 'html')
  database:del('bot:viewget'..msg.sender_user_id_)
	end
end
if msg_type == 'MSG:Photo' then
 if not is_vip(msg.sender_user_id_, msg.chat_id_) then
     if database:get('bot:photo:mute'..msg.chat_id_) then
    local id = msg.id_
    local msgs = {[0] = id}
    local chat = msg.chat_id_
       delete_msg(chat,msgs)
          return
   end
        if msg.content_.caption_ then
          check_filter_words(msg, msg.content_.caption_)
          if database:get('bot:links:mute'..msg.chat_id_) then
	if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Ss][Cc][Oo].[Pp][Ee]") or msg.content_.caption_:match("@") or msg.content_.caption_:match("#") then
              local id = msg.id_
              local msgs = {[0] = id}
              local chat = msg.chat_id_
              delete_msg(chat,msgs)
            end
        end
        end
        if msg.forward_info_ then
          if database:get('bot:forward:mute'..msg.chat_id_) then
            if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
              local id = msg.id_
              local msgs = {[0] = id}
              local chat = msg.chat_id_
              delete_msg(chat,msgs)
            end
          end
      end
       if database:get('bot:photo:ban'..msg.chat_id_) then
           local id = msg.id_
           local msgs = {[0] = id}
           local chat = msg.chat_id_
           local user_id = msg.sender_user_id_
              delete_msg(chat,msgs)
       		   chat_kick(msg.chat_id_, msg.sender_user_id_)
                

                 return
          end
               if database:get('bot:photo:warn'..msg.chat_id_) then
                   local id = msg.id_
                   local msgs = {[0] = id}
                   local chat = msg.chat_id_
                   local user_id = msg.sender_user_id_
                      delete_msg(chat,msgs)
                          
                         return
           end
end
   elseif msg.content_.ID == 'MessageDocument' then
   if not is_vip(msg.sender_user_id_, msg.chat_id_) then
    if database:get('bot:document:mute'..msg.chat_id_) then
    local id = msg.id_
    local msgs = {[0] = id}
    local chat = msg.chat_id_
       delete_msg(chat,msgs)
          return
   end
        if msg.content_.caption_ then
          check_filter_words(msg, msg.content_.caption_)
          if database:get('bot:links:mute'..msg.chat_id_) then
	if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Ss][Cc][Oo].[Pp][Ee]") or msg.content_.caption_:match("@") or msg.content_.caption_:match("#") then
              local id = msg.id_
              local msgs = {[0] = id}
              local chat = msg.chat_id_
              delete_msg(chat,msgs)
            end
        end
        end
        if msg.forward_info_ then
          if database:get('bot:forward:mute'..msg.chat_id_) then
            if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
              local id = msg.id_
              local msgs = {[0] = id}
              local chat = msg.chat_id_
              delete_msg(chat,msgs)
            end
          end
      end
        if database:get('bot:document:ban'..msg.chat_id_) then
    local id = msg.id_
    local msgs = {[0] = id}
    local chat = msg.chat_id_
    local user_id = msg.sender_user_id_
       delete_msg(chat,msgs)
       chat_kick(msg.chat_id_, msg.sender_user_id_)
   
          return
   end

        if database:get('bot:document:warn'..msg.chat_id_) then
    local id = msg.id_
    local msgs = {[0] = id}
    local chat = msg.chat_id_
    local user_id = msg.sender_user_id_
       delete_msg(chat,msgs)
          send(msg.chat_id_, 0, 1, "🎫┇کاربر ~⪼ ("..msg.sender_user_id_..")\n❕┇ ارسال هرگونه فایل خلاف قوانین ثبت شده میباشد !", 1, 'html')
          return
   end
   end
elseif msg.content_.ID == 'MessageUnsupported' then
      if not is_vip(msg.sender_user_id_, msg.chat_id_) then
       if database:get('bot:note:mute'..msg.chat_id_) then
       local id = msg.id_
       local msgs = {[0] = id}
       local chat = msg.chat_id_
          delete_msg(chat,msgs)
             return
      end
        if msg.content_.caption_ then
          check_filter_words(msg, msg.content_.caption_)
          if database:get('bot:links:mute'..msg.chat_id_) then
	if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Ss][Cc][Oo].[Pp][Ee]") or msg.content_.caption_:match("@") or msg.content_.caption_:match("#") then
              local id = msg.id_
              local msgs = {[0] = id}
              local chat = msg.chat_id_
              delete_msg(chat,msgs)
            end
        end
        end
           if msg.forward_info_ then
             if database:get('bot:forward:mute'..msg.chat_id_) then
               if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
                 local id = msg.id_
                 local msgs = {[0] = id}
                 local chat = msg.chat_id_
                 delete_msg(chat,msgs)
               end
             end
         end
           if database:get('bot:note:ban'..msg.chat_id_) then
       local id = msg.id_
       local msgs = {[0] = id}
       local chat = msg.chat_id_
       local user_id = msg.sender_user_id_
          delete_msg(chat,msgs)
          chat_kick(msg.chat_id_, msg.sender_user_id_)
        
             return
      end

           if database:get('bot:note:warn'..msg.chat_id_) then
       local id = msg.id_
       local msgs = {[0] = id}
       local chat = msg.chat_id_
       local user_id = msg.sender_user_id_
          delete_msg(chat,msgs)
             send(msg.chat_id_, 0, 1, "🎫┇کاربر ~⪼ ("..msg.sender_user_id_..")\n❕┇ ارسال فیلم خلاف قوانین ثبت شده است لطفا از ارسال ان خودداری کنید !", 1, 'html')
             return
      end
      end
  elseif msg_type == 'MSG:Inline' then
   if not is_vip(msg.sender_user_id_, msg.chat_id_) then
    if database:get('bot:inline:mute'..msg.chat_id_) then
    local id = msg.id_
    local msgs = {[0] = id}
    local chat = msg.chat_id_
       delete_msg(chat,msgs)
          return
   end
        if msg.forward_info_ then
          if database:get('bot:forward:mute'..msg.chat_id_) then
            if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
              local id = msg.id_
              local msgs = {[0] = id}
              local chat = msg.chat_id_
              delete_msg(chat,msgs)
            end
          end
        end
        if database:get('bot:inline:ban'..msg.chat_id_) then
    local id = msg.id_
    local msgs = {[0] = id}
    local chat = msg.chat_id_
    local user_id = msg.sender_user_id_
       delete_msg(chat,msgs)
       chat_kick(msg.chat_id_, msg.sender_user_id_)
   
          return
   end

        if database:get('bot:inline:warn'..msg.chat_id_) then
    local id = msg.id_
    local msgs = {[0] = id}
    local chat = msg.chat_id_
    local user_id = msg.sender_user_id_
       delete_msg(chat,msgs)
          send(msg.chat_id_, 0, 1, "🎫┇کاربر ~⪼ ("..msg.sender_user_id_..")\n❕┇ ارسال دکمه شیشه ای خلاف قوانین ثبت شده میباشد ! لطف از ارسال آن خودداری کنید !", 1, 'html')
          return
   end
   end
  elseif msg_type == 'MSG:Sticker' then
   if not is_vip(msg.sender_user_id_, msg.chat_id_) then
  if database:get('bot:sticker:mute'..msg.chat_id_) then
    local id = msg.id_
    local msgs = {[0] = id}
    local chat = msg.chat_id_
       delete_msg(chat,msgs)
          return
   end
        if msg.forward_info_ then
          if database:get('bot:forward:mute'..msg.chat_id_) then
            if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
              local id = msg.id_
              local msgs = {[0] = id}
              local chat = msg.chat_id_
              delete_msg(chat,msgs)
            end
          end
        end
        if database:get('bot:sticker:ban'..msg.chat_id_) then
    local id = msg.id_
    local msgs = {[0] = id}
    local chat = msg.chat_id_
    local user_id = msg.sender_user_id_
       delete_msg(chat,msgs)
       chat_kick(msg.chat_id_, msg.sender_user_id_)
     
          return
   end

        if database:get('bot:sticker:warn'..msg.chat_id_) then
    local id = msg.id_
    local msgs = {[0] = id}
    local chat = msg.chat_id_
    local user_id = msg.sender_user_id_
       delete_msg(chat,msgs)
    send(msg.chat_id_, 0, 1, "🎫┇کاربر ~⪼ ("..msg.sender_user_id_..")\n❕┇ ارسال استیکر خلاف قوانین ثبت شده میباشد لطفا از ارسال آن خودداری کنید !", 1, 'html')
          return
   end
   end
elseif msg_type == 'MSG:NewUserLink' then
  if database:get('bot:tgservice:mute'..msg.chat_id_) then
    local id = msg.id_
    local msgs = {[0] = id}
    local chat = msg.chat_id_
       delete_msg(chat,msgs)
          return
   end
   function get_welcome(extra,result,success)
    if database:get('welcome:'..msg.chat_id_) then
        text = database:get('welcome:'..msg.chat_id_)
    else
        text = 'Hi {firstname} 😃'
    end
    local text = text:gsub('{firstname}',(result.first_name_ or ''))
    local text = text:gsub('{lastname}',(result.last_name_ or ''))
    local text = text:gsub('{username}',(result.username_ or ''))
         send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
   end
	  if database:get("bot:welcome"..msg.chat_id_) then
        getUser(msg.sender_user_id_,get_welcome)
      end
elseif msg_type == 'MSG:NewUseSASId' then
if msg.content_.ID == "MessageChatAddMembers" then
            if msg.content_.members_[0].type_.ID == 'UserTypeBot' then
      if database:get('bot:bots:mute'..msg.chat_id_) and not is_mod(msg.content_.members_[0].id_, msg.chat_id_) then
chat_kick(msg.chat_id_,msg.content_.members_[0].id_)
     return false
    end
 end
 end
   if is_banned(msg.content_.members_[0].id_, msg.chat_id_) then
		 chat_kick(msg.chat_id_, msg.content_.members_[0].id_)
		 return false
   end

       if msg.content_.ID == "MessageChatAddMembers" then
            if msg.content_.members_[0].type_.ID == 'UserTypeBot' then
      if database:get('bot:bots:ban'..msg.chat_id_) and not is_mod(msg.content_.members_[0].id_, msg.chat_id_) then
		 chat_kick(msg.chat_id_, msg.content_.members_[0].id_)
		 chat_kick(msg.chat_id_, msg.sender_user_id_)
         send(msg.chat_id_, msg.id_, 1, "☑┇ربات و فرد اضافه کننده اخراج شدند !", 1, 'html')
     return false
    end
 end
 end
   if is_banned(msg.content_.members_[0].id_, msg.chat_id_) then
		 chat_kick(msg.chat_id_, msg.content_.members_[0].id_)
		 return false
   end
  if database:get('bot:tgservice:mute'..msg.chat_id_) then
    local id = msg.id_
    local msgs = {[0] = id}
    local chat = msg.chat_id_
       delete_msg(chat,msgs)
          return
   end

elseif msg_type == 'MSG:Contact' then
 if not is_vip(msg.sender_user_id_, msg.chat_id_) then
  if database:get('bot:contact:mute'..msg.chat_id_) then
    local id = msg.id_
    local msgs = {[0] = id}
    local chat = msg.chat_id_
       delete_msg(chat,msgs)
          return
   end
        if msg.forward_info_ then
          if database:get('bot:forward:mute'..msg.chat_id_) then
            if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
              local id = msg.id_
              local msgs = {[0] = id}
              local chat = msg.chat_id_
              delete_msg(chat,msgs)
            end
          end
        end
        if database:get('bot:contact:ban'..msg.chat_id_) then
    local id = msg.id_
    local msgs = {[0] = id}
    local chat = msg.chat_id_
    local user_id = msg.sender_user_id_
       delete_msg(chat,msgs)
       chat_kick(msg.chat_id_, msg.sender_user_id_)
     
          return
   end

        if database:get('bot:contact:warn'..msg.chat_id_) then
    local id = msg.id_
    local msgs = {[0] = id}
    local chat = msg.chat_id_
    local user_id = msg.sender_user_id_
       delete_msg(chat,msgs)
        send(msg.chat_id_, 0, 1, "🎫┇الايدي ~⪼ ("..msg.sender_user_id_..")\n❕┇ ارسال مخاطب خلاف قوانین ثبت شده ربات میباشد ! لطفا از ارسال مجدد آن خودداری کنید !", 1, 'html')
          return
   end
   end
elseif msg_type == 'MSG:Audio' then
 if not is_vip(msg.sender_user_id_, msg.chat_id_) then
  if database:get('bot:music:mute'..msg.chat_id_) then
    local id = msg.id_
    local msgs = {[0] = id}
    local chat = msg.chat_id_
       delete_msg(chat,msgs)
          return
   end
        if msg.content_.caption_ then
          check_filter_words(msg, msg.content_.caption_)
          if database:get('bot:links:mute'..msg.chat_id_) then
	if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Ss][Cc][Oo].[Pp][Ee]") or msg.content_.caption_:match("@") or msg.content_.caption_:match("#") then
              local id = msg.id_
              local msgs = {[0] = id}
              local chat = msg.chat_id_
              delete_msg(chat,msgs)
            end
        end
        end
        if msg.forward_info_ then
          if database:get('bot:forward:mute'..msg.chat_id_) then
            if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
              local id = msg.id_
              local msgs = {[0] = id}
              local chat = msg.chat_id_
              delete_msg(chat,msgs)
            end
          end
        end
        if database:get('bot:music:ban'..msg.chat_id_) then
    local id = msg.id_
    local msgs = {[0] = id}
    local chat = msg.chat_id_
    local user_id = msg.sender_user_id_
       delete_msg(chat,msgs)
       chat_kick(msg.chat_id_, msg.sender_user_id_)
         
          return
   end

        if database:get('bot:music:warn'..msg.chat_id_) then
    local id = msg.id_
    local msgs = {[0] = id}
    local chat = msg.chat_id_
    local user_id = msg.sender_user_id_
       delete_msg(chat,msgs)
          send(msg.chat_id_, 0, 1, "🎫┇کاربر ~⪼ ("..msg.sender_user_id_..")\n❕┇ ارسال آ]نگ خلاف قوانین ثبت شده ربات میباشد لطفا از ارسال مجدد آن خودداری کنید !", 1, 'html')
          return
   end
   end
elseif msg_type == 'MSG:Voice' then
 if not is_vip(msg.sender_user_id_, msg.chat_id_) then
  if database:get('bot:voice:mute'..msg.chat_id_) then
    local id = msg.id_
    local msgs = {[0] = id}
    local chat = msg.chat_id_
       delete_msg(chat,msgs)
          return
   end
        if msg.content_.caption_ then
          check_filter_words(msg, msg.content_.caption_)
          if database:get('bot:links:mute'..msg.chat_id_) then
	if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Ss][Cc][Oo].[Pp][Ee]") or msg.content_.caption_:match("@") or msg.content_.caption_:match("#") then
              local id = msg.id_
              local msgs = {[0] = id}
              local chat = msg.chat_id_
              delete_msg(chat,msgs)
            end
        end
        end
        if msg.forward_info_ then
          if database:get('bot:forward:mute'..msg.chat_id_) then
            if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
              local id = msg.id_
              local msgs = {[0] = id}
              local chat = msg.chat_id_
              delete_msg(chat,msgs)
            end
          end
        end
        if database:get('bot:voice:ban'..msg.chat_id_) then
    local id = msg.id_
    local msgs = {[0] = id}
    local chat = msg.chat_id_
    local user_id = msg.sender_user_id_
       delete_msg(chat,msgs)
       chat_kick(msg.chat_id_, msg.sender_user_id_)
         
          return
   end

        if database:get('bot:voice:warn'..msg.chat_id_) then
    local id = msg.id_
    local msgs = {[0] = id}
    local chat = msg.chat_id_
    local user_id = msg.sender_user_id_
       delete_msg(chat,msgs)
         send(msg.chat_id_, 0, 1, "🎫┇کاربر ~⪼ ("..msg.sender_user_id_..")\n❕┇ ارسال ویس خلاف قوانین ثبت شده میباشد لطفا از ارسال مجدد آن خودداری کنید !", 1, 'html')
          return
   end
   end
elseif msg_type == 'MSG:Location' then
 if not is_vip(msg.sender_user_id_, msg.chat_id_) then
  if database:get('bot:location:mute'..msg.chat_id_) then
    local id = msg.id_
    local msgs = {[0] = id}
    local chat = msg.chat_id_
       delete_msg(chat,msgs)
          return
   end
        if msg.forward_info_ then
          if database:get('bot:forward:mute'..msg.chat_id_) then
            if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
              local id = msg.id_
              local msgs = {[0] = id}
              local chat = msg.chat_id_
              delete_msg(chat,msgs)
            end
          end
        end
        if database:get('bot:location:ban'..msg.chat_id_) then
    local id = msg.id_
    local msgs = {[0] = id}
    local chat = msg.chat_id_
    local user_id = msg.sender_user_id_
       delete_msg(chat,msgs)
       chat_kick(msg.chat_id_, msg.sender_user_id_)
      
          return
   end

        if database:get('bot:location:warn'..msg.chat_id_) then
    local id = msg.id_
    local msgs = {[0] = id}
    local chat = msg.chat_id_
    local user_id = msg.sender_user_id_
       delete_msg(chat,msgs)
          send(msg.chat_id_, 0, 1, "🎫┇کاربر ~⪼ ("..msg.sender_user_id_..")\n❕┇ ارسال موقعیت مکانی خلاف قوانین ثبت شده میباشد لطفا از ارسال مجدد آن خودداری کنید !", 1, 'html')
          return
   end
   end
elseif msg_type == 'MSG:Video' then
 if not is_vip(msg.sender_user_id_, msg.chat_id_) then
  if database:get('bot:video:mute'..msg.chat_id_) then
    local id = msg.id_
    local msgs = {[0] = id}
    local chat = msg.chat_id_
       delete_msg(chat,msgs)
          return
   end
        if msg.content_.caption_ then
          check_filter_words(msg, msg.content_.caption_)
          if database:get('bot:links:mute'..msg.chat_id_) then
	if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Ss][Cc][Oo].[Pp][Ee]") or msg.content_.caption_:match("@") or msg.content_.caption_:match("#") then
              local id = msg.id_
              local msgs = {[0] = id}
              local chat = msg.chat_id_
              delete_msg(chat,msgs)
            end
        end
        end
        if msg.forward_info_ then
          if database:get('bot:forward:mute'..msg.chat_id_) then
            if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
              local id = msg.id_
              local msgs = {[0] = id}
              local chat = msg.chat_id_
              delete_msg(chat,msgs)
            end
          end
        end
        if database:get('bot:video:ban'..msg.chat_id_) then
    local id = msg.id_
    local msgs = {[0] = id}
    local chat = msg.chat_id_
    local user_id = msg.sender_user_id_
       delete_msg(chat,msgs)
       chat_kick(msg.chat_id_, msg.sender_user_id_)
 
          return
   end

        if database:get('bot:video:warn'..msg.chat_id_) then
    local id = msg.id_
    local msgs = {[0] = id}
    local chat = msg.chat_id_
    local user_id = msg.sender_user_id_
       delete_msg(chat,msgs)
          send(msg.chat_id_, 0, 1, "🎫┇کاربر ~⪼ ("..msg.sender_user_id_..")\n❕┇ ارسال فیلم خلاف قوانین ثبت شده میباشد لطفا از ارسال مجدد آن خودداری کنید !", 1, 'html')
          return
   end
   end
elseif msg_type == 'MSG:Gif' then
 if not is_vip(msg.sender_user_id_, msg.chat_id_) then
  if database:get('bot:gifs:mute'..msg.chat_id_) and not is_vip(msg.sender_user_id_, msg.chat_id_) then
    local id = msg.id_
    local msgs = {[0] = id}
    local chat = msg.chat_id_
       delete_msg(chat,msgs)
          return
   end
        if msg.content_.caption_ then
          check_filter_words(msg, msg.content_.caption_)
          if database:get('bot:links:mute'..msg.chat_id_) then
	if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Ss][Cc][Oo].[Pp][Ee]") or msg.content_.caption_:match("@") or msg.content_.caption_:match("#") then
              local id = msg.id_
              local msgs = {[0] = id}
              local chat = msg.chat_id_
              delete_msg(chat,msgs)
            end
        end
        end
        if msg.forward_info_ then
          if database:get('bot:forward:mute'..msg.chat_id_) then
            if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
              local id = msg.id_
              local msgs = {[0] = id}
              local chat = msg.chat_id_
              delete_msg(chat,msgs)
            end
          end
        end
        if database:get('bot:gifs:ban'..msg.chat_id_) then
    local id = msg.id_
    local msgs = {[0] = id}
    local chat = msg.chat_id_
    local user_id = msg.sender_user_id_
       delete_msg(chat,msgs)
       chat_kick(msg.chat_id_, msg.sender_user_id_)
 
          return
   end

        if database:get('bot:gifs:warn'..msg.chat_id_) then
    local id = msg.id_
    local msgs = {[0] = id}
    local chat = msg.chat_id_
    local user_id = msg.sender_user_id_
       delete_msg(chat,msgs)
          send(msg.chat_id_, 0, 1, "🎫┇کاربر ~⪼ ("..msg.sender_user_id_..")\n❕┇ ارسال گیف خلاف قوانین ثبت شده میباشد لطفا از ارسال مجدد آن خودداری کنید !", 1, 'html')
          return
   end
   end
elseif msg_type == 'MSG:Text' then
if database:get("bot:group:link"..msg.chat_id_) == 'Waiting For Link!\nPls Send Group Link' and is_mod(msg.sender_user_id_, msg.chat_id_) then if text:match("(https://telegram.me/joinchat/%S+)") or text:match("(https://t.me/joinchat/%S+)") then 	 local glink = text:match("(https://telegram.me/joinchat/%S+)") or text:match("(https://t.me/joinchat/%S+)") local hash = "bot:group:link"..msg.chat_id_ database:set(hash,glink) 			 send(msg.chat_id_, msg.id_, 1, '☑┇تنظیم شد !', 1, 'md') send(msg.chat_id_, 0, 1, '↙️┇لیتک جدید :\n'..glink, 1, 'html')
end
   end
function check_username(extra,result,success)
	local username = (result.username_ or '')
	local svuser = 'user:'..result.id_
	if username then
database:hset(svuser, 'username', username)
end
	if username and username:match("[Bb][Oo][Tt]$") then
if database:get('bot:bots:mute'..msg.chat_id_) and not is_mod(result.id_, msg.chat_id_) then
		 return false
		 end
	  end
   end
getUser(msg.sender_user_id_,check_username)
if not is_vip(msg.sender_user_id_, msg.chat_id_) then
check_filter_words(msg, text)
if text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or
text:match("[Tt].[Mm][Ee]") or
text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or
text:match("[Tt][Ee][Ll][Ee][Ss][Cc][Oo].[Pp][Ee]") then
if database:get('bot:links:mute'..msg.chat_id_) then
local id = msg.id_
  local msgs = {[0] = id}
  local chat = msg.chat_id_
  delete_msg(chat,msgs)
	end

  if msg.forward_info_ then
if database:get('bot:forward:mute'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
  local id = msg.id_
  local msgs = {[0] = id}
  local chat = msg.chat_id_
  delete_msg(chat,msgs)
end
end
  end
 if database:get('bot:links:ban'..msg.chat_id_) then
local id = msg.id_
  local msgs = {[0] = id}
  local chat = msg.chat_id_
  local user_id = msg.sender_user_id_
  delete_msg(chat,msgs)
chat_kick(msg.chat_id_, msg.sender_user_id_)

  end
 if database:get('bot:links:warn'..msg.chat_id_) then
local id = msg.id_
  local msgs = {[0] = id}
  local chat = msg.chat_id_
  local user_id = msg.sender_user_id_
  delete_msg(chat,msgs)
send(msg.chat_id_, 0, 1, "🎫┇کاربر ~⪼ ("..msg.sender_user_id_..")\n❕┇ ارسال لینک خلاف قوانین ثبت شده میباشد لطفا از ارسال مجدد آن خودداری کنید !", 1, 'html')
	end
 end

if text then
  local _nl, ctrl_chars = string.gsub(text, '%c', '')
  local _nl, real_digits = string.gsub(text, '%d', '')
  local id = msg.id_
  local msgs = {[0] = id}
  local chat = msg.chat_id_
  local hash = 'bot:sens:spam'..msg.chat_id_
  if not database:get(hash) then
sens = 500
  else
sens = tonumber(database:get(hash))
  end
  if database:get('bot:spam:mute'..msg.chat_id_) and string.len(text) > (sens) or ctrl_chars > (sens) or real_digits > (sens) then
delete_msg(chat,msgs)
  end
end

if text then
  local _nl, ctrl_chars = string.gsub(text, '%c', '')
  local _nl, real_digits = string.gsub(text, '%d', '')
  local id = msg.id_
  local msgs = {[0] = id}
  local chat = msg.chat_id_
  local hash = 'bot:sens:spam:warn'..msg.chat_id_
  if not database:get(hash) then
sens = 500
  else
sens = tonumber(database:get(hash))
  end
  if database:get('bot:spam:warn'..msg.chat_id_) and string.len(text) > (sens) or ctrl_chars > (sens) or real_digits > (sens) then
delete_msg(chat,msgs)
  send(msg.chat_id_, 0, 1, "🎫┇کاربر ~⪼ ("..msg.sender_user_id_..")\n❕┇اسپم کردن خالف قوانین ثبت شده میباشد لطفا از ارسال مجدد آن خودداری فرمایید !", 1, 'html')
  end
end

	if text then
if database:get('bot:text:mute'..msg.chat_id_) then
local id = msg.id_
  local msgs = {[0] = id}
  local chat = msg.chat_id_
  delete_msg(chat,msgs)
 end

  if msg.forward_info_ then
if database:get('bot:forward:mute'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
  local id = msg.id_
  local msgs = {[0] = id}
  local chat = msg.chat_id_
  delete_msg(chat,msgs)
end
end
  end
  if database:get('bot:text:ban'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
local user_id = msg.sender_user_id_
 delete_msg(chat,msgs)
 chat_kick(msg.chat_id_, msg.sender_user_id_)

return
   end

  if database:get('bot:text:warn'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
local user_id = msg.sender_user_id_
 delete_msg(chat,msgs)
send(msg.chat_id_, 0, 1, "🎫┇کاربر ~⪼ ("..msg.sender_user_id_..")\n❕┇ متنی ارسال نکنید !", 1, 'html')
return
   end
if msg.forward_info_ then
if database:get('bot:forward:mute'..msg.chat_id_) then
	if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
local id = msg.id_
  local msgs = {[0] = id}
  local chat = msg.chat_id_
  delete_msg(chat,msgs)
	end
   end
end
end
if msg.forward_info_ then
if database:get('bot:forward:ban'..msg.chat_id_) then
	if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
local id = msg.id_
  local msgs = {[0] = id}
  local chat = msg.chat_id_
  local user_id = msg.sender_user_id_
  delete_msg(chat,msgs)
		chat_kick(msg.chat_id_, msg.sender_user_id_)

	end
   end

if msg.forward_info_ then
if database:get('bot:forward:warn'..msg.chat_id_) then
	if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
local id = msg.id_
  local msgs = {[0] = id}
  local chat = msg.chat_id_
  local user_id = msg.sender_user_id_
  delete_msg(chat,msgs)
send(msg.chat_id_, 0, 1, "🎫┇کاربر ~⪼ ("..msg.sender_user_id_..")\n❕┇ فروارد کردن خلاف قوانین ثبت شده میباشد !", 1, 'html')
	end
   end
end
elseif msg_type == 'MSG:Text' then
   if text:match("@") or msg.content_.entities_[0] and msg.content_.entities_[0].ID == "MessageEntityMentionName" then
   if database:get('bot:tag:mute'..msg.chat_id_) then
local id = msg.id_
  local msgs = {[0] = id}
  local chat = msg.chat_id_
  delete_msg(chat,msgs)
	end
  if msg.forward_info_ then
if database:get('bot:forward:mute'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
  local id = msg.id_
  local msgs = {[0] = id}
  local chat = msg.chat_id_
  delete_msg(chat,msgs)
end
end
  end
  if database:get('bot:tag:ban'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
local user_id = msg.sender_user_id_
 delete_msg(chat,msgs)
 chat_kick(msg.chat_id_, msg.sender_user_id_)

return
   end

  if database:get('bot:tag:warn'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
local user_id = msg.sender_user_id_
 delete_msg(chat,msgs)

return
   end
 end
   	if text:match("#") then
if database:get('bot:hashtag:mute'..msg.chat_id_) then
local id = msg.id_
  local msgs = {[0] = id}
  local chat = msg.chat_id_
  delete_msg(chat,msgs)
	end
  if msg.forward_info_ then
if database:get('bot:forward:mute'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
  local id = msg.id_
  local msgs = {[0] = id}
  local chat = msg.chat_id_
  delete_msg(chat,msgs)
end
end
  end
  if database:get('bot:hashtag:ban'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
local user_id = msg.sender_user_id_
 delete_msg(chat,msgs)
 chat_kick(msg.chat_id_, msg.sender_user_id_)

return
   end

  if database:get('bot:hashtag:warn'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
local user_id = msg.sender_user_id_

return
   end
end

   	if text:match("/") then
if database:get('bot:cmd:mute'..msg.chat_id_) then
local id = msg.id_
  local msgs = {[0] = id}
  local chat = msg.chat_id_
  delete_msg(chat,msgs)
	end
  if msg.forward_info_ then
if database:get('bot:forward:mute'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
  local id = msg.id_
  local msgs = {[0] = id}
  local chat = msg.chat_id_
  delete_msg(chat,msgs)
end
end
  end
if database:get('bot:cmd:ban'..msg.chat_id_) then
local id = msg.id_
  local msgs = {[0] = id}
  local chat = msg.chat_id_
  local user_id = msg.sender_user_id_
  delete_msg(chat,msgs)
 chat_kick(msg.chat_id_, msg.sender_user_id_)

	end
	if database:get('bot:cmd:warn'..msg.chat_id_) then
local id = msg.id_
  local msgs = {[0] = id}
  local chat = msg.chat_id_
  local user_id = msg.sender_user_id_
  delete_msg(chat,msgs)
send(msg.chat_id_, 0, 1, "🎫┇کاربر ~⪼ ("..msg.sender_user_id_..")\n❕┇ لطفا از دستورات سواستفاده نکیند !", 1, 'html')
	end
	end
   	if text:match("[Hh][Tt][Tt][Pp][Ss]://") or text:match("[Hh][Tt][Tt][Pp]://") or text:match(".[Ii][Rr]") or text:match(".[Cc][Oo][Mm]") or text:match(".[Oo][Rr][Gg]") or text:match(".[Ii][Nn][Ff][Oo]") or text:match("[Ww][Ww][Ww].") or text:match(".[Tt][Kk]") then
if database:get('bot:webpage:mute'..msg.chat_id_) then
local id = msg.id_
  local msgs = {[0] = id}
  local chat = msg.chat_id_
  delete_msg(chat,msgs)
	end
  if msg.forward_info_ then
if database:get('bot:forward:mute'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
  local id = msg.id_
  local msgs = {[0] = id}
  local chat = msg.chat_id_
  delete_msg(chat,msgs)
end
end
  end
  if database:get('bot:webpage:ban'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
local user_id = msg.sender_user_id_
 delete_msg(chat,msgs)
 chat_kick(msg.chat_id_, msg.sender_user_id_)

return
   end

  if database:get('bot:webpage:warn'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
local user_id = msg.sender_user_id_
 delete_msg(chat,msgs)

return
   end
 end
   	if text:match("[\216-\219][\128-\191]") then
if database:get('bot:arabic:mute'..msg.chat_id_) then
local id = msg.id_
  local msgs = {[0] = id}
  local chat = msg.chat_id_
  delete_msg(chat,msgs)
	end
  if msg.forward_info_ then
if database:get('bot:forward:mute'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
  local id = msg.id_
  local msgs = {[0] = id}
  local chat = msg.chat_id_
  delete_msg(chat,msgs)
end
end
  end
  if database:get('bot:arabic:ban'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
local user_id = msg.sender_user_id_
 delete_msg(chat,msgs)
 chat_kick(msg.chat_id_, msg.sender_user_id_)

return
   end

  if database:get('bot:arabic:warn'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
local user_id = msg.sender_user_id_
 delete_msg(chat,msgs)

return
   end
 end
   	  if text:match("[ASDFGHJKLQWERTYUIOPZXCVBNMasdfghjklqwertyuiopzxcvbnm]") then
if database:get('bot:english:mute'..msg.chat_id_) then
local id = msg.id_
  local msgs = {[0] = id}
  local chat = msg.chat_id_
  delete_msg(chat,msgs)
	  end
  if msg.forward_info_ then
if database:get('bot:forward:mute'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
  local id = msg.id_
  local msgs = {[0] = id}
  local chat = msg.chat_id_
  delete_msg(chat,msgs)
end
end
  end
	if database:get('bot:english:ban'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
local user_id = msg.sender_user_id_
 delete_msg(chat,msgs)
 chat_kick(msg.chat_id_, msg.sender_user_id_)

return
   end

  if database:get('bot:english:warn'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
local user_id = msg.sender_user_id_
 delete_msg(chat,msgs)
return
   end
end
end
   end
  if database:get('bot:cmds'..msg.chat_id_) and not is_vip(msg.sender_user_id_, msg.chat_id_) then
  return
else

------------------------------------ With Pattern -------------------------------------------
	if text:match("^[Ll][Ee][Aa][Vv][Ee]$") and is_sudo(msg) and not tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
if not database:get('bot:leave:groups') then
	chat_leave(msg.chat_id_, bot_id)
send(msg.chat_id_, msg.id_, 1, "Bye !", 1, 'md')
else
end
end

	if text:match("^خروج$") and is_sudo(msg) and not tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
if not database:get('bot:leave:groups') then
	chat_leave(msg.chat_id_, bot_id)
send(msg.chat_id_, msg.id_, 1, "اودافظ !", 1, 'md')
else
end
end

	if text:match("^[Ll][Ee][Aa][Vv][Ee]$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
	chat_leave(msg.chat_id_, bot_id)
send(msg.chat_id_, msg.id_, 1, "Bye !", 1, 'md')
end

	if text:match("^خروج$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
	chat_leave(msg.chat_id_, bot_id)
send(msg.chat_id_, msg.id_, 1, "اودافظ !", 1, 'md')
end


if msg.content_.entities_ then
if msg.content_.entities_[0] then
if msg.content_.entities_[0] and msg.content_.entities_[0].ID == "MessageEntityUrl" or msg.content_.entities_[0].ID == "MessageEntityTextUrl" then
if database:get('bot:markdown:mute'..msg.chat_id_) then
if not is_vip(msg.sender_user_id_, msg.chat_id_) then
  delete_msg(msg.chat_id_, {[0] = msg.id_})
end
if msg.forward_info_ then
if not is_vip(msg.sender_user_id_, msg.chat_id_) then
if database:get('bot:forward:mute'..msg.chat_id_) then
 if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
delete_msg(msg.chat_id_, {[0] = msg.id_})
end
end
end
end
end
if database:get('bot:markdown:ban'..msg.chat_id_) then
if not is_vip(msg.sender_user_id_, msg.chat_id_) then
delete_msg(msg.chat_id_, {[0] = msg.id_})
chat_kick(msg.chat_id_, msg.sender_user_id_)
  send(msg.chat_id_, 0, 1, "🎫┇کاربر ~⪼ ("..msg.sender_user_id_..")\n❕┇به علت بی توجهی به هشدار ها مسدود شد !", 1, 'html')
end
if msg.forward_info_ then
if not is_vip(msg.sender_user_id_, msg.chat_id_) then
if database:get('bot:forward:mute'..msg.chat_id_) then
 if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
delete_msg(msg.chat_id_, {[0] = msg.id_})
end
end
end
end
end
if database:get('bot:markdown:warn'..msg.chat_id_) then
if not is_vip(msg.sender_user_id_, msg.chat_id_) then
delete_msg(msg.chat_id_, {[0] = msg.id_})
  send(msg.chat_id_, 0, 1, "🎫┇کاربر ~⪼ ("..msg.sender_user_id_..")\n❕┇این کار خلاف قوانین ثبت شده است !", 1, 'html')
end
if msg.forward_info_ then
if not is_vip(msg.sender_user_id_, msg.chat_id_) then
if database:get('bot:forward:mute'..msg.chat_id_) then
 if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
delete_msg(msg.chat_id_, {[0] = msg.id_})
end
end
end
end
end
end
end
end
	-----------------------------------------------------------------------------------------------
local text = msg.content_.text_:gsub('ارتقا ادمین','promote')
	if text:match("^[Pp][Rr][Oo][Mm][Oo][Tt][Ee]$")  and is_owner(msg.sender_user_id_, msg.chat_id_) and msg.reply_to_message_id_ then
	function promote_by_reply(extra, result, success)
	local hash = 'bot:mods:'..msg.chat_id_
	if database:sismember(hash, result.sender_user_id_) then
  if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_User_ *'..result.sender_user_id_..'* _is Already moderator._', 1, 'md')
  else
   send(msg.chat_id_, msg.id_, 1, '👤 اشتراک : *('..result.sender_user_id_..')* از قبل به این بخش دسترسی داشت !', 1, 'md')
  end
else
   database:sadd(hash, result.sender_user_id_)
  if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_User_ *'..result.sender_user_id_..'* _promoted as moderator._', 1, 'md')
  else
   send(msg.chat_id_, msg.id_, 1, '👤 اشتراک : *('..result.sender_user_id_..')* به مقام مدیریت ارتقا یافت !', 1, 'md')
  end
	end
end
	getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
end
	-----------------------------------------------------------------------------------------------
	if text:match("^[Pp][Rr][Oo][Mm][Oo][Tt][Ee] @(.*)$") and is_owner(msg.sender_user_id_, msg.chat_id_) then
	local apmd = {string.match(text, "^([Pp][Rr][Oo][Mm][Oo][Tt][Ee]) @(.*)$")}
	function promote_by_username(extra, result, success)
	if result.id_ then
	  database:sadd('bot:mods:'..msg.chat_id_, result.id_)
  if database:get('bot:lang:'..msg.chat_id_) then
texts = '<code>User '..result.id_..' promoted as moderator.!</code>'
else
  texts = '👤 اشتراک : ('..result.id_..') به مقام مدیریت ارتقا یافت !'
end
else
  if database:get('bot:lang:'..msg.chat_id_) then
texts = '<code>User not found!</code>'
else
  texts = 'موجود نیست !'
end
end
	   send(msg.chat_id_, msg.id_, 1, texts, 1, 'html')
end
	resolve_username(apmd[2],promote_by_username)
end
	-----------------------------------------------------------------------------------------------
	if text:match("^[Pp][Rr][Oo][Mm][Oo][Tt][Ee] (%d+)$") and is_owner(msg.sender_user_id_, msg.chat_id_) then
	local apmd = {string.match(text, "^([Pp][Rr][Oo][Mm][Oo][Tt][Ee]) (%d+)$")}
	  database:sadd('bot:mods:'..msg.chat_id_, apmd[2])
if database:get('bot:lang:'..msg.chat_id_) then
	send(msg.chat_id_, msg.id_, 1, '_User_ *'..apmd[2]..'* _promoted as moderator._', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, '👤 اشتراک : *('..apmd[2]..')* به مقام مدیریت ارتقا یافت !', 1, 'md')
end
end
	-----------------------------------------------------------------------------------------------
  local text = msg.content_.text_:gsub('عزل ادمین','demote')
	if text:match("^[Dd][Ee][Mm][Oo][Tt][Ee]$") and is_owner(msg.sender_user_id_, msg.chat_id_) and msg.reply_to_message_id_ then
	function demote_by_reply(extra, result, success)
	local hash = 'bot:mods:'..msg.chat_id_
	if not database:sismember(hash, result.sender_user_id_) then
  if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_User_ *'..result.sender_user_id_..'* _is not Promoted._', 1, 'md')
  else
send(msg.chat_id_, msg.id_, 1, '👤 اشتراک : *('..result.sender_user_id_..')* ️ به این بخش دسترسی نداشت !', 1, 'md')
  end
	else
   database:srem(hash, result.sender_user_id_)
  if database:get('bot:lang:'..msg.chat_id_) then

   send(msg.chat_id_, msg.id_, 1, '_User_ *'..result.sender_user_id_..'* _Demoted._', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '👤 اشتراک : *('..result.sender_user_id_..')* از داشتن دسترسی به این بخش عزل شد !', 1, 'md')
	end
  end
  end
	getMessage(msg.chat_id_, msg.reply_to_message_id_,demote_by_reply)
end
	-----------------------------------------------------------------------------------------------
	if text:match("^[Dd][Ee][Mm][Oo][Tt][Ee] @(.*)$") and is_owner(msg.sender_user_id_, msg.chat_id_) then
	local hash = 'bot:mods:'..msg.chat_id_
	local apmd = {string.match(text, "^([Dd][Ee][Mm][Oo][Tt][Ee]) @(.*)$")}
	function demote_by_username(extra, result, success)
	if result.id_ then
   database:srem(hash, result.id_)
  if database:get('bot:lang:'..msg.chat_id_) then
texts = '<b>User </b><code>'..result.id_..'</code> <b>Demoted</b>'
else
  texts = '👤 اشتراک : ('..result.id_..') از داشتن دسترسی به این بخش عزل شد !'
end
else
  if database:get('bot:lang:'..msg.chat_id_) then
texts = '<code>User not found!</code>'
else
  texts = 'موجود نیست !'
  end
end
	   send(msg.chat_id_, msg.id_, 1, texts, 1, 'html')
end
	resolve_username(apmd[2],demote_by_username)
end
	-----------------------------------------------------------------------------------------------
	if text:match("^[Dd][Ee][Mm][Oo][Tt][Ee] (%d+)$") and is_owner(msg.sender_user_id_, msg.chat_id_) then
	local hash = 'bot:mods:'..msg.chat_id_
	local apmd = {string.match(text, "^([Dd][Ee][Mm][Oo][Tt][Ee]) (%d+)$")}
   database:srem(hash, apmd[2])
  if database:get('bot:lang:'..msg.chat_id_) then
	send(msg.chat_id_, msg.id_, 1, '_User_ *'..apmd[2]..'* _Demoted._', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '👤 اشتراک : *('..apmd[2]..')*  از داشتن دسترسی به این بخش عزل شد !', 1, 'md')
  end
  end
  -----------------------------------------------------------------------------------------------
  local text = msg.content_.text_:gsub('ویژه','setvip')
	if text:match("^[Ss][Ee][Tt][Vv][Ii][Pp]$")  and is_owner(msg.sender_user_id_, msg.chat_id_) and msg.reply_to_message_id_ then
	function promote_by_reply(extra, result, success)
	local hash = 'bot:vipgp:'..msg.chat_id_
	if database:sismember(hash, result.sender_user_id_) then
  if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_User_ *'..result.sender_user_id_..'* _is Already vip._', 1, 'md')
  else
   send(msg.chat_id_, msg.id_, 1, '👤┇کاربر *('..result.sender_user_id_..')* به امکانات ویژه ربات دسترسی داشت !', 1, 'md')
  end
else
   database:sadd(hash, result.sender_user_id_)
  if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_User_ *'..result.sender_user_id_..'* _promoted as vip._', 1, 'md')
  else
   send(msg.chat_id_, msg.id_, 1, '👤 اشتراک : *('..result.sender_user_id_..')* به امکانات ویژه ربات دسترسی یافت !', 1, 'md')
  end
	end
end
	getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
end
	-----------------------------------------------------------------------------------------------
	if text:match("^[Ss][Ee][Tt][Vv][Ii][Pp] @(.*)$") and is_owner(msg.sender_user_id_, msg.chat_id_) then
	local apmd = {string.match(text, "^([Ss][Ee][Tt][Vv][Ii][Pp]) @(.*)$")}
	function promote_by_username(extra, result, success)
	if result.id_ then
	  database:sadd('bot:vipgp:'..msg.chat_id_, result.id_)
  if database:get('bot:lang:'..msg.chat_id_) then
texts = '<code>User '..result.id_..' promoted as vip.!</code>'
else
  texts = '👤 اشتراک : ('..result.id_..') به امکانات ویژه ربات دسترسی یافت !'
end
else
  if database:get('bot:lang:'..msg.chat_id_) then
texts = '<code>User not found!</code>'
else
  texts = 'موجود نیست !'
end
end
	   send(msg.chat_id_, msg.id_, 1, texts, 1, 'html')
end
	resolve_username(apmd[2],promote_by_username)
end
	-----------------------------------------------------------------------------------------------
	if text:match("^[Ss][Ee][Tt][Vv][Ii][Pp] (%d+)$") and is_owner(msg.sender_user_id_, msg.chat_id_) then
	local apmd = {string.match(text, "^([Ss][Ee][Tt][Vv][Ii][Pp]) (%d+)$")}
	  database:sadd('bot:vipgp:'..msg.chat_id_, apmd[2])
if database:get('bot:lang:'..msg.chat_id_) then
	send(msg.chat_id_, msg.id_, 1, '_User_ *'..apmd[2]..'* _promoted as vip._', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, '👤 اشتراک : *('..apmd[2]..')* به امکانات ویژه ربات دسترسی یافت !', 1, 'md')
end
end
	-----------------------------------------------------------------------------------------------
  local text = msg.content_.text_:gsub('عزل ویژه','remvip')
	if text:match("^[Rr][Ee][Mm][Vv][Ii][Pp]$") and is_owner(msg.sender_user_id_, msg.chat_id_) and msg.reply_to_message_id_ then
	function demote_by_reply(extra, result, success)
	local hash = 'bot:vipgp:'..msg.chat_id_
	if not database:sismember(hash, result.sender_user_id_) then
  if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_User_ *'..result.sender_user_id_..'* _is not Promoted vip._', 1, 'md')
  else
send(msg.chat_id_, msg.id_, 1, '👤┇کاربر *('..result.sender_user_id_..')* به امکانات ویژه ربات دسترسی نداشت !', 1, 'md')
  end
	else
   database:srem(hash, result.sender_user_id_)
  if database:get('bot:lang:'..msg.chat_id_) then

   send(msg.chat_id_, msg.id_, 1, '_User_ *'..result.sender_user_id_..'* _Demoted vip._', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '👤 اشتراک : *('..result.sender_user_id_..')* از داشتن دسترسی به امکانات ویژه ربات محروم شد !', 1, 'md')
	end
  end
  end
	getMessage(msg.chat_id_, msg.reply_to_message_id_,demote_by_reply)
end
	-----------------------------------------------------------------------------------------------
	if text:match("^[Rr][Ee][Mm][Vv][Ii][Pp] @(.*)$") and is_owner(msg.sender_user_id_, msg.chat_id_) then
	local hash = 'bot:vipgp:'..msg.chat_id_
	local apmd = {string.match(text, "^([Rr][Ee][Mm][Vv][Ii][Pp]) @(.*)$")}
	function demote_by_username(extra, result, success)
	if result.id_ then
   database:srem(hash, result.id_)
  if database:get('bot:lang:'..msg.chat_id_) then
texts = '<b>User </b><code>'..result.id_..'</code> <b>Demoted vip</b>'
else
  texts = '👤 اشتراک : ('..result.id_..') از داشتن دسترسی به امکانات ویژه ربات محروم شد !'
end
else
  if database:get('bot:lang:'..msg.chat_id_) then
texts = '<code>User not found!</code>'
else
  texts = 'موجود نیست !'
  end
end
	   send(msg.chat_id_, msg.id_, 1, texts, 1, 'html')
end
	resolve_username(apmd[2],demote_by_username)
end
	-----------------------------------------------------------------------------------------------
	if text:match("^[Rr][Ee][Mm][Vv][Ii][Pp] (%d+)$") and is_owner(msg.sender_user_id_, msg.chat_id_) then
	local hash = 'bot:vipgp:'..msg.chat_id_
	local apmd = {string.match(text, "^([Rr][Ee][Mm][Vv][Ii][Pp]) (%d+)$")}
   database:srem(hash, apmd[2])
  if database:get('bot:lang:'..msg.chat_id_) then
	send(msg.chat_id_, msg.id_, 1, '_User_ *'..apmd[2]..'* _Demoted vip._', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '👤 اشتراک : *'..apmd[2]..'* از داشتن دسترسی به امکانات ویژه ربات محروم شد !️', 1, 'md')
  end
  end

	-----------------------------------------------------------------------------------------------
local text = msg.content_.text_:gsub('مسدود','Ban')
	if text:match("^[Bb][Aa][Nn]$") and is_mod(msg.sender_user_id_, msg.chat_id_) and msg.reply_to_message_id_ then
	function ban_by_reply(extra, result, success)
	local hash = 'bot:banned:'..msg.chat_id_
	if is_mod(result.sender_user_id_, result.chat_id_) then
  if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '*You Can,t [Kick/Ban] Moderators!!*', 1, 'md')
 else
send(msg.chat_id_, msg.id_, 1, 'شما قادر به مسدود مدیران نیستید !', 1, 'md')
end
else
if database:sismember(hash, result.sender_user_id_) then
  if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_User_ *'..result.sender_user_id_..'* _is Already Banned._', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '👤 اشتراک : *('..result.sender_user_id_..')* ️در لیست سیاه بود !', 1, 'md')
end
		 chat_kick(result.chat_id_, result.sender_user_id_)
	else
   database:sadd(hash, result.sender_user_id_)
  if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_User_ *'..result.sender_user_id_..'* _Banned._', 1, 'md')
 else
send(msg.chat_id_, msg.id_, 1, '👤 اشتراک : *('..result.sender_user_id_..')* مسدود شد !', 1, 'md')
end
		 chat_kick(result.chat_id_, result.sender_user_id_)
	end
end
	end
	getMessage(msg.chat_id_, msg.reply_to_message_id_,ban_by_reply)
end
	-----------------------------------------------------------------------------------------------
	if text:match("^[Bb][Aa][Nn] @(.*)$") and is_mod(msg.sender_user_id_, msg.chat_id_) then
	local apba = {string.match(text, "^([Bb][Aa][Nn]) @(.*)$")}
	function ban_by_username(extra, result, success)
	if result.id_ then
	if is_mod(result.id_, msg.chat_id_) then
  if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '*You Can,t [Kick/Ban] Moderators!!*', 1, 'md')
 else
send(msg.chat_id_, msg.id_, 1, 'شما قادر به مسدود کردن مدیران نیستید !', 1, 'md')
end
else
	  database:sadd('bot:banned:'..msg.chat_id_, result.id_)
  if database:get('bot:lang:'..msg.chat_id_) then
texts = '<b>User </b><code>'..result.id_..'</code> <b>Banned.!</b>'
else
  texts = '👤 اشتراک : ('..result.id_..') مسدود شد !'
end
		 chat_kick(msg.chat_id_, result.id_)
	end
else
  if database:get('bot:lang:'..msg.chat_id_) then
texts = '<code>User not found!</code>'
else
  texts = 'موجود نیست !'
end
end
	   send(msg.chat_id_, msg.id_, 1, texts, 1, 'html')
end
	resolve_username(apba[2],ban_by_username)
end
	-----------------------------------------------------------------------------------------------
	if text:match("^[Bb][Aa][Nn] (%d+)$") and is_mod(msg.sender_user_id_, msg.chat_id_) then
	local apba = {string.match(text, "^([Bb][Aa][Nn]) (%d+)$")}
	if is_mod(apba[2], msg.chat_id_) then
  if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '*You Can,t [Kick/Ban] Moderators!!*', 1, 'md')
 else
send(msg.chat_id_, msg.id_, 1, 'شما قادر به مسدود کردن مدیران نیستید !', 1, 'md')
end
else
	  database:sadd('bot:banned:'..msg.chat_id_, apba[2])
		 chat_kick(msg.chat_id_, apba[2])
  if database:get('bot:lang:'..msg.chat_id_) then
	send(msg.chat_id_, msg.id_, 1, '_User_ *'..apba[2]..'* _Banned._', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '👤 اشتراک : *('..apba[2]..')* مسدود شد !', 1, 'md')
  	end
	end
end
  ----------------------------------------------unban--------------------------------------------
local text = msg.content_.text_:gsub('لغو مسدود','unban')
   if text:match("^[Uu][Nn][Bb][Aa][Nn]$") and is_mod(msg.sender_user_id_, msg.chat_id_) and msg.reply_to_message_id_ then
 function unban_by_reply(extra, result, success)
 local hash = 'bot:banned:'..msg.chat_id_
 if not database:sismember(hash, result.sender_user_id_) then
  if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_User_ *'..result.sender_user_id_..'* _is not Banned._', 1, 'md')
 else
send(msg.chat_id_, msg.id_, 1, '👤 اشتراک : *('..result.sender_user_id_..')* در لیست مسدودین یافت نشد !', 1, 'md')
end
 else 
   database:srem(hash, result.sender_user_id_)
  if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_User_ *'..result.sender_user_id_..'* _Unbanned._', 1, 'md')
 else
   send(msg.chat_id_, msg.id_, 1, '👤 اشتراک : *('..result.sender_user_id_..')* از لیست مسدود حذف شد !', 1, 'md')
end
 end
end
 getMessage(msg.chat_id_, msg.reply_to_message_id_,unban_by_reply)
end
 -----------------------------------------------------------------------------------------------
 if text:match("^[Uu][Nn][Bb][Aa][Nn] @(.*)$") and is_mod(msg.sender_user_id_, msg.chat_id_) then
 local apba = {string.match(text, "^([Uu][Nn][Bb][Aa][Nn]) @(.*)$")}
 function unban_by_username(extra, result, success)
 if result.id_ then
   database:srem('bot:banned:'..msg.chat_id_, result.id_)
  if database:get('bot:lang:'..msg.chat_id_) then
texts = '<b>User </b><code>'..result.id_..'</code> <b>Unbanned.!</b>'
else
  texts = '👤 اشتراک :('..result.id_..') از لیست مسدودین حذف شد !'
end
else
  if database:get('bot:lang:'..msg.chat_id_) then
texts = '<code>User not found!</code>'
else
  texts = 'موجود نیست !'
end
end
    send(msg.chat_id_, msg.id_, 1, texts, 1, 'html')
end
 resolve_username(apba[2],unban_by_username)
end
 -----------------------------------------------------------------------------------------------
 if text:match("^[Uu][Nn][Bb][Aa][Nn] (%d+)$") and is_mod(msg.sender_user_id_, msg.chat_id_) then
 local apba = {string.match(text, "^([Uu][Nn][Bb][Aa][Nn]) (%d+)$")}
   database:srem('bot:banned:'..msg.chat_id_, apba[2])
  if database:get('bot:lang:'..msg.chat_id_) then
 send(msg.chat_id_, msg.id_, 1, '_User_ *'..apba[2]..'* _Unbanned._', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, '👤 اشتراک : *('..apba[2]..')* از لیست مسدودین حذف شد !', 1, 'md')
end
  end

   if text:match("^[Uu][Nn][Bb][Aa][Nn]$") and is_mod(msg.sender_user_id_, msg.chat_id_) and msg.reply_to_message_id_ then
 function moody(extra, result, success)
 function unban_by_reply(extra, result, success)
 local hash = 'bot:banned:'..msg.chat_id_
   database:srem(hash, result.sender_user_id_)
bot.changeChatMemberStatus(msg.chat_id_, result.sender_user_id_, "Left")
 end
 getMessage(msg.chat_id_, msg.reply_to_message_id_,unban_by_reply)
end
 bot.channel_get_kicked(msg.chat_id_,moody)
 end
 -----------------------------------------------------------------------------------------------
 if text:match("^[Uu][Nn][Bb][Aa][Nn] @(.*)$") and is_mod(msg.sender_user_id_, msg.chat_id_) then
 local apba = {string.match(text, "^([Uu][Nn][Bb][Aa][Nn]) @(.*)$")}
 function moody(extra, result, success)
 function unban_by_username(extra, result, success)
 if result.id_ then
   database:srem('bot:banned:'..msg.chat_id_, result.id_)
bot.changeChatMemberStatus(msg.chat_id_, result.id_, "Left")
else
end
    send(msg.chat_id_, msg.id_, 1, txxt, 1, 'html')
end
 resolve_username(apba[2],unban_by_username)
end
 bot.channel_get_kicked(msg.chat_id_,moody)
 end
 -----------------------------------------------------------------------------------------------
 if text:match("^[Uu][Nn][Bb][Aa][Nn] (%d+)$") and is_mod(msg.sender_user_id_, msg.chat_id_) then
 local apba = {string.match(text, "^([Uu][Nn][Bb][Aa][Nn]) (%d+)$")}
 function moody(extra, result, success)
   database:srem('bot:banned:'..msg.chat_id_, apba[2])
bot.changeChatMemberStatus(msg.chat_id_, apba[2], "Left")
  end
 bot.channel_get_kicked(msg.chat_id_,moody)
 end
	-----------------------------------------------------------------------------------------------
local text = msg.content_.text_:gsub('پاکسازی همه','delall')
	if text:match("^[Dd][Ee][Ll][Aa][Ll][Ll]$") and is_owner(msg.sender_user_id_, msg.chat_id_) and msg.reply_to_message_id_ then
	function delall_by_reply(extra, result, success)
	if is_mod(result.sender_user_id_, result.chat_id_) then
  if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '*You Can,t Delete Msgs from Moderators!!*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, 'شما قادر به پاک کردن پیام افراد دارای مقام نیست !', 1, 'md')
end
else
  if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_All Msgs from _ *'..result.sender_user_id_..'* _Has been deleted!!_', 1, 'md')
 else
send(msg.chat_id_, msg.id_, 1, 'تمام پیام های کاربر : *('..result.sender_user_id_..')* پاکسازی شد !', 1, 'md')
end
		del_all_msgs(result.chat_id_, result.sender_user_id_)
end
	end
	getMessage(msg.chat_id_, msg.reply_to_message_id_,delall_by_reply)
end
	-----------------------------------------------------------------------------------------------
	if text:match("^[Dd][Ee][Ll][Aa][Ll][Ll] (%d+)$") and is_owner(msg.sender_user_id_, msg.chat_id_) then
		local ass = {string.match(text, "^([Dd][Ee][Ll][Aa][Ll][Ll]) (%d+)$")}
	if is_mod(ass[2], msg.chat_id_) then
  if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '*You Can,t Delete Msgs from Moderators!!*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, 'شما قادر به پاک کردن پیام افراد دارای مقام نیستید !', 1, 'md')
end
else
	 		del_all_msgs(msg.chat_id_, ass[2])
  if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_All Msgs from _ *'..ass[2]..'* _Has been deleted!!_', 1, 'md')
 else
   send(msg.chat_id_, msg.id_, 1, 'تمام پیام های کاربر : *('..ass[2]..')* پاکسازی شد !', 1, 'md')
end
  end
	end
 -----------------------------------------------------------------------------------------------
	if text:match("^[Dd][Ee][Ll][Aa][Ll][Ll] @(.*)$") and is_owner(msg.sender_user_id_, msg.chat_id_) then
	local apbll = {string.match(text, "^([Dd][Ee][Ll][Aa][Ll][Ll]) @(.*)$")}
	function delall_by_username(extra, result, success)
	if result.id_ then
	if is_mod(result.id_, msg.chat_id_) then
  if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '*You Can,t Delete Msgs from Moderators!!*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, 'شما فادر به پاک کردن پیام های افراد دارای مقام نیستید !', 1, 'md')
end
return false
end
		 		del_all_msgs(msg.chat_id_, result.id_)
  if database:get('bot:lang:'..msg.chat_id_) then
texts = '<b>All Msg From user</b> <code>'..result.id_..'</code> <b>Deleted!</b>'
else
  texts = 'تمام پیام های کاربر : ('..result.id_..') پاکسازی شد !'
end
else
  if database:get('bot:lang:'..msg.chat_id_) then
texts = '<code>User not found!</code>'
else
  texts = 'موجود نیست !'
end
end
	   send(msg.chat_id_, msg.id_, 1, texts, 1, 'html')
end
	resolve_username(apbll[2],delall_by_username)
end
  -----------------------------------------banall--------------------------------------------------
local text = msg.content_.text_:gsub('سوپر بن','banall')
if text:match("^[Bb][Aa][Nn][Aa][Ll][Ll]$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) and msg.reply_to_message_id_ then
function gban_by_reply(extra, result, success)
  local hash = 'bot:gbanned:'
	if is_admin(result.sender_user_id_, result.chat_id_) then
  if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '*You Can,t [Banall] admins/sudo!!*', 1, 'md')
 else
send(msg.chat_id_, msg.id_, 1, 'شما قادر به سوپر بن کردن افراد دارای مقام نیستید !', 1, 'md')
end
else
  database:sadd(hash, result.sender_user_id_)
  chat_kick(result.chat_id_, result.sender_user_id_)
  if database:get('bot:lang:'..msg.chat_id_) then
  texts = '<b>User :</b> '..result.sender_user_id_..' <b>Has been Globally Banned !</b>'
else
  texts = '👤 اشتراک : ('..result.sender_user_id_..') سوپر بن شد !'
end
end
	   send(msg.chat_id_, msg.id_, 1, texts, 1, 'html')
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,gban_by_reply)
end
-----------------------------------------------------------------------------------------------
if text:match("^[Bb][Aa][Nn][Aa][Ll][Ll] @(.*)$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
local apbll = {string.match(text, "^([Bb][Aa][Nn][Aa][Ll][Ll]) @(.*)$")}
function gban_by_username(extra, result, success)
  if result.id_ then
   	if is_admin(result.id_, msg.chat_id_) then
  if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '*You Can,t [Banall] admins/sudo!!*', 1, 'md')
 else
send(msg.chat_id_, msg.id_, 1, 'شما قادر به سوپر بن کردن افراد دارای مقام نیستید !', 1, 'md')
end
  else
  local hash = 'bot:gbanned:'
if database:get('bot:lang:'..msg.chat_id_) then
texts = '<b>User :</b> <code>'..result.id_..'</code> <b> Has been Globally Banned !</b>'
  else
texts = '👤 اشتراک : ('..result.id_..') سوپر بن شد !'
end
database:sadd(hash, result.id_)
end
  else
if database:get('bot:lang:'..msg.chat_id_) then
  texts = '<b>User not found!</b>'
else
  texts = 'موجود نیست !'
end
end
  send(msg.chat_id_, msg.id_, 1, texts, 1, 'html')
end
resolve_username(apbll[2],gban_by_username)
end

if text:match("^[Bb][Aa][Nn][Aa][Ll][Ll] (%d+)$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
local apbll = {string.match(text, "^([Bb][Aa][Nn][Aa][Ll][Ll]) (%d+)$")}
  local hash = 'bot:gbanned:'
	  database:sadd(hash, apbll[2])
  if database:get('bot:lang:'..msg.chat_id_) then
	send(msg.chat_id_, msg.id_, 1, '_User_ *'..apbll[2]..'* _Has been Globally Banned _', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '👤 اشتراک : *('..apbll[2]..')* سوپر بن شد !', 1, 'md')
	end
end
-----------------------------------------------------------------------------------------------
local text = msg.content_.text_:gsub('حذف سوپر بن','unbanall')
if text:match("^[Uu][Nn][Bb][Aa][Nn][Aa][Ll][Ll]$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) and msg.reply_to_message_id_ then
function ungban_by_reply(extra, result, success)
  local hash = 'bot:gbanned:'
  if database:get('bot:lang:'..msg.chat_id_) then
  texts = '<b>User :</b> '..result.sender_user_id_..' <b>Has been Globally Unbanned !</b>'
 else
  texts =  '👤 اشتراک : ('..result.sender_user_id_..') از لیست سوپر بن حذف شد !'
	   send(msg.chat_id_, msg.id_, 1, texts, 1, 'html')
end
  database:srem(hash, result.sender_user_id_)
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,ungban_by_reply)
end
-----------------------------------------------------------------------------------------------
if text:match("^[Uu][Nn][Bb][Aa][Nn][Aa][Ll][Ll] @(.*)$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
local apid = {string.match(text, "^([Uu][Nn][Bb][Aa][Nn][Aa][Ll][Ll]) @(.*)$")}
function ungban_by_username(extra, result, success)
  local hash = 'bot:gbanned:'
  if result.id_ then
if database:get('bot:lang:'..msg.chat_id_) then
 texts = '<b>User :</b> '..result.id_..' <b>Has been Globally Unbanned !</b>'
else
texts = '👤 اشتراک : ('..result.id_..') از لیست سوپر بن حذف شد !'
end
database:srem(hash, result.id_)
  else
if database:get('bot:lang:'..msg.chat_id_) then
  texts = '<b>User not found!</b>'
else
  texts = 'موجود نیست !'
  end
  end
  send(msg.chat_id_, msg.id_, 1, texts, 1, 'html')
end
resolve_username(apid[2],ungban_by_username)
end
-----------------------------------------------------------------------------------------------
if text:match("^[Uu][Nn][Bb][Aa][Nn][Aa][Ll][Ll] (%d+)$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
local apbll = {string.match(text, "^([Uu][Nn][Bb][Aa][Nn][Aa][Ll][Ll]) (%d+)$")}
local hash = 'bot:gbanned:'
  database:srem(hash, apbll[2])
  if database:get('bot:lang:'..msg.chat_id_) then
  texts = '<b>User :</b> '..apbll[2]..' <b>Has been Globally Unbanned !</b>'
else
texts = '👤 اشتراک : ('..apbll[2]..') از لیست سوپر بن حذف شد !'
end
  send(msg.chat_id_, msg.id_, 1, texts, 1, 'html')
end
-----------------------------------------------------------------------------------------------
local text = msg.content_.text_:gsub('سایلنت ال','silent all')
if text:match("^[Ss][Ii][Ll][Ee][Nn][Tt] [Aa][Ll][Ll]$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) and msg.reply_to_message_id_ then
function gmute_by_reply(extra, result, success)
  local hash = 'bot:gmuted:'
	if is_admin(result.sender_user_id_, result.chat_id_) then
  if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '*You Can,t [Banall] admins/sudo!!*', 1, 'md')
 else
send(msg.chat_id_, msg.id_, 1, 'شما قادر به سایلنت ال کردن افراد دارای مقام نیستید !', 1, 'md')
end
else
  database:sadd(hash, result.sender_user_id_)
  chat_kick(result.chat_id_, result.sender_user_id_)
  if database:get('bot:lang:'..msg.chat_id_) then
  texts = '<b>User :</b> '..result.sender_user_id_..' <b>Has been Gmuted Banned !</b>'
else
  texts = '👤 اشتراک : ('..result.sender_user_id_..') سایلنت ال شد !'
end
end
	   send(msg.chat_id_, msg.id_, 1, texts, 1, 'html')
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,gmute_by_reply)
end
-----------------------------------------------------------------------------------------------
if text:match("^[Ss][Ii][Ll][Ee][Nn][Tt] [Aa][Ll][Ll] @(.*)$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
local apbll = {string.match(text, "^([Ss][Ii][Ll][Ee][Nn][Tt] [Aa][Ll][Ll]) @(.*)$")}
function gmute_by_username(extra, result, success)
  if result.id_ then
   	if is_admin(result.id_, msg.chat_id_) then
  if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '*You Can,t [Banall] admins/sudo!!*', 1, 'md')
 else
send(msg.chat_id_, msg.id_, 1, 'شما قادر به سایلنت ال کردن افراد دارای مقام نیستید !', 1, 'md')
end
  else
  local hash = 'bot:gmuted:'
if database:get('bot:lang:'..msg.chat_id_) then
texts = '<b>User :</b> <code>'..result.id_..'</code> <b> Has been Gmuted Banned !</b>'
  else
texts = '👤 اشتراک : ('..result.id_..') سایلنت ال شد !'
end
database:sadd(hash, result.id_)
end
  else
if database:get('bot:lang:'..msg.chat_id_) then
  texts = '<b>User not found!</b>'
else
  texts = 'موجود نیست !'
end
end
  send(msg.chat_id_, msg.id_, 1, texts, 1, 'html')
end
resolve_username(apbll[2],gmute_by_username)
end

if text:match("^[Ss][Ii][Ll][Ee][Nn][Tt] [Aa][Ll][Ll] (%d+)$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
local apbll = {string.match(text, "^([Ss][Ii][Ll][Ee][Nn][Tt] [Aa][Ll][Ll]) (%d+)$")}
  local hash = 'bot:gmuted:'
	  database:sadd(hash, apbll[2])
  if database:get('bot:lang:'..msg.chat_id_) then
	send(msg.chat_id_, msg.id_, 1, '_User_ *'..apbll[2]..'* _Has been Gmuted Banned _', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '👤 اشتراک : *('..apbll[2]..')* سایلنت ال شد !', 1, 'md')
	end
end
-----------------------------------------------------------------------------------------------
local text = msg.content_.text_:gsub('حذف سایلنت ال','unsilent all')
if text:match("^[Uu][Nn][Ss][Ii][Ll][Ee][Nn][Tt] [Aa][Ll][Ll]$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) and msg.reply_to_message_id_ then
function ungmute_by_reply(extra, result, success)
  local hash = 'bot:gmuted:'
  if database:get('bot:lang:'..msg.chat_id_) then
  texts = '<b>User :</b> '..result.sender_user_id_..' <b>Has been Gmuted Unbanned !</b>'
 else
  texts = '👤 اشتراک : ('..result.sender_user_id_..') از لیست سایلنت ال حذف شد !'
	   send(msg.chat_id_, msg.id_, 1, texts, 1, 'html')
end
  database:srem(hash, result.sender_user_id_)
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,ungmute_by_reply)
end
-----------------------------------------------------------------------------------------------
if text:match("^[Uu][Nn][Ss][Ii][Ll][Ee][Nn][Tt] [Aa][Ll][Ll] @(.*)$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
local apid = {string.match(text, "^([Uu][Nn][Ss][Ii][Ll][Ee][Nn][Tt] [Aa][Ll][Ll]) @(.*)$")}
function ungmute_by_username(extra, result, success)
  local hash = 'bot:gmuted:'
  if result.id_ then
if database:get('bot:lang:'..msg.chat_id_) then
 texts = '<b>User :</b> '..result.id_..' <b>Has been Gmuted Unbanned !</b>'
else
texts = '👤 اشتراک : ('..result.id_..') از لیست سایلنت ال حذف شد !'
end
database:srem(hash, result.id_)
  else
if database:get('bot:lang:'..msg.chat_id_) then
  texts = '<b>User not found!</b>'
else
  texts = 'موجود نیست !'
  end
  end
  send(msg.chat_id_, msg.id_, 1, texts, 1, 'html')
end
resolve_username(apid[2],ungmute_by_username)
end
-----------------------------------------------------------------------------------------------
if text:match("^[Uu][Nn][Ss][Ii][Ll][Ee][Nn][Tt] [Aa][Ll][Ll] (%d+)$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
local apbll = {string.match(text, "^([Uu][Nn][Ss][Ii][Ll][Ee][Nn][Tt] [Aa][Ll][Ll]) (%d+)$")}
local hash = 'bot:gmuted:'
  database:srem(hash, apbll[2])
  if database:get('bot:lang:'..msg.chat_id_) then
  texts = '<b>User :</b> '..apbll[2]..' <b>Has been Gmuted Unbanned !</b>'
else
texts = '👤 اشتراک : ('..apbll[2]..') از لیست سایلنت ال حذف شد !'
end
  send(msg.chat_id_, msg.id_, 1, texts, 1, 'html')
end
	-----------------------------------------------------------------------------------------------
local text = msg.content_.text_:gsub('سایلنت','silent')
	if text:match("^[Ss][Ii][Ll][Ee][Nn][Tt]$") and is_mod(msg.sender_user_id_, msg.chat_id_) and msg.reply_to_message_id_ then
	function mute_by_reply(extra, result, success)
	local hash = 'bot:muted:'..msg.chat_id_
	if is_mod(result.sender_user_id_, result.chat_id_) then
  if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '*You Can,t [Kick/Ban] Moderators!!*', 1, 'md')
 else
send(msg.chat_id_, msg.id_, 1, 'شما نمیتوانید افراد دارای مقام را سایلنت کنید !', 1, 'md')
end
else
if database:sismember(hash, result.sender_user_id_) then
  if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_User_ *'..result.sender_user_id_..'* _is Already silent._', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, '👤 اشتراک : *('..result.sender_user_id_..')* سایلنت بود !', 1, 'md')
end
	else
   database:sadd(hash, result.sender_user_id_)
  if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_User_ *'..result.sender_user_id_..'* _silented_', 1, 'md')
 else
send(msg.chat_id_, msg.id_, 1, '👤 اشتراک : *('..result.sender_user_id_..')* سایلنت شد !', 1, 'md')
end
	end
end
	end
	getMessage(msg.chat_id_, msg.reply_to_message_id_,mute_by_reply)
end
	-----------------------------------------------------------------------------------------------
	if text:match("^[Ss][Ii][Ll][Ee][Nn][Tt] @(.*)$") and is_mod(msg.sender_user_id_, msg.chat_id_) then
	local apsi = {string.match(text, "^([Ss][Ii][Ll][Ee][Nn][Tt]) @(.*)$")}
	function mute_by_username(extra, result, success)
	if result.id_ then
	if is_mod(result.id_, msg.chat_id_) then
  if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '*You Can,t [Kick/Ban] Moderators!!*', 1, 'md')
 else
send(msg.chat_id_, msg.id_, 1, 'شما نمیتوانید افراد دارای مقام را سایلنت کنید !', 1, 'md')
end
else
	  database:sadd('bot:muted:'..msg.chat_id_, result.id_)
  if database:get('bot:lang:'..msg.chat_id_) then
texts = '<b>User </b><code>'..result.id_..'</code> <b>silent</b>'
else
  texts = '👤 اشتراک : ('..result.id_..') سایلنت شد !'
end
	end
else
  if database:get('bot:lang:'..msg.chat_id_) then
texts = '<code>User not found!</code>'
else
  texts = 'موجود نیست !'
end
end
	   send(msg.chat_id_, msg.id_, 1, texts, 1, 'html')
end
	resolve_username(apsi[2],mute_by_username)
end

	-----------------------------------------------------------------------------------------------
	if text:match("^[Ss][Ii][Ll][Ee][Nn][Tt] (%d+)$") and is_mod(msg.sender_user_id_, msg.chat_id_) then
	local apsi = {string.match(text, "^([Ss][Ii][Ll][Ee][Nn][Tt]) (%d+)$")}
	if is_mod(apsi[2], msg.chat_id_) then
  if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '*You Can,t [Kick/Ban] Moderators!!*', 1, 'md')
 else
send(msg.chat_id_, msg.id_, 1, 'شما نمیتوانید افراد دارای مقام را سایلنت کنید !', 1, 'md')
end
else
	  database:sadd('bot:muted:'..msg.chat_id_, apsi[2])
  if database:get('bot:lang:'..msg.chat_id_) then
	send(msg.chat_id_, msg.id_, 1, '_User_ *'..apsi[2]..'* Silented._', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '👤 اشتراک : *('..apsi[2]..')* سایلنت شد !', 1, 'md')
  	end
	end
end
	-----------------------------------------------------------------------------------------------
local text = msg.content_.text_:gsub('حذف سایلنت','unsilent')
	if text:match("^[Uu][Nn][Ss][Ii][Ll][Ee][Nn][Tt]$") and is_mod(msg.sender_user_id_, msg.chat_id_) and msg.reply_to_message_id_ then
	function unmute_by_reply(extra, result, success)
	local hash = 'bot:muted:'..msg.chat_id_
	if not database:sismember(hash, result.sender_user_id_) then
  if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_User_ *'..result.sender_user_id_..'* _is not silent._', 1, 'md')
 else
send(msg.chat_id_, msg.id_, 1, '👤 اشتراک : *('..result.sender_user_id_..')* در سایلنت لیست ربات یافت نشد !', 1, 'md')
end
	else
   database:srem(hash, result.sender_user_id_)
  if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_User_ *'..result.sender_user_id_..'* _unsilent_', 1, 'md')
 else
   send(msg.chat_id_, msg.id_, 1, '👤 اشتراک : *('..result.sender_user_id_..')* از لیست افراد سایلنت حذف شد !', 1, 'md')
end
	end
end
	getMessage(msg.chat_id_, msg.reply_to_message_id_,unmute_by_reply)
end
	-----------------------------------------------------------------------------------------------
	if text:match("^[Uu][Nn][Ss][Ii][Ll][Ee][Nn][Tt] @(.*)$") and is_mod(msg.sender_user_id_, msg.chat_id_) then
	local apsi = {string.match(text, "^([Uu][Nn][Ss][Ii][Ll][Ee][Nn][Tt]) @(.*)$")}
	function unmute_by_username(extra, result, success)
	if result.id_ then
   database:srem('bot:muted:'..msg.chat_id_, result.id_)
  if database:get('bot:lang:'..msg.chat_id_) then
texts = '<b>User </b><code>'..result.id_..'</code> <b>unsilent.!</b>'
else
  texts = '👤 اشتراک : ('..result.id_..') از لیست افراد سایلنت حذف شد !'
end
else
  if database:get('bot:lang:'..msg.chat_id_) then
texts = '<code>User not found!</code>'
else
  texts = 'موجود نیست !'
end
end
	   send(msg.chat_id_, msg.id_, 1, texts, 1, 'html')
end
	resolve_username(apsi[2],unmute_by_username)
end
	-----------------------------------------------------------------------------------------------
	if text:match("^[Uu][Nn][Ss][Ii][Ll][Ee][Nn][Tt] (%d+)$") and is_mod(msg.sender_user_id_, msg.chat_id_) then
	local apsi = {string.match(text, "^([Uu][Nn][Ss][Ii][Ll][Ee][Nn][Tt]) (%d+)$")}
	  database:srem('bot:muted:'..msg.chat_id_, apsi[2])
  if database:get('bot:lang:'..msg.chat_id_) then
	send(msg.chat_id_, msg.id_, 1, '_User_ *'..apsi[2]..'* _unsilent_', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, '👤 اشتراک : *('..apsi[2]..')* از لیست افراد سایلنت حذف شد !️', 1, 'md')
end
  end
-----------------------------------------------------------------------------------------------
local text = msg.content_.text_:gsub('اخراج','kick')
  if text:match("^[Kk][Ii][Cc][Kk]$") and msg.reply_to_message_id_ and is_mod(msg.sender_user_id_, msg.chat_id_) then
function kick_reply(extra, result, success)
	if is_mod(result.sender_user_id_, result.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '*You Can,t [Kick] Moderators!!*', 1, 'md')
 else
   send(msg.chat_id_, msg.id_, 1, 'شما قادر به اخراج افراد دارای مقام نیستید !', 1, 'md')
end
  else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '*User* _'..result.sender_user_id_..'_ *Kicked.*', 1, 'md')
else
  send(msg.chat_id_, msg.id_, 1, '👤 اشتراک : ('..result.sender_user_id_..') از گروه اخراج شد !', 1, 'md')
end
  chat_kick(result.chat_id_, result.sender_user_id_)
  end
	end
   getMessage(msg.chat_id_,msg.reply_to_message_id_,kick_reply)
  end
	-----------------------------------------------------------------------------------------------
	if text:match("^[Kk][Ii][Cc][Kk] @(.*)$") and is_mod(msg.sender_user_id_, msg.chat_id_) then
	local apki = {string.match(text, "^([Kk][Ii][Cc][Kk]) @(.*)$")}
	function kick_by_username(extra, result, success)
	if result.id_ then
	if is_mod(result.id_, msg.chat_id_) then
  if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '*You Can,t [Kick] Moderators!!*', 1, 'md')
 else
send(msg.chat_id_, msg.id_, 1, 'شما قادر به اخراج افراد دارای مقام نیستید !', 1, 'md')
end
else
  if database:get('bot:lang:'..msg.chat_id_) then
texts = '<b>User </b><code>'..result.id_..'</code> <b>Kicked.!</b>'
else
  texts = '👤 اشتراک : ('..result.id_..') اخراج شد !'
end
		 chat_kick(msg.chat_id_, result.id_)
	end
else
  if database:get('bot:lang:'..msg.chat_id_) then
texts = '<code>User not found!</code>'
else
  texts = 'موجود نیست !'
end
end
	   send(msg.chat_id_, msg.id_, 1, texts, 1, 'html')
end
	resolve_username(apki[2],kick_by_username)
end
	-----------------------------------------------------------------------------------------------
	if text:match("^[Kk][Ii][Cc][Kk] (%d+)$") and is_mod(msg.sender_user_id_, msg.chat_id_) then
	local apki = {string.match(text, "^([Kk][Ii][Cc][Kk]) (%d+)$")}
	if is_mod(apki[2], msg.chat_id_) then
  if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '*You Can,t [Kick] Moderators!!*', 1, 'md')
 else
send(msg.chat_id_, msg.id_, 1, 'شما قادر به اخراج افراد دارای مقام نیستید !', 1, 'md')
end
else
		 chat_kick(msg.chat_id_, apki[2])
  if database:get('bot:lang:'..msg.chat_id_) then
	send(msg.chat_id_, msg.id_, 1, '_User_ *'..apki[2]..'* _Kicked._', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '👤 اشتراک : ('..apki[2]..') اخراج شد !', 1, 'md')
  	end
	end
end

	-----------------------------------------------------------------------------------------------
if text:match("^[Mm][Oo][Dd][Ll][Ii][Ss]$") and is_owner(msg.sender_user_id_, msg.chat_id_) or text:match("^[Mm][Oo][Dd][Ll][Ii][Ss][Tt]$") and is_owner(msg.sender_user_id_, msg.chat_id_) or text:match("^لیست مدیران$") and is_owner(msg.sender_user_id_, msg.chat_id_) then
local hash =  'bot:mods:'..msg.chat_id_
  local list = database:smembers(hash)
  if database:get('bot:lang:'..msg.chat_id_) then
  text = "<b>Mod List:</b>\n\n"
else
  text = "👥┇لیست مدیران گروه :\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
  end
  for k,v in pairs(list) do
  local user_info = database:hgetall('user:'..v)
if user_info and user_info.username then
local username = user_info.username
text = text.."<b>|"..k.."|</b>~⪼(@"..username..")\n"
else
text = text.."<b>|"..k.."|</b>~⪼(<code>"..v.."</code>)\n"
end
  end
  if #list == 0 then
if database:get('bot:lang:'..msg.chat_id_) then
text = "<b>Mod List is empty !</b>"
  else
text = "لیست خالیست !"
end
end
  send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
-----------------------------------------------

-----------------------------------------------
	if text:match("^[Vv][Ii][Pp][Ll][Ii][Ss][Tt]$") and is_owner(msg.sender_user_id_, msg.chat_id_) or text:match("^لیست ویژه") and is_owner(msg.sender_user_id_, msg.chat_id_) then
local hash =  'bot:vipgp:'..msg.chat_id_
	local list = database:smembers(hash)
  if database:get('bot:lang:'..msg.chat_id_) then
  text = "<b>Vip List:</b>\n\n"
else
  text = "👥┇ لیست افراد ویژه :\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
  end
	for k,v in pairs(list) do
	local user_info = database:hgetall('user:'..v)
		if user_info and user_info.username then
			local username = user_info.username
			text = text.."<b>|"..k.."|</b>~⪼(@"..username..")\n"
else
  text = text.."<b>|"..k.."|</b>~⪼(<code>"..v.."</code>)\n"
		end
	end
	if #list == 0 then
	   if database:get('bot:lang:'..msg.chat_id_) then
text = "<b>Vip List is empty !</b>"
  else
 text = "لیست خالیست !"
end
end
	send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
  end

if text:match("^[Bb][Aa][Dd][Ll][Ii][Ss][Tt]$") and is_mod(msg.sender_user_id_, msg.chat_id_) or text:match("^فیلتر لیست$") and is_mod(msg.sender_user_id_, msg.chat_id_) then
  local hash = 'bot:filters:'..msg.chat_id_
if hash then
   local names = database:hkeys(hash)
  if database:get('bot:lang:'..msg.chat_id_) then
  text = "<b>bad List:</b>\n\n"
else
  text = "⚠┇ لیست کلمات فیلتر گروه :\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
  end
  for i=1, #names do
 text = text.."<b>|"..i.."|</b>~⪼("..names[i]..")\n"
end
  if #names == 0 then
if database:get('bot:lang:'..msg.chat_id_) then
text = "<b>bad List is empty !</b>"
  else
text = "لیست خالیست"
end
end
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
 end
end
	-----------------------------------------------------------------------------------------------
	if text:match("^[Ss][Ii][Ll][Ee][Nn][Tt][Ll][Ii][Ss][Tt]$") and is_mod(msg.sender_user_id_, msg.chat_id_) or text:match("^سایلنت لیست$") and is_mod(msg.sender_user_id_, msg.chat_id_) then
local hash =  'bot:muted:'..msg.chat_id_
	local list = database:smembers(hash)
  if database:get('bot:lang:'..msg.chat_id_) then
  text = "<b>Silent List:</b>\n\n"
else
   text = "🚫┇ لیست سیاه :\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
end
for k,v in pairs(list) do
	local user_info = database:hgetall('user:'..v)
		if user_info and user_info.username then
			local username = user_info.username
			text = text.."<b>|"..k.."|</b>~⪼(@"..username..")\n"
else
  text = text.."<b>|"..k.."|</b>~⪼(<code>"..v.."</code>)\n"
		end
	end
	if #list == 0 then
	   if database:get('bot:lang:'..msg.chat_id_) then
text = "<b>Mod List is empty !</b>"
  else
text = "لیست خالیست !"
end
end
	send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
	-----------------------------------------------------------------------------------------------
	if text:match("^[Oo][Ww][Nn][Ee][Rr][Ss]$") and is_creator(msg.sender_user_id_, msg.chat_id_) or text:match("^[Oo][Ww][Nn][Ee][Rr][Ll][Ii][Ss][Tt]$") and is_creator(msg.sender_user_id_, msg.chat_id_) or text:match("^لیست مالکان$") and is_creator(msg.sender_user_id_, msg.chat_id_) then
local hash =  'bot:owners:'..msg.chat_id_
	local list = database:smembers(hash)
  if database:get('bot:lang:'..msg.chat_id_) then
  text = "<b>owner List:</b>\n\n"
else
  text = "🛄┇ لیست مالکان گروه :\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
end
for k,v in pairs(list) do
	local user_info = database:hgetall('user:'..v)
		if user_info and user_info.username then
			local username = user_info.username
			text = text.."<b>|"..k.."|</b>~⪼(@"..username..")\n"
else
  text = text.."<b>|"..k.."|</b>~⪼(<code>"..v.."</code>)\n"
		end
	end
	if #list == 0 then
	   if database:get('bot:lang:'..msg.chat_id_) then
text = "<b>owner List is empty !</b>"
  else
text = "لیست خالیست !"
end
end
	send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
  end

	if text:match("^[Cc][Rr][Ee][Aa][Tt][Oo][Rr][Ss]$") and is_sudo(msg) or text:match("^[Cc][Rr][Ee][Aa][Tt][Oo][Rr][Ll][Ii][Ss][Tt]$") and is_sudo(msg) or text:match("^لیست سازنده") and is_sudo(msg) then
local hash =  'bot:creator:'..msg.chat_id_
	local list = database:smembers(hash)
  if database:get('bot:lang:'..msg.chat_id_) then
  text = "<b>creators List:</b>\n\n"
else
  text = "🛅┇ لیست سازنده :\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
end
for k,v in pairs(list) do
	local user_info = database:hgetall('user:'..v)
		if user_info and user_info.username then
			local username = user_info.username
			text = text.."<b>|"..k.."|</b>~⪼(@"..username..")\n"
else
text = text.."<b>|"..k.."|</b>~⪼(<code>"..v.."</code>)\n"
		end
	end
	if #list == 0 then
	   if database:get('bot:lang:'..msg.chat_id_) then
text = "<b>creator List is empty !</b>"
  else
text = "لیست خالیست !"
end
end
	send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
	-----------------------------------------------------------------------------------------------
	if text:match("^[Bb][Aa][Nn][Ll][Ii][Ss][Tt]$") and is_mod(msg.sender_user_id_, msg.chat_id_) or text:match("^لیست مسدود$") and is_mod(msg.sender_user_id_, msg.chat_id_) then
local hash =  'bot:banned:'..msg.chat_id_
	local list = database:smembers(hash)
  if database:get('bot:lang:'..msg.chat_id_) then
  text = "<b>ban List:</b>\n\n"
else
  text = "⛔┇ لیست افراد مسدود :\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
end
for k,v in pairs(list) do
	local user_info = database:hgetall('user:'..v)
		if user_info and user_info.username then
			local username = user_info.username
			text = text.."<b>|"..k.."|</b>~⪼(@"..username..")\n"
else
text = text.."<b>|"..k.."|</b>~⪼(<code>"..v.."</code>)\n"
		end
	end
	if #list == 0 then
	   if database:get('bot:lang:'..msg.chat_id_) then
text = "<b>ban List is empty !</b>"
  else
text = "لیست خالیست !"
end
end
	send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end

  if msg.content_.text_:match("^[Gg][Bb][Aa][Nn][Ll][Ii][Ss][Tt]$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) or msg.content_.text_:match("^لیست بن ال$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
local hash =  'bot:gbanned:'
local list = database:smembers(hash)
  if database:get('bot:lang:'..msg.chat_id_) then
  text = "<b>Gban List:</b>\n\n"
else
  text = "⛔┇ لیست سیاه ربات :  ،\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
end
for k,v in pairs(list) do
local user_info = database:hgetall('user:'..v)
if user_info and user_info.username then
local username = user_info.username
text = text.."<b>|"..k.."|</b>~⪼(@"..username..")\n"
 else
  text = text.."<b>|"..k.."|</b>~⪼(<code>"..v.."</code>)\n"
end
end
if #list == 0 then
	   if database:get('bot:lang:'..msg.chat_id_) then
text = "<b>Gban List is empty !</b>"
  else
text = "لیست خالیست !"
end
end
	send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end

  if msg.content_.text_:match("^[Gg][Ss][Ii][Ll][Ee][Nn][Tt][Ll][Ii][Ss][Tt]$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) or msg.content_.text_:match("^لیست سایلنت ال$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
local hash =  'bot:gmuted:'
local list = database:smembers(hash)
  if database:get('bot:lang:'..msg.chat_id_) then
  text = "<b>Gban List:</b>\n\n"
else
  text = "⛔ لیست سیاه ربات :  ،\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
end
for k,v in pairs(list) do
local user_info = database:hgetall('user:'..v)
if user_info and user_info.username then
local username = user_info.username
text = text.."<b>|"..k.."|</b>~⪼(@"..username..")\n"
 else
  text = text.."<b>|"..k.."|</b>~⪼(<code>"..v.."</code>)\n"
end
end
if #list == 0 then
	   if database:get('bot:lang:'..msg.chat_id_) then
text = "<b>Gban List is empty !</b>"
  else
text = "لیست خالیست !"
end
end
	send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end

	-----------------------------------------------------------------------------------------------
if text:match("^[Ii][Dd]$") and msg.reply_to_message_id_ ~= 0 or text:match("^ایدی$") and msg.reply_to_message_id_ ~= 0 then
function id_by_reply(extra, result, success)
  send(msg.chat_id_, msg.id_, 1, "₪ شناسه : (`"..result.sender_user_id_.."`)", 1, 'md')
  end
   getMessage(msg.chat_id_, msg.reply_to_message_id_,id_by_reply)
  end
  -----------------------------------------------------------------------------------------------
local text = msg.content_.text_:gsub('ایدی','id')
if text:match("^[Ii][Dd] @(.*)$") then
	local ap = {string.match(text, "^([Ii][Dd]) @(.*)$")}
	function id_by_username(extra, result, success)
	if result.id_ then
texts = '₪ شناسه : ('..result.id_..')'
else
if database:get('bot:lang:'..msg.chat_id_) then
texts = '<code>User not found!</code>'
else
texts = 'موجود نیست !'
end
end
	   send(msg.chat_id_, msg.id_, 1, texts, 1, 'html')
end
	resolve_username(ap[2],id_by_username)
end
	-----------------------------------------------------------------------------------------------
local text = msg.content_.text_:gsub('پروفایل','getpro')
if text:match("^getpro (%d+)$") and msg.reply_to_message_id_ == 0  then
		local pronumb = {string.match(text, "^(getpro) (%d+)$")}
local function gpro(extra, result, success)
--vardump(result)
   if pronumb[2] == '1' then
   if result.photos_[0] then
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, result.photos_[0].sizes_[1].photo_.persistent_id_)
   else
if database:get('bot:lang:'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "You Have'nt Profile Photo!!", 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, "شما در این شماره پروفایلی ندارید !", 1, 'html')
end
   end
   elseif pronumb[2] == '2' then
   if result.photos_[1] then
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, result.photos_[1].sizes_[1].photo_.persistent_id_)
   else
if database:get('bot:lang:'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "You Have'nt 2 Profile Photo!!", 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, "شما در این شماره پروفایلی ندارید !", 1, 'html')
end
   end
   elseif pronumb[2] == '3' then
   if result.photos_[2] then
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, result.photos_[2].sizes_[1].photo_.persistent_id_)
   else
if database:get('bot:lang:'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "You Have'nt 3 Profile Photo!!", 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, "شما در این شماره پروفایلی ندارید !", 1, 'html')
end
   end
   elseif pronumb[2] == '4' then
if result.photos_[3] then
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, result.photos_[3].sizes_[1].photo_.persistent_id_)
   else
if database:get('bot:lang:'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "You Have'nt 4 Profile Photo!!", 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, "شما در این شماره پروفایلی ندارید !", 1, 'html')
end
   end
   elseif pronumb[2] == '5' then
   if result.photos_[4] then
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, result.photos_[4].sizes_[1].photo_.persistent_id_)
   else
if database:get('bot:lang:'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "You Have'nt 5 Profile Photo!!", 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, "شما در این شماره پروفایلی ندارید !", 1, 'html')
end
   end
   elseif pronumb[2] == '6' then
   if result.photos_[5] then
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, result.photos_[5].sizes_[1].photo_.persistent_id_)
   else
if database:get('bot:lang:'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "You Have'nt 6 Profile Photo!!", 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, "شما در این شماره پروفایلی ندارید !", 1, 'html')
end
   end
   elseif pronumb[2] == '7' then
   if result.photos_[6] then
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, result.photos_[6].sizes_[1].photo_.persistent_id_)
   else
if database:get('bot:lang:'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "You Have'nt 7 Profile Photo!!", 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, "شما در این شماره پروفایلی ندارید !", 1, 'html')
end
   end
   elseif pronumb[2] == '8' then
   if result.photos_[7] then
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, result.photos_[7].sizes_[1].photo_.persistent_id_)
   else
if database:get('bot:lang:'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "You Have'nt 8 Profile Photo!!", 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, "شما در این شماره پروفایلی ندارید !", 1, 'html')
end
   end
   elseif pronumb[2] == '9' then
   if result.photos_[8] then
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, result.photos_[8].sizes_[1].photo_.persistent_id_)
   else
if database:get('bot:lang:'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "You Have'nt 9 Profile Photo!!", 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, "شما در این شماره پروفایلی ندارید !", 1, 'html')
end
   end
   elseif pronumb[2] == '10' then
   if result.photos_[9] then
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, result.photos_[9].sizes_[1].photo_.persistent_id_)
   else
if database:get('bot:lang:'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "_You Have'nt 10 Profile Photo!!_", 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, "شما در این شماره پروفایلی ندارید !", 1, 'html')
end
   end
 else
if database:get('bot:lang:'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "*I just can get last 10 profile photos!:(*", 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, "شما در این شماره پروفایلی ندارید !", 1, 'html')
end
   end
   end
   tdcli_function ({
ID = "GetUserProfilePhotos",
user_id_ = msg.sender_user_id_,
offset_ = 0,
limit_ = pronumb[2]
  }, gpro, nil)
	end
	-----------------------------------------------------------------------------------------------
local text = msg.content_.text_:gsub('تکرار مسدود','flood ban')
	if text:match("^[Ff][Ll][Oo][Oo][Dd] [Bb][Aa][Nn] (%d+)$") and is_owner(msg.sender_user_id_, msg.chat_id_) then
	local floodmax = {string.match(text, "^([Ff][Ll][Oo][Oo][Dd] [Bb][Aa][Nn]) (%d+)$")}
	if tonumber(floodmax[2]) < 2 then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '*Wrong number*,_range is  [2-99999]_', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '🔘┇ عدد ورودی باید بین 2 الی ... باشد !', 1, 'md')
end
	else
database:set('flood:max:'..msg.chat_id_,floodmax[2])
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> Flood has been set to_ *'..floodmax[2]..'*', 1, 'md')
  else
send(msg.chat_id_, msg.id_, 1, '☑┇️تنظیم شد به ~⪼  *{'..floodmax[2]..'}*', 1, 'md')
end
	end
end

local text = msg.content_.text_:gsub('تکرار سکوت','flood mute')
	if text:match("^[Ff][Ll][Oo][Oo][Dd] [Mm][Uu][Tt][Ee] (%d+)$") and is_owner(msg.sender_user_id_, msg.chat_id_) then
	local floodmax = {string.match(text, "^([Ff][Ll][Oo][Oo][Dd] [Mm][Uu][Tt][Ee]) (%d+)$")}
	if tonumber(floodmax[2]) < 2 then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '*Wrong number*,_range is  [2-99999]_', 1, 'md')
 else
send(msg.chat_id_, msg.id_, 1, '🔘┇ عدد ورودی باید بین 2 الی ... باشد !', 1, 'md')
end
	else
database:set('flood:max:warn'..msg.chat_id_,floodmax[2])
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> Flood Warn has been set to_ *'..floodmax[2]..'*', 1, 'md')
 else
send(msg.chat_id_, msg.id_, 1, '☑┇️ننظیم شد به  ~⪼  *{'..floodmax[2]..'}*', 1, 'md')
end
	end
end
local text = msg.content_.text_:gsub('تکرار پاکسازی','flood del')
	if text:match("^[Ff][Ll][Oo][Oo][Dd] [Dd][Ee][Ll] (%d+)$") and is_owner(msg.sender_user_id_, msg.chat_id_) then
	local floodmax = {string.match(text, "^([Ff][Ll][Oo][Oo][Dd] [Dd][Ee][Ll]) (%d+)$")}
	if tonumber(floodmax[2]) < 2 then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '*Wrong number*,_range is  [2-99999]_', 1, 'md')
 else
send(msg.chat_id_, msg.id_, 1, '🔘┇ عدد ورودی باید بین 2 الی ... باشد !', 1, 'md')
end
	else
database:set('flood:max:del'..msg.chat_id_,floodmax[2])
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> Flood delete has been set to_ *'..floodmax[2]..'*', 1, 'md')
 else
send(msg.chat_id_, msg.id_, 1, '☑┇️تنظیم شد به  ~⪼  *{'..floodmax[2]..'}*', 1, 'md')
end
	end
end
local text = msg.content_.text_:gsub('اسپم پاکسازی','spam del')
if text:match("^[Ss][Pp][Aa][Mm] [Dd][Ee][Ll] (%d+)$") and is_owner(msg.sender_user_id_, msg.chat_id_) then
local sensspam = {string.match(text, "^([Ss][Pp][Aa][Mm] [Dd][Ee][Ll]) (%d+)$")}
if tonumber(sensspam[2]) < 40 then
if database:get('bot:lang:'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '*Wrong number*,_range is  [40-99999]_', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '🔘┇عدد ورودی باید از 40 الی ... باشد !', 1, 'md')
end
 else
database:set('bot:sens:spam'..msg.chat_id_,sensspam[2])
if database:get('bot:lang:'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '_> Spam has been set to_ *'..sensspam[2]..'*', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '☑┇️تنظیم شد به  ~⪼  *{'..sensspam[2]..'}*', 1, 'md')
end
end
end
local text = msg.content_.text_:gsub('اسپم اخطار','spam warn')
if text:match("^[Ss][Pp][Aa][Mm] [Ww][Aa][Rr][Nn] (%d+)$") and is_owner(msg.sender_user_id_, msg.chat_id_) then
local sensspam = {string.match(text, "^([Ss][Pp][Aa][Mm] [Ww][Aa][Rr][Nn]) (%d+)$")}
if tonumber(sensspam[2]) < 40 then
if database:get('bot:lang:'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '*Wrong number*,_range is  [40-99999]_', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '🔘┇عدد ورودی باید از 40 الی ... باشد !', 1, 'md')
end
 else
database:set('bot:sens:spam:warn'..msg.chat_id_,sensspam[2])
if database:get('bot:lang:'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '_> Spam Warn has been set to_ *'..sensspam[2]..'*', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '☑┇️تنظیم شد به  ~⪼  *{'..sensspam[2]..'}*', 1, 'md')
end
end
end

	-----------------------------------------------------------------------------------------------
local text = msg.content_.text_:gsub('زمان تکرار','flood time')
	if text:match("^[Ff][Ll][Oo][Oo][Dd] [Tt][Ii][Mm][Ee] (%d+)$") and is_owner(msg.sender_user_id_, msg.chat_id_) then
	local floodt = {string.match(text, "^([Ff][Ll][Oo][Oo][Dd] [Tt][Ii][Mm][Ee]) (%d+)$")}
	if tonumber(floodt[2]) < 1 then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '*Wrong number*,_range is  [2-99999]_', 1, 'md')
 else
send(msg.chat_id_, msg.id_, 1, '🔘┇زمان ورودی باید میان 1 الی ... باشد !', 1, 'md')
end
	else
database:set('flood:time:'..msg.chat_id_,floodt[2])
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> Flood has been set to_ *'..floodt[2]..'*', 1, 'md')
 else
   send(msg.chat_id_, msg.id_, 1, '☑┇️تنظیم شد به ~⪼  *{'..floodt[2]..'}*', 1, 'md')
end
	end
	end
	-----------------------------------------------------------------------------------------------
	if text:match("^[Ss][Ee][Tt][Ll][Ii][Nn][Kk]$") and is_mod(msg.sender_user_id_, msg.chat_id_) or text:match("^تنظیم لینک$") and is_mod(msg.sender_user_id_, msg.chat_id_) then
   database:set("bot:group:link"..msg.chat_id_, 'Waiting For Link!\nPls Send Group Link')
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '*Please Send Group Link Now!*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, '📮┇لطفا لینک گروه خود را ارسال کنید !\n', 1, 'md')
end
	end
	-----------------------------------------------------------------------------------------------
	if text:match("^[Ll][Ii][Nn][Kk]$") or text:match("^لینک$") then
  local link = database:get("bot:group:link"..msg.chat_id_)
    if link then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '<b>Group link:</b>\n'..link, 1, 'html')
 else
  send(msg.chat_id_, msg.id_, 1, '📮┇لینک گروه :\n'..link, 1, "html")
end

    else
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '*There is not link set yet. Please add one by #setlink .*', 1, 'html')
 else
  send(msg.chat_id_, msg.id_, 1, '🔘┇ لینکی ثبت نشده است !', 1, 'html')
end
    end
   end
	-----------------------------------------------------------
	if text:match("^[Ww][Ll][Cc] [Oo][Nn]$") and is_mod(msg.sender_user_id_, msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '#Done\nWelcome *Enabled* In This Supergroup.', 1, 'md')
		 database:set("bot:welcome"..msg.chat_id_,true)
	end
	if text:match("^[Ww][Ll][Cc] [Oo][Ff][Ff]$") and is_mod(msg.sender_user_id_, msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '#Done\nWelcome *Disabled* In This Supergroup.', 1, 'md')
		 database:del("bot:welcome"..msg.chat_id_)
	end

	if text:match("^خوش فعال$") and is_mod(msg.sender_user_id_, msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '☑┇فعال شد !', 1, 'md')
		 database:set("bot:welcome"..msg.chat_id_,true)
	end
	if text:match("^خوش غیرفعال$") and is_mod(msg.sender_user_id_, msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '☑┇غیرفعال شد !', 1, 'md')
		 database:del("bot:welcome"..msg.chat_id_)
	end

	if text:match("^[Ss][Ee][Tt] [Ww][Ll][Cc] (.*)$") and is_mod(msg.sender_user_id_, msg.chat_id_) then
	local welcome = {string.match(text, "^([Ss][Ee][Tt] [Ww][Ll][Cc]) (.*)$")}
   send(msg.chat_id_, msg.id_, 1, '*Welcome Msg Has Been Saved!*\nWlc Text:\n\n`'..welcome[2]..'`', 1, 'md')
		 database:set('welcome:'..msg.chat_id_,welcome[2])
	end

	if text:match("^خوش (.*)$") and is_mod(msg.sender_user_id_, msg.chat_id_) then
	local welcome = {string.match(text, "^(خوش) (.*)$")}
   send(msg.chat_id_, msg.id_, 1, '☑┇تنظیم شد به \n📜┇~⪼('..welcome[2]..')', 1, 'md')
		 database:set('welcome:'..msg.chat_id_,welcome[2])
	end

local text = msg.content_.text_:gsub('حذف خوش','del wlc')
	if text:match("^[Dd][Ee][Ll] [Ww][Ll][Cc]$") and is_mod(msg.sender_user_id_, msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '*Welcome Msg Has Been Deleted!*', 1, 'md')
 else
  send(msg.chat_id_, msg.id_, 1, '☑┇پاک شد !', 1, 'md')
end
		 database:del('welcome:'..msg.chat_id_)
	end

local text = msg.content_.text_:gsub('دریافت خوش','get wlc')
	if text:match("^[Gg][Ee][Tt] [Ww][Ll][Cc]$") and is_mod(msg.sender_user_id_, msg.chat_id_) then
	local wel = database:get('welcome:'..msg.chat_id_)
	if wel then
   send(msg.chat_id_, msg.id_, 1, '📜┇متن خوش آمد گویی \n~⪼('..wel..')', 1, 'md')
else
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, 'Welcome msg not saved!', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, '✖┇ثبت نشده است !\n', 1, 'md')
end
	end
	end
	-----------------------------------------------------------------------------------------------
local text = msg.content_.text_:gsub('فیلتر','filter')
	if text:match("^[Ff]ilter (.*)$") and is_mod(msg.sender_user_id_, msg.chat_id_) then
	local filters = {string.match(text, "^([Ff]ilter) (.*)$")}
local name = string.sub(filters[2], 1, 50)
database:hset('bot:filters:'..msg.chat_id_, name, 'filtered')
if database:get('bot:lang:'..msg.chat_id_) then
		  send(msg.chat_id_, msg.id_, 1, "*New Word baded!*\n--> `"..name.."`", 1, 'md')
else
  		  send(msg.chat_id_, msg.id_, 1, "☑┇کلمه ای به لیست فیلترینگ افزوده شد !\n🔘┇{"..name.."}", 1, 'md')
end
	end
	-----------------------------------------------------------------------------------------------
local text = msg.content_.text_:gsub('لغو فیلتر','unfilter')
	if text:match("^[Uu]nfilter (.*)$") and is_mod(msg.sender_user_id_, msg.chat_id_) then
	local rws = {string.match(text, "^([Uu]nfilter) (.*)$")}
local name = string.sub(rws[2], 1, 50)
database:hdel('bot:filters:'..msg.chat_id_, rws[2])
if database:get('bot:lang:'..msg.chat_id_) then
		  send(msg.chat_id_, msg.id_, 1, "`"..rws[2].."` *Removed From baded List!*", 1, 'md')
else
  		  send(msg.chat_id_, msg.id_, 1, "☑┇کلمه از لیست فیلترینگ حذف شد !\n🔘┇{"..rws[2].."}", 1, 'md')
end
	end
	-----------------------------------------------------------------------------------------------
local text = msg.content_.text_:gsub('فروارد','fwd')
	if text:match("^fwd$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
local gps = database:scard("bot:groups") or 0
local gpss = database:smembers("bot:groups") or 0
	local rws = {string.match(text, "^fwd$")}
	for i=1, #gpss do
		  tdcli.forwardMessages(gpss[i], msg.chat_id_,{[0] = msg.reply_to_message_id_ }, 0)
  end
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '*Done*\n_Your Msg Send to_ `'..gps..'` _Groups_', 1, 'md')
   else
send(msg.chat_id_, msg.id_, 1, '☑┇پیام شما به {'..gps..'} گروه فروارد شد ! ', 1, 'md')
end
	end

local text = msg.content_.text_:gsub('برادکست','bc')
	if text:match("^bc (.*)$") and is_sudo(msg) then
	local ssss = {string.match(text, "^(bc) (.*)$")}
if not database:get('bot:bc:groups') then
local gps = database:scard("bot:groups") or 0
local gpss = database:smembers("bot:groups") or 0
	for i=1, #gpss do
		  send(gpss[i], 0, 1, ssss[2], 1, 'html')
  end
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '*Done*\n_Your Msg Send to_ `'..gps..'` _Groups_', 1, 'md')
   else
send(msg.chat_id_, msg.id_, 1, '☑┇پیام شما به {'..gps..'} گروه ارسال شد ! ', 1, 'md')
end
else
 if database:get('bot:lang:'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '*broadcast has been Disabled*', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '☑┇ برادکست غیرفعال است ! ', 1, 'md')
end
end
	end

 local text = msg.content_.text_:gsub('ربات ها','bots')
if text:match("^[Bb][Oo][Tt][Ss]$") and is_mod(msg.sender_user_id_, msg.chat_id_) then
   local txt = {string.match(text, "^[Bb][Oo][Tt][Ss]$")}
   local function cb(extra,result,success)
   local list = result.members_
if database:get('bot:lang:'..msg.chat_id_) then
  text = '<b>List Bots group</b> : \n\n'
  else
  text = '📊┇لیست ربات ها :\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n'
  end
 local n = 0
   for k,v in pairs(list) do
 n = (n + 1)
   local user_info = database:hgetall('user:'..v.user_id_)
if user_info and user_info.username then
 local username = user_info.username
 text = text.."<b>|"..n.."|</b>~⪼(@"..username..")\n"
else
 text = text.."<b>|"..n.."|</b>~⪼(<code>"..v.user_id_.."</code>)\n"
end
   end
 send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
 end
bot.channel_get_bots(msg.chat_id_,cb)
 end
	-----------------------------------------------------------------------------------------------

if text:match("^[Nn][Uu][Mm][Bb][Ee][Rr][Ss] [Gg][Rr][Oo][Uu][Pp][Ss]$") and is_sudo(msg) or text:match("^تعداد گروه ها$") and is_sudo(msg) then
    local gps = database:scard("bot:groups")
  local users = database:scard("bot:userss")
    local allmgs = database:get("bot:allmsgs")
                if database:get('bot:lang:'..msg.chat_id_) then
                   send(msg.chat_id_, msg.id_, 1, '*Groups :* '..gps..'', 1, 'md')
                 else
                   send(msg.chat_id_, msg.id_, 1, '📊┇تعداد گروه ها  ~⪼  *{'..gps..'}*', 1, 'md')
end
end

if text:match("^[Ll][Ii][Nn][Kk][Ss] [Gg][Rr][Oo][Uu][Pp][Ss]$") or text:match("^لینک گروهان$") and is_sudo(msg) then
local gpss = database:smembers("bot:groups") or 0
local gps = database:scard("bot:groups")
if database:get('bot:lang:'..msg.chat_id_) then
text = 'Links Groups\n\n'
else
text = '📊┇لینک های ثبت شده :\n\n'
 end
 for i=1, #gpss do
local link = database:get("bot:group:link"..gpss[i])
if database:get('bot:lang:'..msg.chat_id_) then
text = text.."|"..i.."| ~⪼ "..gpss[i].."\n ~⪼ "..(link or  "not link").."\n"
else
text = text.."|"..i.."| ~⪼ "..gpss[i].."\n ~⪼ "..(link or  "ثبت نشده است !").."\n"
 end
 end
 local f = io.open('prime.txt', 'w')
 f:write(text)
 f:close()
 local SPSe = 'https://api.telegram.org/bot' .. token .. '/sendDocument'
 local curl = 'curl "' .. SPSe .. '" -F "chat_id=' .. msg.chat_id_ .. '" -F "document=@' .. 'prime.txt' .. '"'
 io.popen(curl)
 send(msg.chat_id_, msg.id_, 1, curl, 1, 'md')
 end

if  text:match("^[Mm][Ss][Gg]$") or text:match("^پیام ها$") and msg.reply_to_message_id_ == 0  then
local user_msgs = database:get('user:msgs'..msg.chat_id_..':'..msg.sender_user_id_)
if database:get('bot:lang:'..msg.chat_id_) then
 if not database:get('bot:id:mute'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "*Msgs : * `"..user_msgs.."`", 1, 'md')
else
  end
else
 if not database:get('bot:id:mute'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "📨┇پیام های دریافتی  ~⪼ *{"..user_msgs.."}*", 1, 'md')
else
  end
end
	end
	-----------------------------------------------------------------------------------------------
local text = msg.content_.text_:gsub('قفل همه','lock all s')
  	if text:match("^[Ll][Oo][Cc][Kk] [Aa][Ll][Ll] [Ss] (%d+)$") and is_mod(msg.sender_user_id_, msg.chat_id_) then
	local mutept = {string.match(text, "^[Ll][Oo][Cc][Kk] [Aa][Ll][Ll] [Ss] (%d+)$")}
		database:setex('bot:muteall'..msg.chat_id_, tonumber(mutept[1]), true)
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> Group muted for_ *'..mutept[1]..'* _seconds!_', 1, 'md')
 else
  send(msg.chat_id_, msg.id_, 1, "گروه به مدت "..mutept[1].." ثانیه قفل شد !", 1, 'md')
end
	end

local text = msg.content_.text_:gsub('قفل همه ساعت','lock all h')
if text:match("^[Ll][Oo][Cc][Kk] [Aa][Ll][Ll] [Hh]  (%d+)$") and is_mod(msg.sender_user_id_, msg.chat_id_) then
  local mutept = {string.match(text, "^[Ll][Oo][Cc][Kk] [Aa][Ll][Ll] [Hh] (%d+)$")}
  local hour = string.gsub(mutept[1], 'h', '')
  local num1 = tonumber(hour) * 3600
  local num = tonumber(num1)
database:setex('bot:muteall'..msg.chat_id_, num, true)
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, "> Lock all has been enable for "..mutept[1].." hours !", 'md')
 else
  send(msg.chat_id_, msg.id_, 1, "گروه به مدت  "..mutept[1].." ساعت قفل شد !", 'md')
end
end
	-----------------------------------------------------------------------------------------------
  	if text:match("^[Ll][Oo][Cc][Kk] (.*)$") and is_mod(msg.sender_user_id_, msg.chat_id_) or text:match("^قفل (.*)$") and is_mod(msg.sender_user_id_, msg.chat_id_) then
	local mutept = {string.match(text, "^([Ll][Oo][Cc][Kk]) (.*)$")}
	local SPS = {string.match(text, "^(قفل) (.*)$")}
local SASI_info = nil
   function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
	 if mutept[2] == "edit"and is_owner(msg.sender_user_id_, msg.chat_id_) or SPS[2] == "ویرایش" and is_owner(msg.sender_user_id_, msg.chat_id_) then
  if not database:get('editmsg'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "_> Edit Has been_ *locked*", 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل  شد !"..lockwarn.." ", 1, 'md')
end
database:set('editmsg'..msg.chat_id_,'delmsg')
  else
if database:get('bot:lang:'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '_> Lock edit is already_ *locked*', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, ""..infoo.."✅┇قفل  بود !"..lockwarn.." ", 1, 'md')
end
  end
end
end
  getUser(msg.sender_user_id_, SASI333)
  local SASI_info = nil
 function SASI333(extra,result,success)
  SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'لا يوجد معرف')..')'
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
 if mutept[2] == "bots" or SPS[2] == "ربات" then
  if not database:get('bot:bots:mute'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "_> Bots Has been_ *locked*", 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل  شد !"..lockban.." ", 1, 'md')
end
database:set('bot:bots:mute'..msg.chat_id_,true)
  else
if database:get('bot:lang:'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "_> Bots is Already_ *locked*", 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, ""..infoo.."✅┇قفل  بود !"..lockban.." ", 1, 'md')
end
  end
end
end
 getUser(msg.sender_user_id_, SASI333)

  local SASI_info = nil
 function SASI333(extra,result,success)
  SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
  local lockban = "\n🏵 تنظیم شد به روی : اخراج  ربات و فرد اد کننده "
  local infoo = "⚙️ مجری : : [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
 if mutept[2] == "bots ban" or SPS[2] == "ربات با اخراج" then
  if not database:get('bot:bots:ban'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "_> Bots Has been_ *locked*", 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل  شد !"..lockban.." ", 1, 'md')
end
database:set('bot:bots:ban'..msg.chat_id_,true)
  else
if database:get('bot:lang:'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "_> Bots is Already_ *locked*", 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, ""..infoo.."✅┇قفل  بود !"..lockban.." ", 1, 'md')
end
  end
end
end
 getUser(msg.sender_user_id_, SASI333)

local SASI_info = nil
function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
	  if mutept[2] == "flood ban" and is_owner(msg.sender_user_id_, msg.chat_id_) or SPS[2] == "فلود با اخراج" and is_owner(msg.sender_user_id_, msg.chat_id_) then
if database:get('anti-flood:'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
 send(msg.chat_id_, msg.id_, 1, '_> *Flood ban* has been *unlocked*', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل  شد !"..lockban.." ", 1, 'md')
end
database:del('anti-flood:'..msg.chat_id_)
  else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, "_> *Flood ban* is Already_ *Unlocked*", 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, ""..infoo.."✅┇قفل  بود !"..lockban.." ", 1, 'md')
end
  end
end
  end
 getUser(msg.sender_user_id_, SASI333)
local SASI_info = nil
function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
	  if mutept[2] == "flood mute" and is_owner(msg.sender_user_id_, msg.chat_id_) or SPS[2] == "فلود با احطار" and is_owner(msg.sender_user_id_, msg.chat_id_) then
if database:get('anti-flood:warn'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
 send(msg.chat_id_, msg.id_, 1, '_> *Flood mute* has been *unlocked*', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل  شد !"..lockmute.." ", 1, 'md')
end
database:del('anti-flood:warn'..msg.chat_id_)
  else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, "_> *Flood mute* is Already_ *Unlocked*", 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, ""..infoo.."✅┇قفل  بود !"..lockmute.." ", 1, 'md')
end
  end
  end
end
   getUser(msg.sender_user_id_, SASI333)
local SASI_info = nil
   function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
	  if mutept[2] == "flood del" and is_owner(msg.sender_user_id_, msg.chat_id_) or SPS[2] == "فلود" and is_owner(msg.sender_user_id_, msg.chat_id_) then
if database:get('anti-flood:del'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
 send(msg.chat_id_, msg.id_, 1, '_> *Flood del* has been *unlocked*', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل  شد !"..lockmute.." ", 1, 'md')
end
database:del('anti-flood:del'..msg.chat_id_)
  else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, "_> *Flood del* is Already_ *Unlocked*", 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, ""..infoo.."✅┇قفل  بود !"..lockmute.." ", 1, 'md')
end
  end
end
  end
 getUser(msg.sender_user_id_, SASI333)
local SASI_info = nil
function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if mutept[2] == "pin" and is_owner(msg.sender_user_id_, msg.chat_id_) or SPS[2] == "سنجاق" and is_owner(msg.sender_user_id_, msg.chat_id_) then
  if not database:get('bot:pin:mute'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "_> Pin Has been_ *locked*", 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل  شد !"..lockmute.." ", 1, 'md')
end
database:set('bot:pin:mute'..msg.chat_id_,true)
  else
if database:get('bot:lang:'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "_> Pin is Already_ *locked*", 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, ""..infoo.."✅┇قفل  بود !"..lockmute.." ", 1, 'md')
end
  end
end
  end
 getUser(msg.sender_user_id_, SASI333)
local SASI_info = nil
function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if mutept[2] == "pin warn" and is_owner(msg.sender_user_id_, msg.chat_id_) or SPS[2] == "سنجاق با اخطار" and is_owner(msg.sender_user_id_, msg.chat_id_) then
  if not database:get('bot:pin:warn'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "_> Pin warn Has been_ *locked*", 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل  شد !"..lockwarn.." ", 1, 'md')
end
database:set('bot:pin:warn'..msg.chat_id_,true)
  else
if database:get('bot:lang:'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "_> Pin warn is Already_ *locked*", 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, ""..infoo.."✅┇قفل  بود !"..lockwarn.." ", 1, 'md')
end
  end
  end
  end
 getUser(msg.sender_user_id_, SASI333)
local SASI_info = nil
   function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if mutept[2] == "media" or SPS[2] == "رسانه" then
	  if not database:get('bot:muteall'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> mute all has been_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل  شد !"..lockmute.." ", 1, 'md')
end
   database:set('bot:muteall'..msg.chat_id_,true)
else
if database:get('bot:lang:'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '_> mute all is already_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."✅┇قفل  بود !"..lockmute.." ", 1, 'md')
end
end
end
end
  getUser(msg.sender_user_id_, SASI333)
local SASI_info = nil
   function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if mutept[2] == "media warn" or SPS[2] == "رسانه با اخطار" then
	  if not database:get('bot:muteallwarn'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> mute all warn has been_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل  شد !"..lockwarn.." ", 1, 'md')
end
   database:set('bot:muteallwarn'..msg.chat_id_,true)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> mute all warn is already_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."✅┇قفل  بود !"..lockwarn.." ", 1, 'md')
end
end
end
  end
getUser(msg.sender_user_id_, SASI333)

local SASI_info = nil
   function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if mutept[2] == "media ban" or SPS[2] == "رسانه با اخراج" then
	  if not database:get('bot:muteallban'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> mute all ban has been_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل  شد !"..lockban.." ", 1, 'md')
end
   database:set('bot:muteallban'..msg.chat_id_,true)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> mute all ban is already_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."✅┇قفل  بود !"..lockban.." ", 1, 'md')
end
end

  end
end
getUser(msg.sender_user_id_, SASI333)
local SASI_info = nil
   function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if mutept[2] == "text" or SPS[2] == "متن" then
	  if not database:get('bot:text:mute'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> Text has been_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل  شد !"..lockmute.." ", 1, 'md')
end
   database:set('bot:text:mute'..msg.chat_id_,true)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> Text is already_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."✅┇قفل  بود !"..lockmute.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)

local SASI_info = nil
   function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if mutept[2] == "text ban" or SPS[2] == "متن با اخراج" then
	  if not database:get('bot:text:ban'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> Text ban has been_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل  شد !"..lockban.." ", 1, 'md')
end
   database:set('bot:text:ban'..msg.chat_id_,true)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> Text ban is already_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."✅┇قفل  بود !"..lockban.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
local SASI_info = nil
   function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if mutept[2] == "text warn" or SPS[2] == "متن با اخطار" then
	  if not database:get('bot:text:warn'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> Text ban has been_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل  شد !"..lockwarn.." ", 1, 'md')
end
   database:set('bot:text:warn'..msg.chat_id_,true)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> Text warn is already_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."✅┇قفل  بود !"..lockwarn.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
  local SASI_info = nil
   function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if mutept[2] == "inline" or SPS[2] == "دکمه شیشه ای" then
	  if not database:get('bot:inline:mute'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> inline has been_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇فعال شد !"..lockmute.." ", 1, 'md')
end
   database:set('bot:inline:mute'..msg.chat_id_,true)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> inline is already_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."✅┇قفل  بود !"..lockmute.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
  local SASI_info = nil
   function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if mutept[2] == "inline ban" or SPS[2] == "دکمه شیشه ای با اخراج" then
	  if not database:get('bot:inline:ban'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> inline ban has been_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل  شد !"..lockban.." ", 1, 'md')
end
   database:set('bot:inline:ban'..msg.chat_id_,true)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> inline ban is already_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."✅┇قفل  بود !"..lockban.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
  local SASI_info = nil
   function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if mutept[2] == "inline warn" or SPS[2] == "دکمه شیشه ای با اخطار" then
	  if not database:get('bot:inline:warn'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> inline ban has been_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل  شد !"..lockban.." ", 1, 'md')
end
   database:set('bot:inline:warn'..msg.chat_id_,true)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> inline warn is already_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."✅┇قفل  بود !"..lockban.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
  local SASI_info = nil
   function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if mutept[2] == "video note" or SPS[2] == "سلفی" then
	  if not database:get('bot:note:mute'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> video note mute has been_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."✅┇قفل  شد !"..lockmute.." ", 1, 'md')
end
   database:set('bot:note:mute'..msg.chat_id_,true)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> video note is already_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."✅┇قفل  بود !"..lockmute.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
  local SASI_info = nil
   function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if mutept[2] == "video note ban" or SPS[2] == "سلفی با اخراج" then
	  if not database:get('bot:note:ban'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> video note ban has been_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل  شد !"..lockban.." ", 1, 'md')
end
   database:set('bot:note:ban'..msg.chat_id_,true)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> video note ban is already_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."✅┇قفل  بود !"..lockban.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
  local SASI_info = nil
   function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if mutept[2] == "video note warn" or SPS[2] == "سلفی با اخطار" then
	  if not database:get('bot:note:warn'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> video note ban has been_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل  شد !"..lockban.." ", 1, 'md')
end
   database:set('bot:note:warn'..msg.chat_id_,true)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> video note warn is already_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."✅┇قفل  بود !"..lockban.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
  local SASI_info = nil
   function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"

if mutept[2] == "photo" or SPS[2] == "عکس" then
	  if not database:get('bot:photo:mute'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> photo has been_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل  شد !"..lockmute.." ", 1, 'md')
end
   database:set('bot:photo:mute'..msg.chat_id_,true)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> photo is already_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."✅┇قفل  بود !"..lockmute.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
  local SASI_info = nil
   function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if mutept[2] == "photo ban" or SPS[2] == "عکس با اخراج" then
	  if not database:get('bot:photo:ban'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> photo ban has been_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل  شد !"..lockban.." ", 1, 'md')
end
   database:set('bot:photo:ban'..msg.chat_id_,true)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> photo ban is already_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."✅┇قفل  بود !"..lockban.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
  local SASI_info = nil
   function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if mutept[2] == "photo warn" or SPS[2] == "عکس با اخطار" then
	  if not database:get('bot:photo:warn'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> photo ban has been_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل  شد !"..lockwarn.." ", 1, 'md')
end
   database:set('bot:photo:warn'..msg.chat_id_,true)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> photo warn is already_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."✅┇قفل  بود !"..lockwarn.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
  local SASI_info = nil
   function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if mutept[2] == "video" or SPS[2] == "فیلم" then
	  if not database:get('bot:video:mute'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> video has been_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل  شد !"..lockmute.." ", 1, 'md')
end
   database:set('bot:video:mute'..msg.chat_id_,true)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> video is already_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."✅┇قفل  بود !"..lockmute.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
  local SASI_info = nil
   function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if mutept[2] == "video ban" or SPS[2] == "فیلم با اخراج" then
	  if not database:get('bot:video:ban'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> video ban has been_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل  شد !"..lockban.." ", 1, 'md')
end
   database:set('bot:video:ban'..msg.chat_id_,true)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> video ban is already_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."✅┇قفل  بود !"..lockban.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
  local SASI_info = nil
   function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if mutept[2] == "video warn" or SPS[2] == "فیلم با اخطار" then
	  if not database:get('bot:video:warn'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> video ban has been_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل  شد !"..lockwarn.." ", 1, 'md')
end
   database:set('bot:video:warn'..msg.chat_id_,true)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> video warn is already_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."✅┇قفل  بود !"..lockwarn.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
  local SASI_info = nil
   function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if mutept[2] == "gif" or SPS[2] == "گیف" then
	  if not database:get('bot:gifs:mute'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> gifs has been_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل  شد !"..lockmute.." ", 1, 'md')
end
   database:set('bot:gifs:mute'..msg.chat_id_,true)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> gifs is already_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."✅┇قفل  بود !"..lockmute.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
  local SASI_info = nil
   function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if mutept[2] == "gif ban" or SPS[2] == "گیف با اخراج" then
	  if not database:get('bot:gifs:ban'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> gifs ban has been_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل  شد !"..lockban.." ", 1, 'md')
end
   database:set('bot:gifs:ban'..msg.chat_id_,true)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> gifs ban is already_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."✅┇قفل  بود !"..lockban.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
  local SASI_info = nil
   function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if mutept[2] == "gif warn" or SPS[2] == "گیف با اخطار" then
	  if not database:get('bot:gifs:warn'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> gifs ban has been_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل  شد !"..lockwarn.." ", 1, 'md')
end
   database:set('bot:gifs:warn'..msg.chat_id_,true)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> gifs warn is already_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."✅┇قفل  بود !"..lockwarn.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
  local SASI_info = nil
   function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if mutept[2] == "music" or SPS[2] == "آهنگ" then
	  if not database:get('bot:music:mute'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> music has been_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل  شد !"..lockmute.." ", 1, 'md')
end
   database:set('bot:music:mute'..msg.chat_id_,true)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> music is already_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."✅┇قفل  بود !"..lockmute.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
  local SASI_info = nil
   function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if mutept[2] == "music ban" or SPS[2] == "آهنگ با اخراج" then
	  if not database:get('bot:music:ban'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> music ban has been_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل  شد !"..lockban.." ", 1, 'md')
end
   database:set('bot:music:ban'..msg.chat_id_,true)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> music ban is already_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."✅┇قفل  بود !"..lockban.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
  local SASI_info = nil
   function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if mutept[2] == "music warn" or SPS[2] == "آهنگ با اخطار" then
	  if not database:get('bot:music:warn'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> music ban has been_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل  شد !"..lockwarn.." ", 1, 'md')
end
   database:set('bot:music:warn'..msg.chat_id_,true)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> music warn is already_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."✅┇قفل  بود !"..lockwarn.." ", 1, 'md')
end
end
end
end
   getUser(msg.sender_user_id_, SASI333)
local SASI_info = nil
function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if mutept[2] == "voice" or SPS[2] == "ویس" then
	  if not database:get('bot:voice:mute'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> voice has been_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل  شد !"..lockmute.." ", 1, 'md')
end
   database:set('bot:voice:mute'..msg.chat_id_,true)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> voice is already_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."✅┇قفل  بود !"..lockmute.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
  local SASI_info = nil
   function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if mutept[2] == "voice ban" or SPS[2] == "ویس با اخراج" then
	  if not database:get('bot:voice:ban'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> voice ban has been_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل  شد !"..lockban.." ", 1, 'md')
end
   database:set('bot:voice:ban'..msg.chat_id_,true)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> voice ban is already_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."✅┇قفل  بود !"..lockban.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
  local SASI_info = nil
   function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if mutept[2] == "voice warn" or SPS[2] == "ویس با اخطار" then
	  if not database:get('bot:voice:warn'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> voice ban has been_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل  شد !"..lockwarn.." ", 1, 'md')
end
   database:set('bot:voice:warn'..msg.chat_id_,true)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> voice warn is already_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."✅┇قفل  بود !"..lockwarn.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
  local SASI_info = nil
   function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if mutept[2] == "links" or SPS[2] == "لینک" then
	  if not database:get('bot:links:mute'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> links has been_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل  شد !"..lockmute.." ", 1, 'md')
end
   database:set('bot:links:mute'..msg.chat_id_,true)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> links is already_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."✅┇قفل  بود !"..lockmute.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
  local SASI_info = nil
   function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if mutept[2] == "links ban" or SPS[2] == "لینک با اخراج" then
	  if not database:get('bot:links:ban'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> links ban has been_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل  شد !"..lockban.." ", 1, 'md')
end
   database:set('bot:links:ban'..msg.chat_id_,true)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> links ban is already_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."✅┇قفل  بود !"..lockban.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
local SASI_info = nil
  function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"

if mutept[2] == "links warn" or SPS[2] == "لینک با اخطار" then
	  if not database:get('bot:links:warn'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> links ban has been_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل  شد !"..lockwarn.." ", 1, 'md')
end
   database:set('bot:links:warn'..msg.chat_id_,true)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> links warn is already_ *locked*', 1, 'md')
else
  send(msg.chat_id_, msg.id_, 1, ""..infoo.."✅┇قفل  بود !"..lockwarn.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
  local SASI_info = nil
   function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if mutept[2] == "location" or SPS[2] == "موقعیت مکانی" then
	  if not database:get('bot:location:mute'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> location has been_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل  شد !"..lockmute.." ", 1, 'md')
end
   database:set('bot:location:mute'..msg.chat_id_,true)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> location is already_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل بود"..lockmute.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
  local SASI_info = nil
   function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if mutept[2] == "location ban" or SPS[2] == "موقعیت مکانی با اخراج" then
	  if not database:get('bot:location:ban'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> location ban has been_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل  شد !"..lockban.." ", 1, 'md')
end
   database:set('bot:location:ban'..msg.chat_id_,true)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> location ban is already_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."✅┇قفل  بود !"..lockban.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
  local SASI_info = nil
   function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if mutept[2] == "location warn" or SPS[2] == "موقعیت مکانی با اخراج" then
	  if not database:get('bot:location:warn'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> location ban has been_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل  شد !"..lockwarn.." ", 1, 'md')
end
   database:set('bot:location:warn'..msg.chat_id_,true)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> location warn is already_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."✅┇قفل  بود !"..lockwarn.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
  local SASI_info = nil
   function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if mutept[2] == "tag" or SPS[2] == "تگ" then
	  if not database:get('bot:tag:mute'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> tag has been_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل  شد !"..lockmute.." ", 1, 'md')
end
   database:set('bot:tag:mute'..msg.chat_id_,true)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> tag is already_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."✅┇قفل  بود !"..lockmute.." ", 1, 'md')
end
end
end
end
   getUser(msg.sender_user_id_, SASI333)
local SASI_info = nil
function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if mutept[2] == "tag ban" or SPS[2] == "تگ با اخراج" then
	  if not database:get('bot:tag:ban'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> tag ban has been_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل  شد !"..lockban.." ", 1, 'md')
end
   database:set('bot:tag:ban'..msg.chat_id_,true)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> tag ban is already_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."✅┇قفل  بود !"..lockban.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
  local SASI_info = nil
   function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if mutept[2] == "tag warn" or SPS[2] == "تگ با اخطار" then
	  if not database:get('bot:tag:warn'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> tag ban has been_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل  شد !"..lockwarn.." ", 1, 'md')
end
   database:set('bot:tag:warn'..msg.chat_id_,true)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> tag warn is already_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."✅┇قفل  بود !"..lockwarn.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
  local SASI_info = nil
   function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if mutept[2] == "hashtag" or SPS[2] == "هشتگ" then
	  if not database:get('bot:hashtag:mute'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> hashtag has been_ *Locked*', 1, 'md')
else
  send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل  شد !"..lockmute.." ", 1, 'md')
end
   database:set('bot:hashtag:mute'..msg.chat_id_,true)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> hashtag is already_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."✅┇قفل  بود !"..lockmute.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
  local SASI_info = nil
   function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if mutept[2] == "hashtag ban" or SPS[2] == "هشتگ با اخراج" then
	  if not database:get('bot:hashtag:ban'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> hashtag ban has been_ *Locked*', 1, 'md')
else
  send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل  شد !"..lockban.." ", 1, 'md')
end
   database:set('bot:hashtag:ban'..msg.chat_id_,true)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> hashtag ban is already_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."✅┇قفل  بود !"..lockban.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
  local SASI_info = nil
   function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if mutept[2] == "hashtag warn" or SPS[2] == "هشتگ با اخطار" then
	  if not database:get('bot:hashtag:warn'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> hashtag ban has been_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل  شد !"..lockwarn.." ", 1, 'md')
end
   database:set('bot:hashtag:warn'..msg.chat_id_,true)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> hashtag warn is already_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."✅┇قفل  بود !"..lockwarn.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
  local SASI_info = nil
   function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if mutept[2] == "contact" or SPS[2] == "مخاطب" then
	  if not database:get('bot:contact:mute'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> contact has been_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل  شد !"..lockmute.." ", 1, 'md')
end
   database:set('bot:contact:mute'..msg.chat_id_,true)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> contact is already_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."✅┇قفل  بود !"..lockmute.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
  local SASI_info = nil
   function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if mutept[2] == "contact ban" or SPS[2] == "مخاطب با اخراج" then
	  if not database:get('bot:contact:ban'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> contact ban has been_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل  شد !"..lockban.." ", 1, 'md')
end
   database:set('bot:contact:ban'..msg.chat_id_,true)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> contact ban is already_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."✅┇قفل  بود !"..lockban.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
  local SASI_info = nil
   function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if mutept[2] == "contact warn" or SPS[2] == "مخاطب با اخطار" then
	  if not database:get('bot:contact:warn'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> contact ban has been_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل  شد !"..lockwarn.." ", 1, 'md')
end
   database:set('bot:contact:warn'..msg.chat_id_,true)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> contact warn is already_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."✅┇قفل  بود !"..lockwarn.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
  local SASI_info = nil
   function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if mutept[2] == "webpage" or SPS[2] == "وب" then
	  if not database:get('bot:webpage:mute'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> webpage has been_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل  شد !"..lockmute.." ", 1, 'md')
end
   database:set('bot:webpage:mute'..msg.chat_id_,true)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> webpage is already_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."✅┇قفل  بود !"..lockmute.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
  local SASI_info = nil
   function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if mutept[2] == "webpage ban" or SPS[2] == "وب با اخراج" then
	  if not database:get('bot:webpage:ban'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> webpage ban has been_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل  شد !"..lockban.." ", 1, 'md')
end
   database:set('bot:webpage:ban'..msg.chat_id_,true)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> webpage ban is already_ *Locked*', 1, 'md')
else
   ssend(msg.chat_id_, msg.id_, 1, ""..infoo.."✅┇قفل  بود !"..lockban.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
  local SASI_info = nil
   function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if mutept[2] == "webpage warn" or SPS[2] == "وب با اخطار" then
	  if not database:get('bot:webpage:warn'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> webpage ban has been_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل  شد !"..lockwarn.." ", 1, 'md')
end
   database:set('bot:webpage:warn'..msg.chat_id_,true)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> webpage warn is already_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."✅┇قفل  بود !"..lockwarn.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
local SASI_info = nil
 function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if mutept[2] == "persian" or SPS[2] == "فارسی" then
	  if not database:get('bot:arabic:mute'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> arabic has been_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل  شد !"..lockmute.." ", 1, 'md')
end
   database:set('bot:arabic:mute'..msg.chat_id_,true)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> arabic is already_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."✅┇قفل  بود !"..lockmute.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
  local SASI_info = nil
   function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if mutept[2] == "persian ban" or SPS[2] == "فارسی با اخراج" then
	  if not database:get('bot:arabic:ban'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> arabic ban has been_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل  شد !"..lockban.." ", 1, 'md')
end
   database:set('bot:arabic:ban'..msg.chat_id_,true)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> arabic ban is already_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."✅┇قفل  بود !"..lockban.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
  local SASI_info = nil
   function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if mutept[2] == "persian warn" or SPS[2] == "فارسی با اخطار" then
	  if not database:get('bot:arabic:warn'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> arabic ban has been_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل  شد !"..lockwarn.." ", 1, 'md')
end
   database:set('bot:arabic:warn'..msg.chat_id_,true)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> arabic warn is already_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."✅┇قفل  بود !"..lockwarn.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
  local SASI_info = nil
   function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if mutept[2] == "english" or SPS[2] == "انگلیسی" then
	  if not database:get('bot:english:mute'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> english has been_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل  شد !"..lockmute.." ", 1, 'md')
end
   database:set('bot:english:mute'..msg.chat_id_,true)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> english is already_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."✅┇قفل  بود !"..lockmute.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
  local SASI_info = nil
   function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if mutept[2] == "english ban" or SPS[2] == "انگلیسی با اخراج" then
	  if not database:get('bot:text:ban'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> english ban has been_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل  شد !"..lockban.." ", 1, 'md')
end
   database:set('bot:english:ban'..msg.chat_id_,true)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> english ban is already_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."✅┇قفل  بود !"..lockban.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
  local SASI_info = nil
   function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if mutept[2] == "english warn" or SPS[2] == "انگلیسی با اخطار" then
	  if not database:get('bot:english:warn'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> english ban has been_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل  شد !"..lockwarn.." ", 1, 'md')
end
   database:set('bot:english:warn'..msg.chat_id_,true)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> english warn is already_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."✅┇قفل  بود !"..lockwarn.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
  local SASI_info = nil
   function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if mutept[2] == "spam del" or SPS[2] == "اسپم" then
	  if not database:get('bot:spam:mute'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> spam has been_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل  شد !"..lockmute.." ", 1, 'md')
end
   database:set('bot:spam:mute'..msg.chat_id_,true)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> spam is already_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."✅┇قفل  بود !"..lockmute.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
  local SASI_info = nil
   function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if mutept[2] == "spam warn" or SPS[2] == "اسپم با اخطار" then
	  if not database:get('bot:spam:warn'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> spam ban has been_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل  شد !"..lockwarn.." ", 1, 'md')
end
   database:set('bot:spam:warn'..msg.chat_id_,true)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> spam warn is already_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."✅┇قفل  بود !"..lockwarn.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
  local SASI_info = nil
   function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if mutept[2] == "sticker" or SPS[2] == "استیکر" then
	  if not database:get('bot:sticker:mute'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> sticker has been_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل  شد !"..lockmute.." ", 1, 'md')
end
   database:set('bot:sticker:mute'..msg.chat_id_,true)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> sticker is already_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."✅┇قفل  بود !"..lockmute.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
  local SASI_info = nil
   function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if mutept[2] == "sticker ban" or SPS[2] == "استیکر با اخراج" then
	  if not database:get('bot:sticker:ban'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> sticker ban has been_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل  شد !"..lockban.." ", 1, 'md')
end
   database:set('bot:sticker:ban'..msg.chat_id_,true)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> sticker ban is already_ *Locked*', 1, 'md')
else
  send(msg.chat_id_, msg.id_, 1, ""..infoo.."✅┇قفل  بود !"..lockban.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
  local SASI_info = nil
   function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if mutept[2] == "sticker warn" or SPS[2] == "استیکر با اخطار" then
	  if not database:get('bot:sticker:warn'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> sticker ban has been_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل  شد !"..lockwarn.." ", 1, 'md')
end
   database:set('bot:sticker:warn'..msg.chat_id_,true)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> sticker warn is already_ *Locked*', 1, 'md')
else
  send(msg.chat_id_, msg.id_, 1, ""..infoo.."✅┇قفل  بود !"..lockwarn.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
local SASI_info = nil
function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if mutept[2] == "file" or SPS[2] == "فایل" then
if not database:get('bot:document:mute'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> file has been_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل  شد !"..lockmute.." ", 1, 'md')
end
   database:set('bot:document:mute'..msg.chat_id_,true)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> file is already_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."✅┇قفل  بود !"..lockmute.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
  local SASI_info = nil
   function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if mutept[2] == "file ban" or SPS[2] == "فایل با اخراج" then
	  if not database:get('bot:document:ban'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> file ban has been_ *Locked*', 1, 'md')
else
  send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل  شد !"..lockban.." ", 1, 'md')
end
   database:set('bot:document:ban'..msg.chat_id_,true)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> file ban is already_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."✅┇قفل  بود !"..lockban.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
  local SASI_info = nil
   function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if mutept[2] == "file warn" or SPS[2] == "فایل با اخطار" then
	  if not database:get('bot:document:warn'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> file ban has been_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل  شد !"..lockwarn.." ", 1, 'md')
end
   database:set('bot:document:warn'..msg.chat_id_,true)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> file warn is already_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."✅┇قفل  بود !"..lockwarn.." ", 1, 'md')
end
end
  end
  end
  getUser(msg.sender_user_id_, SASI333)
  local SASI_info = nil
function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"

if mutept[2] == "markdown" or SPS[2] == "منشن" then
	  if not database:get('bot:markdown:mute'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> markdown has been_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل  شد !"..lockmute.." ", 1, 'md')
end
   database:set('bot:markdown:mute'..msg.chat_id_,true)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> markdown is already_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."✅┇قفل  بود !"..lockmute.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
  local SASI_info = nil
   function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if mutept[2] == "markdown ban" or SPS[2] == "منشن با اخراج" then
	  if not database:get('bot:markdown:ban'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> markdown ban has been_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل  شد !"..lockban.." ", 1, 'md')
end
   database:set('bot:markdown:ban'..msg.chat_id_,true)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> markdown ban is already_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."✅┇قفل  بود !"..lockban.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
  local SASI_info = nil
   function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if mutept[2] == "markdown warn" or SPS[2] == "منشن با احطار" then
	  if not database:get('bot:markdown:warn'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> markdown ban has been_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل  شد !"..lockwarn.." ", 1, 'md')
end
   database:set('bot:markdown:warn'..msg.chat_id_,true)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> markdown warn is already_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."✅┇قفل  بود !"..lockwarn.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
local SASI_info = nil
 function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"

	  if mutept[2] == "service" or SPS[2] == "سرویس تلگرام" then
	  if not database:get('bot:tgservice:mute'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> tgservice has been_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل  شد !"..lockmute.." ", 1, 'md')
end
   database:set('bot:tgservice:mute'..msg.chat_id_,true)
 else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> tgservice is already_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."✅┇قفل  بود !"..lockmute.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
  local SASI_info = nil
   function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if mutept[2] == "fwd" or SPS[2] == "فروارد" then
	  if not database:get('bot:forward:mute'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> forward has been_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل  شد !"..lockmute.." ", 1, 'md')
end
   database:set('bot:forward:mute'..msg.chat_id_,true)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> forward is already_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."✅┇قفل  بود !"..lockmute.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
  local SASI_info = nil
   function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if mutept[2] == "fwd ban" or SPS[2] == "فروارد با اخراج" then
	  if not database:get('bot:forward:ban'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> forward ban has been_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل  شد !"..lockban.." ", 1, 'md')
end
   database:set('bot:forward:ban'..msg.chat_id_,true)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> forward ban is already_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."✅┇قفل  بود !"..lockban.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
  local SASI_info = nil
   function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if mutept[2] == "fwd warn" or SPS[2] == "فروارد با اخطار" then
	  if not database:get('bot:forward:warn'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> forward ban has been_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل  شد !"..lockwarn.." ", 1, 'md')
end
   database:set('bot:forward:warn'..msg.chat_id_,true)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> forward warn is already_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."✅┇قفل  بود !"..lockwarn.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
  local SASI_info = nil
   function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if mutept[2] == "cmd" or SPS[2] == "دستورات" then
	  if not database:get('bot:cmd:mute'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> cmd has been_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل  شد !"..lockmute.." ", 1, 'md')
end
   database:set('bot:cmd:mute'..msg.chat_id_,true)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> cmd is already_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."✅┇قفل  بود !"..lockmute.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
  local SASI_info = nil
   function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if mutept[2] == "cmd ban" or SPS[2] == "دستورات با اخراج" then
	  if not database:get('bot:cmd:ban'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> cmd ban has been_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل  شد !"..lockban.." ", 1, 'md')
end
   database:set('bot:cmd:ban'..msg.chat_id_,true)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> cmd ban is already_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."✅┇قفل  بود !"..lockban.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
  local SASI_info = nil
   function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if mutept[2] == "cmd warn" or SPS[2] == "دستورات با اخطار" then
	  if not database:get('bot:cmd:warn'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> cmd ban has been_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل  شد !"..lockwarn.." ", 1, 'md')
end
   database:set('bot:cmd:warn'..msg.chat_id_,true)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> cmd warn is already_ *Locked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."✅┇قفل  بود !"..lockwarn.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
	end
	-----------------------------------------------------------------------------------------------
  	if text:match("^[Uu][Nn][Ll][Oo][Cc][Kk] (.*)$") and is_mod(msg.sender_user_id_, msg.chat_id_) or text:match("^بازکردن (.*)$") and is_mod(msg.sender_user_id_, msg.chat_id_) then
	local unmutept = {string.match(text, "^([Uu][Nn][Ll][Oo][Cc][Kk]) (.*)$")}
	local UNSPS = {string.match(text, "^(بازکردن) (.*)$")}
	local SASI_info = nil
function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockwarn = "\n🏵حالت : اخطار "
local infoo = "⚙️ مجری : : [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if unmutept[2] == "edit" and is_owner(msg.sender_user_id_, msg.chat_id_) or UNSPS[2] == "ویرایش" and is_owner(msg.sender_user_id_, msg.chat_id_) then
  if database:get('editmsg'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, "_> Edit Has been_ *Unlocked*", 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز شد !"..lockwarn.." ", 1, 'md')
end
database:del('editmsg'..msg.chat_id_)
  else
if database:get('bot:lang:'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '_> Lock edit is already_ *Unlocked*', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز بود !"..lockwarn.." ", 1, 'md')
end
  end
end
  end
getUser(msg.sender_user_id_, SASI333)
  local SASI_info = nil
 function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockwarn = "\n🏵تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری : : [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if unmutept[2] == "bots" or UNSPS[2] == "ربات" then
  if database:get('bot:bots:mute'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, "_> Bots Has been_ *Unlocked*", 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز شد !"..lockban.." ", 1, 'md')
end
database:del('bot:bots:mute'..msg.chat_id_)
  else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, "_> Bots is Already_ *Unlocked*", 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز بود !"..lockban.." ", 1, 'md')
end
  end
end
  end
  getUser(msg.sender_user_id_, SASI333)
   local SASI_info = nil
function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockwarn = "\n🏵تنظیم شد به روی : اخراج  فرد اد کننده "
local infoo = "⚙️ مجری : : [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if unmutept[2] == "bots ban" or UNSPS[2] == "ربات با اخراج" then
  if database:get('bot:bots:ban'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, "_> Bots ban Has been_ *Unlocked*", 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز شد !"..lockban.." ", 1, 'md')
end
database:del('bot:bots:ban'..msg.chat_id_)
  else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, "_> Bots ban is Already_ *Unlocked*", 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز بود !"..lockban.." ", 1, 'md')
end
  end
end
  end
  getUser(msg.sender_user_id_, SASI333)

local SASI_info = nil
 function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
	  if unmutept[2] == "flood ban" and is_owner(msg.sender_user_id_, msg.chat_id_) or UNSPS[2] == "فلود با اخراج" and is_owner(msg.sender_user_id_, msg.chat_id_) then
if not database:get('anti-flood:'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
 send(msg.chat_id_, msg.id_, 1, '_> *Flood ban* has been *unlocked*', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز شد !"..lockban.." ", 1, 'md')
end
 database:set('anti-flood:'..msg.chat_id_,true)
  else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, "_> *Flood ban* is Already_ *Unlocked*", 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز بود !"..lockban.." ", 1, 'md')
end
  end
end
  end
   getUser(msg.sender_user_id_, SASI333)


local SASI_info = nil
 function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockwarn = "\n🏵حالت : همه حالات"
local infoo = "⚙️ مجری : : [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
	  if unmutept[2] == "flood all" and is_owner(msg.sender_user_id_, msg.chat_id_) or UNSPS[2] == "فلود همه" and is_owner(msg.sender_user_id_, msg.chat_id_) then
if not database:get('anti-flood:'..msg.chat_id_) then
if not database:get('anti-flood:warn'..msg.chat_id_) then
if not database:get('anti-flood:del'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
 send(msg.chat_id_, msg.id_, 1, '_> *Flood ban* has been *unlocked*', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز شد !"..lockmute.." ", 1, 'md')
end
database:set('anti-flood:'..msg.chat_id_,true)
database:set('anti-flood:warn'..msg.chat_id_,true)
database:set('anti-flood:del'..msg.chat_id_,true)
  else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, "_> *Flood ban* is Already_ *Unlocked*", 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز بود !"..lockmute.." ", 1, 'md')
end
  end
  end
  end
  end
  end

   getUser(msg.sender_user_id_, SASI333)

 local SASI_info = nil
  function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
	  if unmutept[2] == "flood mute" and is_owner(msg.sender_user_id_, msg.chat_id_) or UNSPS[2] == "فلود با اخطار" and is_owner(msg.sender_user_id_, msg.chat_id_) then
if not database:get('anti-flood:warn'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
 send(msg.chat_id_, msg.id_, 1, '_> *Flood mute* has been *unlocked*', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز شد !"..lockmute.." ", 1, 'md')
end
 database:set('anti-flood:warn'..msg.chat_id_,true)
  else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, "_> *Flood mute* is Already_ *Unlocked*", 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز بود !"..lockmute.." ", 1, 'md')
end
  end
  end
end
getUser(msg.sender_user_id_, SASI333)

   local SASI_info = nil
function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
	  if unmutept[2] == "flood del" and is_owner(msg.sender_user_id_, msg.chat_id_) or UNSPS[2] == "فلود" and is_owner(msg.sender_user_id_, msg.chat_id_) then
if not database:get('anti-flood:del'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
 send(msg.chat_id_, msg.id_, 1, '_> *Flood del* has been *unlocked*', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز شد !"..lockmute.." ", 1, 'md')
end
 database:set('anti-flood:del'..msg.chat_id_,true)
  else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, "_> *Flood del* is Already_ *Unlocked*", 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز بود !"..lockmute.." ", 1, 'md')
end
  end
end
   end
   getUser(msg.sender_user_id_, SASI333)
local SASI_info = nil
function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if unmutept[2] == "pin" and is_owner(msg.sender_user_id_, msg.chat_id_) or UNSPS[2] == "سنجاق" and is_owner(msg.sender_user_id_, msg.chat_id_) then
  if database:get('bot:pin:mute'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, "_> Pin Has been_ *Unlocked*", 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز شد !"..lockmute.." ", 1, 'md')
end
database:del('bot:pin:mute'..msg.chat_id_)
  else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, "_> Pin is Already_ *Unlocked*", 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز بود !"..lockmute.." ", 1, 'md')
end
  end
end
  end
  getUser(msg.sender_user_id_, SASI333)
  local SASI_info = nil
  function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if unmutept[2] == "pin warn" and is_owner(msg.sender_user_id_, msg.chat_id_) or UNSPS[2] == "سنجاق با اخطار" and is_owner(msg.sender_user_id_, msg.chat_id_) then
  if database:get('bot:pin:warn'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, "_> Pin warn Has been_ *Unlocked*", 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز شد !"..lockwarn.." ", 1, 'md')
end
database:del('bot:pin:warn'..msg.chat_id_)
  else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, "_> Pin warn is Already_ *Unlocked*", 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز بود !"..lockwarn.." ", 1, 'md')
end
  end

  end
end
getUser(msg.sender_user_id_, SASI333)
	local SASI_info = nil
 function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if unmutept[2] == "media" or UNSPS[2] == "رسانه" then
	  if database:get('bot:muteall'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> mute all has been_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز شد !"..lockmute.." ", 1, 'md')
end
   database:del('bot:muteall'..msg.chat_id_)
else
if database:get('bot:lang:'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '_> mute all is already_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز بود !"..lockmute.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
 local SASI_info = nil
function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if unmutept[2] == "media warn" or UNSPS[2] == "رسانه با اخطار" then
	  if database:get('bot:muteallwarn'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> mute all warn has been_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز شد !"..lockwarn.." ", 1, 'md')
end
   database:del('bot:muteallwarn'..msg.chat_id_)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> mute all warn is already_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز بود !"..lockwarn.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
 local SASI_info = nil
 function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if unmutept[2] == "media ban" or UNSPS[2] == "رسانه با اخراج" then
	  if database:get('bot:muteallban'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> mute all ban has been_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز شد !"..lockban.." ", 1, 'md')
end
   database:del('bot:muteallban'..msg.chat_id_)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> mute all ban is already_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز بود !"..lockban.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
 local SASI_info = nil
 function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if unmutept[2] == "text" or UNSPS[2] == "متن" then
	  if database:get('bot:text:mute'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> Text has been_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز شد !"..lockmute.." ", 1, 'md')
end
   database:del('bot:text:mute'..msg.chat_id_)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> Text is already_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز بود !"..lockmute.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
 local SASI_info = nil
 function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if unmutept[2] == "text ban" or UNSPS[2] == "متن با اخراج" then
	  if database:get('bot:text:ban'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> Text ban has been_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز شد !"..lockban.." ", 1, 'md')
end
   database:del('bot:text:ban'..msg.chat_id_)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> Text ban is already_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز بود !"..lockban.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
 local SASI_info = nil
 function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if unmutept[2] == "text warn" or UNSPS[2] == "متن با اخطار" then
	  if database:get('bot:text:warn'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> Text ban has been_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز شد !"..lockwarn.." ", 1, 'md')
end
   database:del('bot:text:warn'..msg.chat_id_)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> Text warn is already_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز بود !"..lockwarn.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
 local SASI_info = nil
 function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if unmutept[2] == "video note" or UNSPS[2] == "سلفی" then
	  if database:get('bot:note:mute'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> video note has been_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز شد !"..lockmute.." ", 1, 'md')
end
   database:del('bot:note:mute'..msg.chat_id_)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> video note is already_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز بود !"..lockmute.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
 local SASI_info = nil
 function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if unmutept[2] == "video note ban" or UNSPS[2] == "سلفی با اخراج" then
	  if database:get('bot:note:ban'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> video note ban has been_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز شد !"..lockban.." ", 1, 'md')
end
   database:del('bot:note:ban'..msg.chat_id_)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> video note ban is already_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز بود !"..lockban.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
 local SASI_info = nil
 function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if unmutept[2] == "video note warn" or UNSPS[2] == "سلفی با اخطار" then
	  if database:get('bot:note:warn'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> video note ban has been_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز شد !"..lockwarn.." ", 1, 'md')
end
   database:del('bot:note:warn'..msg.chat_id_)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> video note warn is already_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز بود !"..lockwarn.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
 local SASI_info = nil
 function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if unmutept[2] == "inline" or UNSPS[2] == "دکمه شیشه ای" then
	  if database:get('bot:inline:mute'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> inline has been_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز شد !"..lockmute.." ", 1, 'md')
end
   database:del('bot:inline:mute'..msg.chat_id_)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> inline is already_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز بود !"..lockmute.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
 local SASI_info = nil
 function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if unmutept[2] == "inline ban" or UNSPS[2] == "دکمه شیشه ای با اخراج" then
	  if database:get('bot:inline:ban'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> inline ban has been_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز شد !"..lockban.." ", 1, 'md')
end
   database:del('bot:inline:ban'..msg.chat_id_)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> inline ban is already_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز بود !"..lockban.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
 local SASI_info = nil
 function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if unmutept[2] == "inline warn" or UNSPS[2] == "دکمه شیشه ای با اخطار" then
	  if database:get('bot:inline:warn'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> inline ban has been_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز شد !"..lockwarn.." ", 1, 'md')
end
   database:del('bot:inline:warn'..msg.chat_id_)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> inline warn is already_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز بود !"..lockwarn.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
 local SASI_info = nil
 function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if unmutept[2] == "photo" or UNSPS[2] == "عکس" then
	  if database:get('bot:photo:mute'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> photo has been_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز شد !"..lockmute.." ", 1, 'md')
end
   database:del('bot:photo:mute'..msg.chat_id_)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> photo is already_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز بود !"..lockmute.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
 local SASI_info = nil
 function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if unmutept[2] == "photo ban" or UNSPS[2] == "عکس با اخراج" then
	  if database:get('bot:photo:ban'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> photo ban has been_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز شد !"..lockban.." ", 1, 'md')
end
   database:del('bot:photo:ban'..msg.chat_id_)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> photo ban is already_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز بود !"..lockban.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
 local SASI_info = nil
 function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if unmutept[2] == "photo warn" or UNSPS[2] == "عکس با اخطار" then
	  if database:get('bot:photo:warn'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> photo ban has been_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز شد !"..lockban.." ", 1, 'md')
end
   database:del('bot:photo:warn'..msg.chat_id_)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> photo warn is already_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز بود !"..lockban.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
 local SASI_info = nil
 function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if unmutept[2] == "video" or UNSPS[2] == "فیلم" then
	  if database:get('bot:video:mute'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> video has been_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز شد !"..lockmute.." ", 1, 'md')
end
   database:del('bot:video:mute'..msg.chat_id_)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> video is already_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز بود !"..lockmute.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
 local SASI_info = nil
 function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if unmutept[2] == "video ban" or UNSPS[2] == "فیلم با اخراج" then
	  if database:get('bot:video:ban'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> video ban has been_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز شد !"..lockban.." ", 1, 'md')
end
   database:del('bot:video:ban'..msg.chat_id_)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> video ban is already_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز بود !"..lockban.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
 local SASI_info = nil
 function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if unmutept[2] == "video warn" or UNSPS[2] == "فیلم با اخطار" then
	  if database:get('bot:video:warn'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> video ban has been_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز شد !"..lockwarn.." ", 1, 'md')
end
   database:del('bot:video:warn'..msg.chat_id_)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> video warn is already_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز بود !"..lockwarn.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
 local SASI_info = nil
 function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if unmutept[2] == "gif" or UNSPS[2] == "گیف" then
	  if database:get('bot:gifs:mute'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> gifs has been_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز شد !"..lockmute.." ", 1, 'md')
end
   database:del('bot:gifs:mute'..msg.chat_id_)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> gifs is already_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز بود !"..lockmute.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
 local SASI_info = nil
 function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if unmutept[2] == "gif ban" or UNSPS[2] == "گیف با اخراج" then
	  if database:get('bot:gifs:ban'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> gifs ban has been_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز شد !"..lockban.." ", 1, 'md')
end
   database:del('bot:gifs:ban'..msg.chat_id_)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> gifs ban is already_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز بود !"..lockban.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
 local SASI_info = nil
 function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if unmutept[2] == "gif warn" or UNSPS[2] == "گیف با اخطار" then
	  if database:get('bot:gifs:warn'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> gifs ban has been_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز شد !"..lockwarn.." ", 1, 'md')
end
   database:del('bot:gifs:warn'..msg.chat_id_)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> gifs warn is already_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز بود !"..lockwarn.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
 local SASI_info = nil
 function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if unmutept[2] == "music" or UNSPS[2] == "آهنگ" then
	  if database:get('bot:music:mute'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> music has been_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز شد !"..lockmute.." ", 1, 'md')
end
   database:del('bot:music:mute'..msg.chat_id_)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> music is already_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز بود !"..lockmute.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
 local SASI_info = nil
 function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if unmutept[2] == "music ban" or UNSPS[2] == "آهنگ با اخراج" then
	  if database:get('bot:music:ban'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> music ban has been_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز شد !"..lockban.." ", 1, 'md')
end
   database:del('bot:music:ban'..msg.chat_id_)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> music ban is already_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز بود !"..lockban.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
 local SASI_info = nil
 function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if unmutept[2] == "music warn" or UNSPS[2] == "آ]«گ با اخطار" then
	  if database:get('bot:music:warn'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> music ban has been_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز شد !"..lockwarn.." ", 1, 'md')
end
   database:del('bot:music:warn'..msg.chat_id_)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> music warn is already_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز بود !"..lockwarn.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
 local SASI_info = nil
 function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if unmutept[2] == "voice" or UNSPS[2] == "ویس" then
	  if database:get('bot:voice:mute'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> voice has been_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز شد !"..lockmute.." ", 1, 'md')
end
   database:del('bot:voice:mute'..msg.chat_id_)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> voice is already_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز بود !"..lockmute.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
 local SASI_info = nil
 function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if unmutept[2] == "voice ban" or UNSPS[2] == "ویس با اخراج" then
	  if database:get('bot:voice:ban'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> voice ban has been_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز شد !"..lockban.." ", 1, 'md')
end
   database:del('bot:voice:ban'..msg.chat_id_)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> voice ban is already_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز بود !"..lockban.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
 local SASI_info = nil
 function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if unmutept[2] == "voice warn" or UNSPS[2] == "ویس با اخطار" then
	  if database:get('bot:voice:warn'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> voice ban has been_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز شد !"..lockwarn.." ", 1, 'md')
end
   database:del('bot:voice:warn'..msg.chat_id_)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> voice warn is already_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز بود !"..lockwarn.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
 local SASI_info = nil
 function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if unmutept[2] == "links" or UNSPS[2] == "لینک" then
	  if database:get('bot:links:mute'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> links has been_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز شد !"..lockmute.." ", 1, 'md')
end
   database:del('bot:links:mute'..msg.chat_id_)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> links is already_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز بود !"..lockmute.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
 local SASI_info = nil
 function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if unmutept[2] == "links ban" or UNSPS[2] == "لینک با اخراج" then
	  if database:get('bot:links:ban'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> links ban has been_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز شد !"..lockban.." ", 1, 'md')
end
   database:del('bot:links:ban'..msg.chat_id_)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> links ban is already_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز بود !"..lockban.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
 local SASI_info = nil
 function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if unmutept[2] == "links warn" or UNSPS[2] == "لینک با اخطار" then
	  if database:get('bot:links:warn'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> links ban has been_ *unLocked*', 1, 'md')
else
  send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز شد !"..lockwarn.." ", 1, 'md')
end
   database:del('bot:links:warn'..msg.chat_id_)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> links warn is already_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز بود !"..lockwarn.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
 local SASI_info = nil
 function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if unmutept[2] == "location" or UNSPS[2] == "موقعیت مکانی" then
	  if database:get('bot:location:mute'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> location has been_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز شد !"..lockmute.." ", 1, 'md')
end
   database:del('bot:location:mute'..msg.chat_id_)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> location is already_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز بود !"..lockmute.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
 local SASI_info = nil
 function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if unmutept[2] == "location ban" or UNSPS[2] == "موقعیت مکانی با اخراج" then
	  if database:get('bot:location:ban'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> location ban has been_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز شد !"..lockban.." ", 1, 'md')
end
   database:del('bot:location:ban'..msg.chat_id_)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> location ban is already_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز بود !"..lockban.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
 local SASI_info = nil
 function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if unmutept[2] == "location warn" or UNSPS[2] == "موقعیت مکانی با اخطار" then
	  if database:get('bot:location:warn'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> location ban has been_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز شد !"..lockwarn.." ", 1, 'md')
end
   database:del('bot:location:warn'..msg.chat_id_)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> location warn is already_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز بود !"..lockwarn.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
 local SASI_info = nil
 function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if unmutept[2] == "tag" or UNSPS[2] == "تگ" then
	  if database:get('bot:tag:mute'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> tag has been_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز شد !"..lockmute.." ", 1, 'md')
end
   database:del('bot:tag:mute'..msg.chat_id_)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> tag is already_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز بود !"..lockmute.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
 local SASI_info = nil
 function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if unmutept[2] == "tag ban" or UNSPS[2] == "تگ با اخراج" then
	  if database:get('bot:tag:ban'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> tag ban has been_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز شد !"..lockban.." ", 1, 'md')
end
   database:del('bot:tag:ban'..msg.chat_id_)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> tag ban is already_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز بود !"..lockban.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
 local SASI_info = nil
 function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if unmutept[2] == "tag warn" or UNSPS[2] == "تگ با اخطار" then
	  if database:get('bot:tag:warn'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> tag ban has been_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز شد !"..lockwarn.." ", 1, 'md')
end
   database:del('bot:tag:warn'..msg.chat_id_)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> tag warn is already_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز بود !"..lockwarn.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
 local SASI_info = nil
 function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if unmutept[2] == "hashtag" or UNSPS[2] == "هشتگ" then
	  if database:get('bot:hashtag:mute'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> hashtag has been_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز شد !"..lockmute.." ", 1, 'md')
end
   database:del('bot:hashtag:mute'..msg.chat_id_)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> hashtag is already_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز بود !"..lockmute.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
 local SASI_info = nil
 function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if unmutept[2] == "hashtag ban" or UNSPS[2] == "هشتگ با اخراج" then
	  if database:get('bot:hashtag:ban'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> hashtag ban has been_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز شد !"..lockban.." ", 1, 'md')
end
   database:del('bot:hashtag:ban'..msg.chat_id_)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> hashtag ban is already_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز بود !"..lockban.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
 local SASI_info = nil
 function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if unmutept[2] == "hashtag warn" or UNSPS[2] == "هشتگ با اخطار" then
	  if database:get('bot:hashtag:warn'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> hashtag ban has been_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز شد !"..lockwarn.." ", 1, 'md')
end
   database:del('bot:hashtag:warn'..msg.chat_id_)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> hashtag warn is already_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز بود !"..lockwarn.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
 local SASI_info = nil
 function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if unmutept[2] == "contact" or UNSPS[2] == "مخاطب" then
	  if database:get('bot:contact:mute'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> contact has been_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز شد !"..lockmute.." ", 1, 'md')
end
   database:del('bot:contact:mute'..msg.chat_id_)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> contact is already_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز بود !"..lockmute.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
 local SASI_info = nil
 function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if unmutept[2] == "contact ban" or UNSPS[2] == "مخاطب با اخراج" then
	  if database:get('bot:contact:ban'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> contact ban has been_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز شد !"..lockban.." ", 1, 'md')
end
   database:del('bot:contact:ban'..msg.chat_id_)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> contact ban is already_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز بود !"..lockban.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
 local SASI_info = nil
 function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if unmutept[2] == "contact warn" or UNSPS[2] == "مخاطب با اخطار" then
	  if database:get('bot:contact:warn'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> contact ban has been_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز شد !"..lockwarn.." ", 1, 'md')
end
   database:del('bot:contact:warn'..msg.chat_id_)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> contact warn is already_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز بود !"..lockwarn.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
 local SASI_info = nil
 function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if unmutept[2] == "webpage" or UNSPS[2] == "وب" then
	  if database:get('bot:webpage:mute'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> webpage has been_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز شد !"..lockmute.." ", 1, 'md')
end
   database:del('bot:webpage:mute'..msg.chat_id_)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> webpage is already_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز بود !"..lockmute.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
 local SASI_info = nil
 function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if unmutept[2] == "webpage ban" or UNSPS[2] == "وب با اخراج" then
	  if database:get('bot:webpage:ban'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> webpage ban has been_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز شد !"..lockban.." ", 1, 'md')
end
   database:del('bot:webpage:ban'..msg.chat_id_)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> webpage ban is already_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز بود !"..lockban.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
 local SASI_info = nil
 function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if unmutept[2] == "webpage warn" or UNSPS[2] == "وب با اخطار" then
	  if database:get('bot:webpage:warn'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> webpage ban has been_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز شد !"..lockwarn.." ", 1, 'md')
end
   database:del('bot:webpage:warn'..msg.chat_id_)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> webpage warn is already_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز بود !"..lockwarn.." ", 1, 'md')
end
end
end
end
  getUser(msg.sender_user_id_, SASI333)
local SASI_info = nil
   function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if unmutept[2] == "persian" or UNSPS[2] == "فارسی" then
	  if database:get('bot:arabic:mute'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> arabic has been_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز شد !"..lockmute.." ", 1, 'md')
end
   database:del('bot:arabic:mute'..msg.chat_id_)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> arabic is already_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز بود !"..lockmute.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
 local SASI_info = nil
 function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if unmutept[2] == "persian ban" or UNSPS[2] == "فارسی با اخراج" then
	  if database:get('bot:arabic:ban'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> arabic ban has been_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز شد !"..lockban.." ", 1, 'md')
end
   database:del('bot:arabic:ban'..msg.chat_id_)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> arabic ban is already_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز بود !"..lockban.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
 local SASI_info = nil
 function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if unmutept[2] == "persian warn" or UNSPS[2] == "فارسی با اخطار" then
	  if database:get('bot:arabic:warn'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> arabic ban has been_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز شد !"..lockwarn.." ", 1, 'md')
end
   database:del('bot:arabic:warn'..msg.chat_id_)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> arabic warn is already_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز بود !"..lockwarn.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
 local SASI_info = nil
 function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if unmutept[2] == "english" or UNSPS[2] == "انگلیسی" then
	  if database:get('bot:english:mute'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> english has been_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز شد !"..lockmute.." ", 1, 'md')
end
   database:del('bot:english:mute'..msg.chat_id_)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> english is already_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز بود !"..lockmute.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
 local SASI_info = nil
 function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if unmutept[2] == "english ban" or UNSPS[2] == "انگلیسی با اخراج" then
	  if database:get('bot:english:ban'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> english ban has been_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز شد !"..lockban.." ", 1, 'md')
end
   database:del('bot:english:ban'..msg.chat_id_)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> english ban is already_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز بود !"..lockban.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
 local SASI_info = nil
 function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if unmutept[2] == "english warn" or UNSPS[2] == "انگلیسی با اخطار" then
	  if database:get('bot:english:warn'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> english ban has been_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز شد !"..lockwarn.." ", 1, 'md')
end
   database:del('bot:english:warn'..msg.chat_id_)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> english warn is already_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز بود !"..lockwarn.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
 local SASI_info = nil
 function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if unmutept[2] == "spam del" or UNSPS[2] == "اسپم" then
	  if database:get('bot:spam:mute'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> spam has been_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز شد !"..lockmute.." ", 1, 'md')
end
   database:del('bot:spam:mute'..msg.chat_id_)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> spam is already_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز بود !"..lockmute.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
 local SASI_info = nil
 function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if unmutept[2] == "spam warn" or UNSPS[2] == "اسپم با اخطار" then
	  if database:get('bot:spam:warn'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> spam ban has been_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز بود !"..lockwarn.." ", 1, 'md')
end
   database:del('bot:spam:warn'..msg.chat_id_)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> spam warn is already_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز بود !"..lockwarn.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
 local SASI_info = nil
 function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if unmutept[2] == "sticker" or UNSPS[2] == "استیکر" then
	  if database:get('bot:sticker:mute'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> sticker has been_ *unLocked*', 1, 'md')
else
  send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز شد !"..lockmute.." ", 1, 'md')
end
   database:del('bot:sticker:mute'..msg.chat_id_)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> sticker is already_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز بود !"..lockmute.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
 local SASI_info = nil
 function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if unmutept[2] == "sticker ban" or UNSPS[2] == "استیکر با اخراج" then
	  if database:get('bot:sticker:ban'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> sticker ban has been_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز شد !"..lockban.." ", 1, 'md')
end
   database:del('bot:sticker:ban'..msg.chat_id_)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> sticker ban is already_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز بود !"..lockban.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
 local SASI_info = nil
 function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if unmutept[2] == "sticker warn" or UNSPS[2] == "استیکر با اخطار" then
	  if database:get('bot:sticker:warn'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> sticker ban has been_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز شد !"..lockwarn.." ", 1, 'md')
end
   database:del('bot:sticker:warn'..msg.chat_id_)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> sticker warn is already_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز بود !"..lockwarn.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
 local SASI_info = nil
function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if unmutept[2] == "file" or UNSPS[2] == "فایل" then
	  if database:get('bot:document:mute'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> file has been_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز شد !"..lockmute.." ", 1, 'md')
end
   database:del('bot:document:mute'..msg.chat_id_)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> file is already_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز بود !"..lockmute.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
 local SASI_info = nil
 function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if unmutept[2] == "file ban" or UNSPS[2] == "فایل با اخراج" then
	  if database:get('bot:document:ban'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> file ban has been_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز شد !"..lockban.." ", 1, 'md')
end
   database:del('bot:document:ban'..msg.chat_id_)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> file ban is already_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز بود !"..lockban.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
 local SASI_info = nil
 function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if unmutept[2] == "file warn" or UNSPS[2] == "فایل با اخطار" then
	  if database:get('bot:document:warn'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> file ban has been_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز شد !"..lockwarn.." ", 1, 'md')
end
   database:del('bot:document:warn'..msg.chat_id_)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> file warn is already_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز بود !"..lockwarn.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
 local SASI_info = nil
 function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"

if unmutept[2] == "markdown" or UNSPS[2] == "منشن" then
	  if database:get('bot:markdown:mute'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> markdown has been_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز شد !"..lockmute.." ", 1, 'md')
end
   database:del('bot:markdown:mute'..msg.chat_id_)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> markdown is already_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز بود !"..lockmute.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
 local SASI_info = nil
 function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if unmutept[2] == "markdown ban" or UNSPS[2] == "منشن با اخراج" then
	  if database:get('bot:markdown:ban'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> markdown ban has been_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز شد !"..lockban.." ", 1, 'md')
end
   database:del('bot:markdown:ban'..msg.chat_id_)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> markdown ban is already_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز بود !"..lockban.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
 local SASI_info = nil
 function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if unmutept[2] == "markdown warn" or UNSPS[2] == "منشن با احطار" then
	  if database:get('bot:markdown:warn'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> markdown ban has been_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز شد !"..lockwarn.." ", 1, 'md')
end
   database:del('bot:markdown:warn'..msg.chat_id_)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> markdown warn is already_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز بود !"..lockwarn.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
 local SASI_info = nil
function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"

	  if unmutept[2] == "service" or UNSPS[2] == "سرویس تلگرام" then
	  if database:get('bot:tgservice:mute'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> tgservice has been_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز شد !"..lockmute.." ", 1, 'md')
end
   database:del('bot:tgservice:mute'..msg.chat_id_)
 else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> tgservice is already_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز بود !"..lockmute.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
 local SASI_info = nil
 function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if unmutept[2] == "fwd" or UNSPS[2] == "فروارد" then
	  if database:get('bot:forward:mute'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> forward has been_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز شد !"..lockmute.." ", 1, 'md')
end
   database:del('bot:forward:mute'..msg.chat_id_)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> forward is already_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز بود !"..lockmute.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
 local SASI_info = nil
 function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if unmutept[2] == "fwd ban" or UNSPS[2] == "فروارد با اخراج" then
	  if database:get('bot:forward:ban'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> forward ban has been_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز شد !"..lockban.." ", 1, 'md')
end
   database:del('bot:forward:ban'..msg.chat_id_)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> forward ban is already_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز بود !"..lockban.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
 local SASI_info = nil
 function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if unmutept[2] == "fwd warn" or UNSPS[2] == "فروارد با اخطار" then
	  if database:get('bot:forward:warn'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> forward ban has been_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز شد !"..lockwarn.." ", 1, 'md')
end
   database:del('bot:forward:warn'..msg.chat_id_)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> forward warn is already_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز بود !"..lockwarn.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
 local SASI_info = nil
 function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if unmutept[2] == "cmd" or UNSPS[2] == "دستورات" then
	  if database:get('bot:cmd:mute'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> cmd has been_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز شد !"..lockmute.." ", 1, 'md')
end
   database:del('bot:cmd:mute'..msg.chat_id_)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> cmd is already_ *unLocked*', 1, 'md')
else
  send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز بود !"..lockmute.." ", 1, 'md')
end
end
end
end
getUser(msg.sender_user_id_, SASI333)
 local SASI_info = nil
 function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if unmutept[2] == "cmd ban" or UNSPS[2] == "دستورات با اخراج" then
	  if database:get('bot:cmd:ban'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> cmd ban has been_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز شد !"..lockban.." ", 1, 'md')
end
   database:del('bot:cmd:ban'..msg.chat_id_)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> cmd ban is already_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز بود !"..lockban.." ", 1, 'md')
end
end
end
getUser(msg.sender_user_id_, SASI333)
end
 local SASI_info = nil
 function SASI333(extra,result,success)
SASI_info ='['..result.first_name_..'](t.me/'..(result.username_ or 'موجود نیست !')..')'
local lockmute = "\n🏵 تنظیم شده به روی : عادی"
local lockwarn = "\n🏵 تنظیم شده به روی : اخطار"
local lockban = "\n🏵 تنظیم شد به روی : اخراج "
local infoo = "⚙️ مجری :   [(] "..SASI_info.." [)]\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
if unmutept[2] == "cmd warn" or UNSPS[2] == "دستورات با اخطار" then
	  if database:get('bot:cmd:warn'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_> cmd ban has been_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز شد !"..lockwarn.." ", 1, 'md')
end
   database:del('bot:cmd:warn'..msg.chat_id_)
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> cmd warn is already_ *unLocked*', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, ""..infoo.."☑┇قفل باز بود !"..lockwarn.." ", 1, 'md')
end
end
end
	end
  getUser(msg.sender_user_id_, SASI333)
	end
	-----------------------------------------------------------------------------------------------
if text:match("^[Cc][Ll][Ee][Aa][Nn] [Gg][Bb][Aa][Nn][Ll][Ii][Ss][Tt]$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) or text:match("^پاکسازی لیست بن ال$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
if database:get('bot:lang:'..msg.chat_id_) then
text = '_> Banall ;ist has been_ *Cleaned*'
else
text = 'لیست ساه ربات خالی شد !'
end
database:del('bot:gbanned:')
	send(msg.chat_id_, msg.id_, 1, text, 1, 'md')
  end

if text:match("^[Cc][Ll][Ee][Aa][Nn] [Gg][Ss][Ii][Ll][Ee][Nn][Tt][Ll][Ii][Ss][Tt$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) or text:match("^پاکسازی لیست سایلنت ال") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
if database:get('bot:lang:'..msg.chat_id_) then
text = '_> Silentall list has been_ *Cleaned*'
else
text = 'لیست سیاه ربات خالی شد !'
end
database:del('bot:gmuted:')
	send(msg.chat_id_, msg.id_, 1, text, 1, 'md')
  end

	-----------------------------------------------------------------------------------------------
local text = msg.content_.text_:gsub('پاکسازی','clean')
  	if text:match("^[Cc][Ll][Ee][Aa][Nn] (.*)$") and is_mod(msg.sender_user_id_, msg.chat_id_) then
	local txt = {string.match(text, "^([Cc][Ll][Ee][Aa][Nn]) (.*)$")}
 if txt[2] == 'banlist' or txt[2] == 'Banlist' or txt[2] == 'لیست مسدود' then
	database:del('bot:banned:'..msg.chat_id_)
if database:get('bot:lang:'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '_> Banlist has been_ *Cleaned*', 1, 'md')
  else
send(msg.chat_id_, msg.id_, 1, '✅┇لیست مسدود ربات پاکسازی شد !️', 1, 'md')
end
end

 if txt[2] == 'creators' and is_sudo(msg) or txt[2] == 'creatorlist' and is_sudo(msg) or txt[2] == 'Creatorlist' and is_sudo(msg) or txt[2] == 'Creators' and is_sudo(msg) or txt[2] == 'سازنده' and is_sudo(msg) then
	database:del('bot:creator:'..msg.chat_id_)
if database:get('bot:lang:'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '_> Creator has been_ *Cleaned*', 1, 'md')
  else
send(msg.chat_id_, msg.id_, 1, 'لیست سازنده پاکسازی شد !', 1, 'md')
end
 end
if txt[2] == 'bots' or txt[2] == 'Bots' or txt[2] == 'ربات ' then
local function cb(extra,result,success)
local bots = result.members_
for i=0 , #bots do
  if tonumber(bots[i].user_id_) ~= tonumber(bot_id) then chat_kick(msg.chat_id_,bots[i].user_id_)
end
end
end
bot.channel_get_bots(msg.chat_id_,cb)
if database:get('bot:lang:'..msg.chat_id_) then
	send(msg.chat_id_, msg.id_, 1, '_> All bots_ *kicked!*', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, 'تمامی ربات های گروه حذف شدند !', 1, 'md')
end
	end
	   if txt[2] == 'modlist' and is_owner(msg.sender_user_id_, msg.chat_id_) or txt[2] == 'Modlist' and is_owner(msg.sender_user_id_, msg.chat_id_) or txt[2] == 'مدیران' and is_owner(msg.sender_user_id_, msg.chat_id_) then
	database:del('bot:mods:'..msg.chat_id_)
if database:get('bot:lang:'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '_> Modlist has been_ *Cleaned*', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, 'لیست مدیران پاکسازی شد !', 1, 'md')
end
end
	   if txt[2] == 'viplist' and is_owner(msg.sender_user_id_, msg.chat_id_) or txt[2] == 'Viplist' and is_owner(msg.sender_user_id_, msg.chat_id_) or txt[2] == 'لیست ویژه' and is_owner(msg.sender_user_id_, msg.chat_id_) then
	database:del('bot:vipgp:'..msg.chat_id_)
if database:get('bot:lang:'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '_> Viplist has been_ *Cleaned*', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, 'لیست افراد وی ای پی پاکسازی شد !', 1, 'md')
end
 end
	   if txt[2] == 'owners' and is_creator(msg.sender_user_id_, msg.chat_id_) or txt[2] == 'Owners' and is_creator(msg.sender_user_id_, msg.chat_id_) or txt[2] == 'لیست مالکان' and is_creator(msg.sender_user_id_, msg.chat_id_) then
	database:del('bot:owners:'..msg.chat_id_)
if database:get('bot:lang:'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '_> ownerlist has been_ *Cleaned*', 1, 'md')
  else
send(msg.chat_id_, msg.id_, 1, 'لیست مدیران پاکسازی شد !', 1, 'md')
end
 end
	   if txt[2] == 'rules' or txt[2] == 'Rules' or txt[2] == 'قوانین' then
	database:del('bot:rules'..msg.chat_id_)
if database:get('bot:lang:'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '_> rules has been_ *Cleaned*', 1, 'md')
  else
send(msg.chat_id_, msg.id_, 1, 'قوانین تنظیم شده حذف شدند !', 1, 'md')
end
 end
	   if txt[2] == 'link' or  txt[2] == 'Link' or  txt[2] == 'لینک' then
	database:del('bot:group:link'..msg.chat_id_)
if database:get('bot:lang:'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '_> link has been_ *Cleaned*', 1, 'md')
  else
send(msg.chat_id_, msg.id_, 1, 'لینک ثبت شده حذف شد !', 1, 'md')
end
 end
	   if txt[2] == 'badlist' or txt[2] == 'Badlist' or txt[2] == 'لیست فیلتر' then
	database:del('bot:filters:'..msg.chat_id_)
if database:get('bot:lang:'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '_> badlist has been_ *Cleaned*', 1, 'md')
  else
send(msg.chat_id_, msg.id_, 1, 'لیست کلمات فیلتر پاکسازی شد !', 1, 'md')
end
 end
	   if txt[2] == 'silentlist' or txt[2] == 'Silentlist' or txt[2] == 'لیست سکوت' then
	database:del('bot:muted:'..msg.chat_id_)
if database:get('bot:lang:'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '_> silentlist has been_ *Cleaned*', 1, 'md')
  else
send(msg.chat_id_, msg.id_, 1, 'لیست افراد ساکت پاکسازی شد !', 1, 'md')
end
 end

end

local text = msg.content_.text_:gsub('لیست سیاه','clean blocklist')
  	if text:match("^[Cc][Ll][Ee][Aa][Nn] [Bb][Ll][Oo][Cc][Kk][Ll][Ii][Ss][Tt]$") and is_creator(msg.sender_user_id_, msg.chat_id_) then
	local txt = {string.match(text, "^([Cc][Ll][Ee][Aa][Nn] [Bb][Ll][Oo][Cc][Kk][Ll][Ii][Ss][Tt])$")}
  local function cb(extra,result,success)
  local list = result.members_
for i=0 , #list do
bot.changeChatMemberStatus(msg.chat_id_, list[i].user_id_, "Left")
end
if database:get('bot:lang:'..msg.chat_id_) then
text = '_> blocklist has been_ *Cleaned*'
else
text = 'لیست سیاه پاکسازی شد !️'
end
	send(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end
 bot.channel_get_kicked(msg.chat_id_,cb)
end

local text = msg.content_.text_:gsub('افزودن به لیست سیاه','add blocklist')
  	if text:match("^[Aa][Dd][Dd] [Bb][Ll][Oo][Cc][Kk][Ll][Ii][Ss][Tt]$") and is_creator(msg.sender_user_id_, msg.chat_id_) then
	local txt = {string.match(text, "^([Aa][Dd][Dd] [Bb][Ll][Oo][Cc][Kk][Ll][Ii][Ss][Tt])$")}
  local function cb(extra,result,success)
  local list = result.members_
for k,v in pairs(list) do
bot.addChatMember(msg.chat_id_, v.user_id_, 200, dl_cb, nil)
end
if database:get('bot:lang:'..msg.chat_id_) then
text = '_> blocklist has been_ *Added*'
else
text = '☑┇به لیست سیاه افزوده شد !'
end
	send(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end
 bot.channel_get_kicked(msg.chat_id_,cb)
end

local text = msg.content_.text_:gsub('پاکسازی دیلیت اکانت','clean delete')
  	if text:match("^[Cc][Ll][Ee][Aa][Nn] [Dd][Ee][Ll][Ee][Tt][Ee]$") and is_creator(msg.sender_user_id_, msg.chat_id_) then
	local txt = {string.match(text, "^([Cc][Ll][Ee][Aa][Nn] [Dd][Ee][Ll][Ee][Tt][Ee])$")}
local function getChatId(chat_id)
  local chat = {}
  local chat_id = tostring(chat_id)
  if chat_id:match('^-100') then
local channel_id = chat_id:gsub('-100', '')
chat = {ID = channel_id, type = 'channel'}
  else
local group_id = chat_id:gsub('-', '')
chat = {ID = group_id, type = 'group'}
  end
  return chat
end
  local function check_delete(arg, data)
for k, v in pairs(data.members_) do
local function clean_cb(arg, data)
if not data.first_name_ then
bot.changeChatMemberStatus(msg.chat_id_, data.id_, "Kicked")
end
end
bot.getUser(v.user_id_, clean_cb)
end
if database:get('bot:lang:'..msg.chat_id_) then
text = '_> delete accounts has been_ *Cleaned*'
else
text = '☑┇ حساب های حذف شده حذف شدند !'
end
	send(msg.chat_id_, msg.id_, 1, text, 1, 'md')
 end
  tdcli_function ({ID = "GetChannelMembers",channel_id_ = getChatId(msg.chat_id_).ID,offset_ = 0,limit_ = 5000}, check_delete, nil)
  end

local text = msg.content_.text_:gsub('پاکسازی متروکه','clean deactive')
  	if text:match("^[Cc][Ll][Ee][Aa][Nn] [Dd][Ee][Aa][Cc][Tt][Ii][Vv][Ee]$") and is_creator(msg.sender_user_id_, msg.chat_id_) then
	local txt = {string.match(text, "^([Cc][Ll][Ee][Aa][Nn] [Dd][Ee][Aa][Cc][Tt][Ii][Vv][Ee])$")}
local function getChatId(chat_id)
  local chat = {}
  local chat_id = tostring(chat_id)
  if chat_id:match('^-100') then
local channel_id = chat_id:gsub('-100', '')
chat = {ID = channel_id, type = 'channel'}
  else
local group_id = chat_id:gsub('-', '')
chat = {ID = group_id, type = 'group'}
  end
  return chat
end
  local function check_deactive(arg, data)
for k, v in pairs(data.members_) do
local function clean_cb(arg, data)
if data.type_.ID == "UserTypeGeneral" then
if data.status_.ID == "UserStatusEmpty" then
bot.changeChatMemberStatus(msg.chat_id_, data.id_, "Kicked")
end
end
end
bot.getUser(v.user_id_, clean_cb)
end
if database:get('bot:lang:'..msg.chat_id_) then
text = '_> delete accounts has been_ *Cleaned*'
else
text = '✅┇ حساب های متروکه حذف شدند !'
end
	send(msg.chat_id_, msg.id_, 1, text, 1, 'md')
 end
  tdcli_function ({ID = "GetChannelMembers",channel_id_ = getChatId(msg.chat_id_).ID,offset_ = 0,limit_ = 5000}, check_deactive, nil)
  end

 local text = msg.content_.text_:gsub('ادمین','admin group')
if text:match("^[Aa][Dd][Mm][Ii][Nn] [Gg][Rr][Oo][Uu][Pp]$") and is_owner(msg.sender_user_id_, msg.chat_id_) then
   local txt = {string.match(text, "^[Aa][Dd][Mm][Ii][Nn] [Gg][Rr][Oo][Uu][Pp]$")}
   local function cb(extra,result,success)
   local list = result.members_
if database:get('bot:lang:'..msg.chat_id_) then
  text = '<b>List administrators group</b> : \n\n'
  else
  text = '📊┇لیست ادمین های گروه :\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n'
  end
 local n = 0
   for k,v in pairs(list) do
 n = (n + 1)
   local user_info = database:hgetall('user:'..v.user_id_)
if user_info and user_info.username then
 local username = user_info.username
 text = text.."<b>|"..n.."|</b>~⪼(@"..username..")\n"
else
 text = text.."<b>|"..n.."|</b>~⪼(<code>"..v.user_id_.."</code>)\n"
end
   end
 send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
 end
  bot.channel_get_admins(msg.chat_id_,cb)
 end

local text = msg.content_.text_:gsub('حذف ادمین','setmote admins')
  	if text:match("^[Ss][Ee][Tt][Mm][Oo][Tt][Ee] [Aa][Dd][Mm][Ii][Nn][Ss]$") and is_owner(msg.sender_user_id_, msg.chat_id_) then
	local txt = {string.match(text, "^[Ss][Ee][Tt][Mm][Oo][Tt][Ee] [Aa][Dd][Mm][Ii][Nn][Ss]$")}
  local function cb(extra,result,success)
  local list = result.members_
if database:get('bot:lang:'..msg.chat_id_) then
moody = '<b>List administrators group setmote BOT</b> : \n\n'
else
moody = '📊┇ از ادمینی حذف شد !\n'
end
local n = 0
for k,v in pairs(list) do
n = (n + 1)
local hash = 'bot:mods:'..msg.chat_id_
database:sadd(hash, v.user_id_)
end
send(msg.chat_id_, msg.id_, 1, moody, 1, 'html')
end
 bot.channel_get_admins(msg.chat_id_,cb)
end
	-----------------------------------------------------------------------------------------------
  	 if text:match("^[Ss] [Dd][Ee][Ll]$") and is_mod(msg.sender_user_id_, msg.chat_id_) then
	if database:get('bot:muteall'..msg.chat_id_) then
	mute_all = '`lock | 🔐`'
	else
	mute_all = '`unlock | 🔓`'
	end
	------------
	if database:get('bot:text:mute'..msg.chat_id_) then
	mute_text = '`lock | 🔐`'
	else
	mute_text = '`unlock | 🔓`'
	end
	------------
	if database:get('bot:photo:mute'..msg.chat_id_) then
	mute_photo = '`lock | 🔐`'
	else
	mute_photo = '`unlock | 🔓`'
	end
	------------
	if database:get('bot:video:mute'..msg.chat_id_) then
	mute_video = '`lock | 🔐`'
	else
	mute_video = '`unlock | 🔓`'
	end
	------------
	if database:get('bot:gifs:mute'..msg.chat_id_) then
	mute_gifs = '`lock | 🔐`'
	else
	mute_gifs = '`unlock | 🔓`'
	end
	------------
	if database:get('anti-flood:'..msg.chat_id_) then
	mute_flood = '`unlock | 🔓`'
	else
	mute_flood = '`lock | 🔐`'
	end
	------------
	if not database:get('flood:max:'..msg.chat_id_) then
	flood_m = 10
	else
	flood_m = database:get('flood:max:'..msg.chat_id_)
end
	------------
	if not database:get('flood:time:'..msg.chat_id_) then
	flood_t = 1
	else
	flood_t = database:get('flood:time:'..msg.chat_id_)
	end
	------------
	if database:get('bot:music:mute'..msg.chat_id_) then
	mute_music = '`lock | 🔐`'
	else
	mute_music = '`unlock | 🔓`'
	end
	------------
	if database:get('bot:bots:mute'..msg.chat_id_) then
	mute_bots = '`lock | 🔐`'
	else
	mute_bots = '`unlock | 🔓`'
	end

	if database:get('bot:bots:ban'..msg.chat_id_) then
	mute_botsb = '`lock | 🔐`'
	else
	mute_botsb = '`unlock | 🔓`'
	end
	------------
	if database:get('bot:inline:mute'..msg.chat_id_) then
	mute_in = '`lock | 🔐`'
	else
	mute_in = '`unlock | 🔓`'
	end
	------------
	if database:get('bot:voice:mute'..msg.chat_id_) then
	mute_voice = '`lock | 🔐`'
	else
	mute_voice = '`unlock | 🔓`'
end

	if database:get('bot:document:mute'..msg.chat_id_) then
	mute_doc = '`lock | 🔐`'
	else
	mute_doc = '`unlock | 🔓`'
end

	if database:get('bot:markdown:mute'..msg.chat_id_) then
	mute_mdd = '`lock | 🔐`'
	else
	mute_mdd = '`unlock | 🔓`'
	end
	------------
	if database:get('editmsg'..msg.chat_id_) then
	mute_edit = '`lock | 🔐`'
	else
	mute_edit = '`unlock | 🔓`'
	end
------------
	if database:get('bot:links:mute'..msg.chat_id_) then
	mute_links = '`lock | 🔐`'
	else
	mute_links = '`unlock | 🔓`'
	end
------------
	if database:get('bot:pin:mute'..msg.chat_id_) then
	lock_pin = '`lock | 🔐`'
	else
	lock_pin = '`unlock | 🔓`'
	end
------------
	if database:get('bot:sticker:mute'..msg.chat_id_) then
	lock_sticker = '`lock | 🔐`'
	else
	lock_sticker = '`unlock | 🔓`'
	end
	------------
if database:get('bot:tgservice:mute'..msg.chat_id_) then
	lock_tgservice = '`lock | 🔐`'
	else
	lock_tgservice = '`unlock | 🔓`'
	end
	------------
if database:get('bot:webpage:mute'..msg.chat_id_) then
	lock_wp = '`lock | 🔐`'
	else
	lock_wp = '`unlock | 🔓`'
	end
	------------
if database:get('bot:hashtag:mute'..msg.chat_id_) then
	lock_htag = '`lock | 🔐`'
	else
	lock_htag = '`unlock | 🔓`'
end

   if database:get('bot:cmd:mute'..msg.chat_id_) then
	lock_cmd = '`lock | 🔐`'
	else
	lock_cmd = '`unlock | 🔓`'
	end
	------------
if database:get('bot:tag:mute'..msg.chat_id_) then
	lock_tag = '`lock | 🔐`'
	else
	lock_tag = '`unlock | 🔓`'
	end
	------------
if database:get('bot:location:mute'..msg.chat_id_) then
	lock_location = '`lock | 🔐`'
	else
	lock_location = '`unlock | 🔓`'
end
  ------------
if not database:get('bot:sens:spam'..msg.chat_id_) then
spam_c = 300
else
spam_c = database:get('bot:sens:spam'..msg.chat_id_)
end

if not database:get('bot:sens:spam:warn'..msg.chat_id_) then
spam_d = 300
else
spam_d = database:get('bot:sens:spam:warn'..msg.chat_id_)
end

	------------
  if database:get('bot:contact:mute'..msg.chat_id_) then
	lock_contact = '`lock | 🔐`'
	else
	lock_contact = '`unlock | 🔓`'
	end
	------------
  if database:get('bot:spam:mute'..msg.chat_id_) then
	mute_spam = '`unlock | 🔓`'
	else
	mute_spam = '`lock | 🔐`'
end

	if database:get('anti-flood:warn'..msg.chat_id_) then
	lock_flood = '`unlock | 🔓`'
	else
	lock_flood = '`lock | 🔐`'
end

	if database:get('anti-flood:del'..msg.chat_id_) then
	del_flood = '`unlock | 🔓`'
	else
	del_flood = '`lock | 🔐`'
	end
	------------
if database:get('bot:english:mute'..msg.chat_id_) then
	lock_english = '`lock | 🔐`'
	else
	lock_english = '`unlock | 🔓`'
	end
	------------
if database:get('bot:arabic:mute'..msg.chat_id_) then
	lock_arabic = '`lock | 🔐`'
	else
	lock_arabic = '`unlock | 🔓`'
	end
	------------
if database:get('bot:forward:mute'..msg.chat_id_) then
	lock_forward = '`lock | 🔐`'
	else
	lock_forward = '`unlock | 🔓`'
end

if database:get('bot:rep:mute'..msg.chat_id_) then
	lock_rep = '`lock | 🔐`'
	else
	lock_rep = '`unlock | 🔓`'
	end

if database:get('bot:note:mute'..msg.chat_id_) then
	lock_note = '`lock | 🔐`'
	else
	lock_note = '`unlock | 🔓`'
	end
	------------
	if database:get("bot:welcome"..msg.chat_id_) then
	send_welcome = '`active | ✔`'
	else
	send_welcome = '`inactive | ⭕`'
end
		if not database:get('flood:max:warn'..msg.chat_id_) then
	flood_warn = 10
	else
	flood_warn = database:get('flood:max:warn'..msg.chat_id_)
end
		if not database:get('flood:max:del'..msg.chat_id_) then
	flood_del = 10
	else
	flood_del = database:get('flood:max:del'..msg.chat_id_)
end
	------------
	local ex = database:ttl("bot:charge:"..msg.chat_id_)
if ex == -1 then
exp_dat = '`NO Fanil`'
else
exp_dat = math.floor(ex / 86400) + 1
			end
 	------------
	 local TXT = "*Group Settings Del*\n======================\n*Del all* : "..mute_all.."\n" .."*Del Links* : "..mute_links.."\n" .."*Del Edit* : "..mute_edit.."\n" .."*Del Bots* : "..mute_bots.."\n" .."*Ban Bots* : "..mute_botsb.."\n" .."*Del Inline* : "..mute_in.."\n" .."*Del English* : "..lock_english.."\n" .."*Del Forward* : "..lock_forward.."\n" .."*Del Pin* : "..lock_pin.."\n" .."*Del Arabic* : "..lock_arabic.."\n" .."*Del Hashtag* : "..lock_htag.."\n".."*Del tag* : "..lock_tag.."\n" .."*Del Webpage* : "..lock_wp.."\n" .."*Del Location* : "..lock_location.."\n" .."*Del Tgservice* : "..lock_tgservice.."\n"
.."*Del Spam* : "..mute_spam.."\n" .."*Del Photo* : "..mute_photo.."\n" .."*Del video note* : "..lock_note.."\n" .."*Del Text* : "..mute_text.."\n" .."*Del Gifs* : "..mute_gifs.."\n" .."*Del Voice* : "..mute_voice.."\n" .."*Del Music* : "..mute_music.."\n" .."*Del Video* : "..mute_video.."\n*Del Cmd* : "..lock_cmd.."\n" .."*Del Markdown* : "..mute_mdd.."\n*Del Document* : "..mute_doc.."\n" .."*Flood Ban* : "..mute_flood.."\n" .."*Flood Mute* : "..lock_flood.."\n" .."*Flood del* : "..del_flood.."\n" .."*Setting reply* : "..lock_rep.."\n"
.."======================\n*Welcome* : "..send_welcome.."\n*Flood Time*  "..flood_t.."\n" .."*Flood Max* : "..flood_m.."\n" .."*Flood Mute* : "..flood_warn.."\n" .."*Flood del* : "..flood_del.."\n" .."*Number Spam* : "..spam_c.."\n" .."*Warn Spam* : "..spam_d.."\n"
 .."*Expire* : "..exp_dat.."\n======================"
   send(msg.chat_id_, msg.id_, 1, TXT, 1, 'md')
end

local text = msg.content_.text_:gsub('تنظیمات','settings')
  	 if text:match("^settings$") and is_mod(msg.sender_user_id_, msg.chat_id_) then
	if database:get('bot:muteall'..msg.chat_id_) then
----------------------------------------------------
   	mute_all = '❌'
   	else
   	mute_all = '⭕️'
   	end
   	------------
   	if database:get('bot:text:mute'..msg.chat_id_) then
   	mute_text = '❌'
   	else
   	mute_text = '⭕️'
   	end
   	------------
   	if database:get('bot:photo:mute'..msg.chat_id_) then
   	mute_photo = '❌'
   	else
   	mute_photo = '⭕️'
   	end
   	------------
   	if database:get('bot:video:mute'..msg.chat_id_) then
   	mute_video = '❌'
   	else
   	mute_video = '⭕️'
   	end
   	if database:get('bot:note:mute'..msg.chat_id_) then
   	mute_note = '❌'
   	else
   	mute_note = '⭕️'
   	end
   	------------
   	if database:get('bot:gifs:mute'..msg.chat_id_) then
   	mute_gifs = '❌'
   	else
   	mute_gifs = '⭕️'
   	end
   	------------
   	if database:get('anti-flood:'..msg.chat_id_) then
   	mute_flood = '⭕️'
   	else
   	mute_flood = '❌'
   end
   	------------
   	if not database:get('flood:max:'..msg.chat_id_) then
   	flood_m = 10
   	else
   	flood_m = database:get('flood:max:'..msg.chat_id_)
   end
   	------------
   	if not database:get('flood:time:'..msg.chat_id_) then
   	flood_t = 1
   	else
   	flood_t = database:get('flood:time:'..msg.chat_id_)
   	end
   	------------
   	if database:get('bot:music:mute'..msg.chat_id_) then
   	mute_music = '❌'
   	else
   	mute_music = '⭕️'
   	end
   	------------
   	if database:get('bot:bots:mute'..msg.chat_id_) then
   	mute_bots = '❌'
   	else
   	mute_bots = '⭕️'
   	end

   	if database:get('bot:bots:ban'..msg.chat_id_) then
   	mute_botsb = '❌'
   	else
   	mute_botsb = '⭕️'
   	end
   	------------
   	if database:get('bot:inline:mute'..msg.chat_id_) then
   	mute_in = '❌'
   	else
   	mute_in = '⭕️'
   	end
   	------------
   	if database:get('bot:voice:mute'..msg.chat_id_) then
   	mute_voice = '❌'
   	else
   	mute_voice = '⭕️'
   	end
   	------------
   	if database:get('editmsg'..msg.chat_id_) then
   	mute_edit = '❌'
   	else
   	mute_edit = '⭕️'
   	end
 ------------
   	if database:get('bot:links:mute'..msg.chat_id_) then
   	mute_links = '❌'
   	else
   	mute_links = '⭕️'
   	end
 ------------
   	if database:get('bot:pin:mute'..msg.chat_id_) then
   	lock_pin = '❌'
   	else
   	lock_pin = '⭕️'
   end

   	if database:get('bot:document:mute'..msg.chat_id_) then
   	mute_doc = '❌'
   	else
   	mute_doc = '⭕️'
   end

   	if database:get('bot:markdown:mute'..msg.chat_id_) then
   	mute_mdd = '❌'
   	else
   	mute_mdd = '⭕️'
   	end
 ------------
   	if database:get('bot:sticker:mute'..msg.chat_id_) then
   	lock_sticker = '❌'
   	else
   	lock_sticker = '⭕️'
   	end
   	------------
 if database:get('bot:tgservice:mute'..msg.chat_id_) then
   	lock_tgservice = '❌'
   	else
   	lock_tgservice = '⭕️'
   	end
   	------------
 if database:get('bot:webpage:mute'..msg.chat_id_) then
   	lock_wp = '❌'
   	else
   	lock_wp = '⭕️'
   	end
   	------------
 if database:get('bot:hashtag:mute'..msg.chat_id_) then
   	lock_htag = '❌'
   	else
   	lock_htag = '⭕️'
   end

if database:get('bot:cmd:mute'..msg.chat_id_) then
   	lock_cmd = '❌'
   	else
   	lock_cmd = '⭕️'
   	end
   	------------
 if database:get('bot:tag:mute'..msg.chat_id_) then
   	lock_tag = '❌'
   	else
   	lock_tag = '⭕️'
   	end
   	------------
 if database:get('bot:location:mute'..msg.chat_id_) then
   	lock_location = '❌'
   	else
   	lock_location = '⭕️'
   end
------------
   if not database:get('bot:sens:spam'..msg.chat_id_) then
   spam_c = 300
   else
   spam_c = database:get('bot:sens:spam'..msg.chat_id_)
   end

   if not database:get('bot:sens:spam:warn'..msg.chat_id_) then
   spam_d = 300
   else
   spam_d = database:get('bot:sens:spam:warn'..msg.chat_id_)
   end
   	------------
if database:get('bot:contact:mute'..msg.chat_id_) then
   	lock_contact = '❌'
   	else
   	lock_contact = '⭕️'
   	end
   	------------
if database:get('bot:spam:mute'..msg.chat_id_) then
   	mute_spam = '⭕️'
   	else
   	mute_spam = '❌'
   	end
   	------------
 if database:get('bot:english:mute'..msg.chat_id_) then
   	lock_english = '❌'
   	else
   	lock_english = '⭕️'
   	end
   	------------
 if database:get('bot:arabic:mute'..msg.chat_id_) then
   	lock_arabic = '❌'
   	else
   	lock_arabic = '⭕️'
   end

   	if database:get('anti-flood:warn'..msg.chat_id_) then
   	lock_flood = '⭕️'
   	else
   	lock_flood = '❌'
   end

   	if database:get('anti-flood:del'..msg.chat_id_) then
   	del_flood = '⭕️'
   	else
   	del_flood = '❌'
   	end
   	------------
 if database:get('bot:forward:mute'..msg.chat_id_) then
   	lock_forward = '❌'
   	else
   	lock_forward = '⭕️'
   end

 if database:get('bot:rep:mute'..msg.chat_id_) then
   	lock_rep = '❌'
   	else
   	lock_rep = '⭕️'
   	end

 if database:get('bot:repsudo:mute'..msg.chat_id_) then
   	lock_repsudo = '❌'
   	else
   	lock_repsudo = '⭕️'
   	end

 if database:get('bot:repowner:mute'..msg.chat_id_) then
   	lock_repowner = '❌'
   	else
   	lock_repowner = '⭕️'
   	end

 if database:get('bot:id:mute'..msg.chat_id_) then
   	lock_id = '❌'
   	else
   	lock_id = '⭕️'
   	end
 if database:get('bot:pin:mute'..msg.chat_id_) then
   	lock_pind = '❌'
   	else
   	lock_pind = '⭕️'
   	end
 if database:get('bot:id:mute'..msg.chat_id_) then
   	lock_id_photo = '❌'
   	else
   	lock_id_photo = '⭕️'
   	end
   	------------
   	if database:get("bot:welcome"..msg.chat_id_) then
   	send_welcome = '❌'
   	else
   	send_welcome = '⭕️'
   end
		if not database:get('flood:max:warn'..msg.chat_id_) then
	flood_warn = 10
	else
	flood_warn = database:get('flood:max:warn'..msg.chat_id_)
end
	if not database:get('flood:max:del'..msg.chat_id_) then
	flood_del = 10
	else
	flood_del = database:get('flood:max:del'..msg.chat_id_)
end
	------------
	local ex = database:ttl("bot:charge:"..msg.chat_id_)
if ex == -1 then
exp_dat = 'بی نهایت'
else
exp_dat = math.floor(ex / 86400) + 1
			end
 	------------
	 local TXT = "🗑┇ تنظیمات گروه به روی حالت پاک کردن پیام :\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n✔️┇~⪼ فعال\n✖️┇~⪼ غیرفعال\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
..mute_all.."میوت همه".."\n"
..mute_links.." لینک".."\n"
..mute_edit .." ویرایش".."\n"
..mute_bots .." ربات".."\n"
..mute_botsb.." ربات با اخراج".."\n"
..lock_english.." انگلیسی".."\n"
..lock_forward.." فروارد".."\n"
..lock_wp.." وب".."\n\n"
..lock_pin.." سنجاق".."\n"
..lock_arabic.." فارسی".."\n"
..lock_htag.." هشتگ".."\n"
..lock_tag.." تگ".."\n"
..lock_location.." موقعیت مکانی".."\n"
..lock_tgservice.." سرویس تلگرام".."\n"
..mute_spam.." اسپم".."\n"
..mute_flood.." فلود با اخراج".."\n\n"
..lock_flood.." فلود با سکوت".."\n"
..del_flood.." فلود با پاکسازی".."\n"
..mute_text.." متن".."\n"
..mute_gifs.." گیف".."\n"
..mute_voice.." ویس".."\n"
..mute_music.." موزیک".."\n"
..mute_in.." اینلاین".."\n"
..lock_sticker.." استیکر".."\n\n"
..lock_contact.." مخاطب".."\n"
..mute_video.." فیلم".."\n"
..lock_cmd.." دستورات".."\n"
..mute_mdd.." منشن".."\n"
..mute_doc.." فایل".."\n"
..mute_photo.." عکس".."\n"
..mute_note.." سلفی".."\n"
..lock_rep.." ریپلی ربات".."\n"
..lock_repsudo.." ریپلی سودو".."\n\n"
..lock_repowner.." ریپلی مدیر".."\n"
..lock_id.."ایدی".."\n"
..lock_pind.."سنجاق".."\n"
..lock_id_photo.."عکس ایدی".."\n"
..send_welcome.." خوش آمد گویی".."\n"
.."┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ️ \n"
..'🔗┇تنظیمات فلود به روی  : '..flood_m..'\n'
..'🔗┇تنظیمات فلود به روی  : '..flood_warn..'\n'
..'🔗┇تنظیمات فلود به روی  : '..flood_del..'\n'
..'🔗┇تنظیمات اسپم به روی  : '..spam_c..'\n'
..'🔗┇تنظیمات اسپم به روی : '..spam_d..'\n'
..'🔗┇شارژ باقی مانده  '..exp_dat..' \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉'
 send(msg.chat_id_, msg.id_, 1, TXT, 1, 'md')
  end

  	 if text:match("^[Ss] [Ww][Aa][Rr][Nn]$") and is_mod(msg.sender_user_id_, msg.chat_id_) then
	if database:get('bot:muteallwarn'..msg.chat_id_) then
	mute_all = '`lock | 🔐`'
	else
	mute_all = '`unlock | 🔓`'
	end
	------------
	if database:get('bot:text:warn'..msg.chat_id_) then
	mute_text = '`lock | 🔐`'
	else
	mute_text = '`unlock | 🔓`'
	end
	if database:get('bot:note:warn'..msg.chat_id_) then
	mute_note = '`lock | 🔐`'
	else
	mute_note = '`unlock | 🔓`'
	end
	------------
	if database:get('bot:photo:warn'..msg.chat_id_) then
	mute_photo = '`lock | 🔐`'
	else
	mute_photo = '`unlock | 🔓`'
	end
	------------
	if database:get('bot:video:warn'..msg.chat_id_) then
	mute_video = '`lock | 🔐`'
	else
	mute_video = '`unlock | 🔓`'
end

	if database:get('bot:spam:warn'..msg.chat_id_) then
	mute_spam = '`unlock | 🔓`'
	else
	mute_spam = '`lock | 🔐`'
	end
	------------
	if database:get('bot:gifs:warn'..msg.chat_id_) then
	mute_gifs = '`lock | 🔐`'
	else
	mute_gifs = '`unlock | 🔓`'
end

	------------
	if database:get('bot:music:warn'..msg.chat_id_) then
	mute_music = '`lock | 🔐`'
	else
	mute_music = '`unlock | 🔓`'
	end
	------------
	if database:get('bot:inline:warn'..msg.chat_id_) then
	mute_in = '`lock | 🔐`'
	else
	mute_in = '`unlock | 🔓`'
	end
	------------
	if database:get('bot:voice:warn'..msg.chat_id_) then
	mute_voice = '`lock | 🔐`'
	else
	mute_voice = '`unlock | 🔓`'
	end
------------
	if database:get('bot:links:warn'..msg.chat_id_) then
	mute_links = '`lock | 🔐`'
	else
	mute_links = '`unlock | 🔓`'
	end
------------
	if database:get('bot:sticker:warn'..msg.chat_id_) then
	lock_sticker = '`lock | 🔐`'
	else
	lock_sticker = '`unlock | 🔓`'
	end
	------------
   if database:get('bot:cmd:warn'..msg.chat_id_) then
	lock_cmd = '`lock | 🔐`'
	else
	lock_cmd = '`unlock | 🔓`'
end

if database:get('bot:webpage:warn'..msg.chat_id_) then
	lock_wp = '`lock | 🔐`'
	else
	lock_wp = '`unlock | 🔓`'
end

	if database:get('bot:document:warn'..msg.chat_id_) then
	mute_doc = '`lock | 🔐`'
	else
	mute_doc = '`unlock | 🔓`'
end

	if database:get('bot:markdown:warn'..msg.chat_id_) then
	mute_mdd = '`lock | 🔐`'
	else
	mute_mdd = '`unlock | 🔓`'
	end
	------------
if database:get('bot:hashtag:warn'..msg.chat_id_) then
	lock_htag = '`lock | 🔐`'
	else
	lock_htag = '`unlock | 🔓`'
end
	if database:get('bot:pin:warn'..msg.chat_id_) then
	lock_pin = '`lock | 🔐`'
	else
	lock_pin = '`unlock | 🔓`'
	end
	------------
if database:get('bot:tag:warn'..msg.chat_id_) then
	lock_tag = '`lock | 🔐`'
	else
	lock_tag = '`unlock | 🔓`'
	end
	------------
if database:get('bot:location:warn'..msg.chat_id_) then
	lock_location = '`lock | 🔐`'
	else
	lock_location = '`unlock | 🔓`'
	end
	------------
if database:get('bot:contact:warn'..msg.chat_id_) then
	lock_contact = '`lock | 🔐`'
	else
	lock_contact = '`unlock | 🔓`'
	end
	------------

if database:get('bot:english:warn'..msg.chat_id_) then
	lock_english = '`lock | 🔐`'
	else
	lock_english = '`unlock | 🔓`'
	end
	------------
if database:get('bot:arabic:warn'..msg.chat_id_) then
	lock_arabic = '`lock | 🔐`'
	else
	lock_arabic = '`unlock | 🔓`'
	end
	------------
if database:get('bot:forward:warn'..msg.chat_id_) then
	lock_forward = '`lock | 🔐`'
	else
	lock_forward = '`unlock | 🔓`'
end
	------------
	------------
	local ex = database:ttl("bot:charge:"..msg.chat_id_)
if ex == -1 then
exp_dat = '`NO Fanil`'
else
exp_dat = math.floor(ex / 86400) + 1
			end
 	------------
	 local TXT = "*Group Settings Warn*\n======================\n*Warn all* : "..mute_all.."\n" .."*Warn Links* : "..mute_links.."\n" .."*Warn Inline* : "..mute_in.."\n" .."*Warn Pin* : "..lock_pin.."\n" .."*Warn English* : "..lock_english.."\n" .."*Warn Forward* : "..lock_forward.."\n" .."*Warn Arabic* : "..lock_arabic.."\n" .."*Warn Hashtag* : "..lock_htag.."\n".."*Warn tag* : "..lock_tag.."\n" .."*Warn Webpag* : "..lock_wp.."\n" .."*Warn Location* : "..lock_location.."\n"
.."*Warn Spam* : "..mute_spam.."\n" .."*Warn Photo* : "..mute_photo.."\n" .."*Warn video note* : "..mute_note.."\n" .."*Warn Text* : "..mute_text.."\n" .."*Warn Gifs* : "..mute_gifs.."\n" .."*Warn Voice* : "..mute_voice.."\n" .."*Warn Music* : "..mute_music.."\n" .."*Warn Video* : "..mute_video.."\n*Warn Cmd* : "..lock_cmd.."\n"  .."*Warn Markdown* : "..mute_mdd.."\n*Warn Document* : "..mute_doc.."\n"
.."*Expire* : "..exp_dat.."\n======================"
   send(msg.chat_id_, msg.id_, 1, TXT, 1, 'md')
end


local text = msg.content_.text_:gsub('تنظیمات اخطار','warn settings')
  	 if text:match("^warn settings$") and is_mod(msg.sender_user_id_, msg.chat_id_) then
	if database:get('bot:muteallwarn'..msg.chat_id_) then
	-------------------------------------------------------------------
	mute_all = '❌'
  else
  mute_all = '⭕️'
  end
------------
if database:get('bot:text:warn'..msg.chat_id_) then
mute_text = '❌'
else
mute_text = '⭕️'
end

if database:get('bot:note:warn'..msg.chat_id_) then
mute_note = '❌'
else
mute_note = '⭕️'
end
------------
if database:get('bot:photo:warn'..msg.chat_id_) then
mute_photo = '❌'
else
mute_photo = '⭕️'
end
------------
if database:get('bot:video:warn'..msg.chat_id_) then
mute_video = '❌'
else
mute_video = '⭕️'
  end

if database:get('bot:spam:warn'..msg.chat_id_) then
mute_spam = '⭕️'
else
mute_spam = '❌'
end
------------
if database:get('bot:gifs:warn'..msg.chat_id_) then
mute_gifs = '❌'
else
mute_gifs = '⭕️'
  end
------------
if database:get('bot:music:warn'..msg.chat_id_) then
mute_music = '❌'
else
mute_music = '⭕️'
end
------------
if database:get('bot:inline:warn'..msg.chat_id_) then
mute_in = '❌'
else
mute_in = '⭕️'
end
------------
if database:get('bot:voice:warn'..msg.chat_id_) then
mute_voice = '❌'
else
mute_voice = '⭕️'
end
  ------------
if database:get('bot:links:warn'..msg.chat_id_) then
mute_links = '❌'
else
mute_links = '⭕️'
end
  ------------
if database:get('bot:sticker:warn'..msg.chat_id_) then
lock_sticker = '❌'
else
lock_sticker = '⭕️'
end
------------
  if database:get('bot:cmd:warn'..msg.chat_id_) then
lock_cmd = '❌'
else
lock_cmd = '⭕️'
  end

  if database:get('bot:webpage:warn'..msg.chat_id_) then
lock_wp = '❌'
else
lock_wp = '⭕️'
end
------------
  if database:get('bot:hashtag:warn'..msg.chat_id_) then
lock_htag = '❌'
else
lock_htag = '⭕️'
  end
if database:get('bot:pin:warn'..msg.chat_id_) then
lock_pin = '❌'
else
lock_pin = '⭕️'
end
------------
  if database:get('bot:tag:warn'..msg.chat_id_) then
lock_tag = '❌'
else
lock_tag = '⭕️'
end
------------
  if database:get('bot:location:warn'..msg.chat_id_) then
lock_location = '❌'
else
lock_location = '⭕️'
end
------------
  if database:get('bot:contact:warn'..msg.chat_id_) then
lock_contact = '❌'
else
lock_contact = '⭕️'
end

  if database:get('bot:english:warn'..msg.chat_id_) then
lock_english = '❌'
else
lock_english = '⭕️'
end
------------
  if database:get('bot:arabic:warn'..msg.chat_id_) then
lock_arabic = '❌'
else
lock_arabic = '⭕️'
  end

if database:get('bot:document:warn'..msg.chat_id_) then
mute_doc = '❌'
else
mute_doc = '⭕️'
  end

if database:get('bot:markdown:warn'..msg.chat_id_) then
mute_mdd = '❌'
else
mute_mdd = '⭕️'
end
------------
  if database:get('bot:forward:warn'..msg.chat_id_) then
lock_forward = '❌'
else
lock_forward = '⭕️'
  end
	-----------------------------------------------------------------------------------------------------
	local ex = database:ttl("bot:charge:"..msg.chat_id_)
if ex == -1 then
exp_dat = 'بی نهایت'
else
exp_dat = math.floor(ex / 86400) + 1
			end
 	------------
	local TXT = "🗑┇تنظیمات گروه به روی حالت اخطار :\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n✔️┇~⪼ فعال\n✖️┇~⪼ غیرفعال\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
..mute_all.."میوت همه".."\n"
..mute_links.." لینک".."\n"
..mute_in.." اینلاین".."\n"
..lock_pin.." سنجاق".."\n"
..lock_english.." انگلیسی".."\n"
..lock_forward.." فروارد".."\n\n"
..lock_arabic.." فارسی".."\n"
..lock_htag.." هشتگ".."\n"
..lock_tag.." تگ".."\n"
..lock_wp.." وب".."\n"
..lock_location.." موقعیت مکانی".."\n"
..mute_spam.." اسپم".."\n\n"
..mute_photo.." عکس".."\n"
..mute_note.." سلفی".."\n"
..mute_text.." متن".."\n"
..mute_gifs.." گیف".."\n"
..lock_sticker.." استیکر".."\n"
..lock_contact.." مخاطب".."\n"
..mute_voice.." ویس".."\n\n"
..mute_music.." موزیک".."\n"
..mute_video.." فیلم".."\n"
..lock_cmd.." دستورات".."\n"
..mute_mdd.." منشن".."\n"
..mute_doc.." فایل".."\n"
.."┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
..exp_dat.." شارژ باقی منده :".."\n"
.."┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
  send(msg.chat_id_, msg.id_, 1, TXT, 1, 'md')
   end

  	 if text:match("^[Ss] [Bb][Aa][Nn]$") and is_mod(msg.sender_user_id_, msg.chat_id_) then
	if database:get('bot:muteallban'..msg.chat_id_) then

	------------
	------------
	local ex = database:ttl("bot:charge:"..msg.chat_id_)
if ex == -1 then
exp_dat = '`NO Fanil`'mute_all = '`lock | 🔐`'
else
mute_all = '`unlock | 🔓`'
end
------------
if database:get('bot:text:ban'..msg.chat_id_) then
mute_text = '`lock | 🔐`'
else
mute_text = '`unlock | 🔓`'
end

if database:get('bot:note:ban'..msg.chat_id_) then
mute_note = '`lock | 🔐`'
else
mute_note = '`unlock | 🔓`'
end
------------
if database:get('bot:photo:ban'..msg.chat_id_) then
mute_photo = '`lock | 🔐`'
else
mute_photo = '`unlock | 🔓`'
end
------------
if database:get('bot:video:ban'..msg.chat_id_) then
mute_video = '`lock | 🔐`'
else
mute_video = '`unlock | 🔓`'
end

------------
if database:get('bot:gifs:ban'..msg.chat_id_) then
mute_gifs = '`lock | 🔐`'
else
mute_gifs = '`unlock | 🔓`'
end
------------
if database:get('bot:music:ban'..msg.chat_id_) then
mute_music = '`lock | 🔐`'
else
mute_music = '`unlock | 🔓`'
end
------------
if database:get('bot:inline:ban'..msg.chat_id_) then
mute_in = '`lock | 🔐`'
else
mute_in = '`unlock | 🔓`'
end
------------
if database:get('bot:voice:ban'..msg.chat_id_) then
mute_voice = '`lock | 🔐`'
else
mute_voice = '`unlock | 🔓`'
end
------------
if database:get('bot:links:ban'..msg.chat_id_) then
mute_links = '`lock | 🔐`'
else
mute_links = '`unlock | 🔓`'
end
------------
if database:get('bot:sticker:ban'..msg.chat_id_) then
lock_sticker = '`lock | 🔐`'
else
lock_sticker = '`unlock | 🔓`'
end
------------
   if database:get('bot:cmd:ban'..msg.chat_id_) then
lock_cmd = '`lock | 🔐`'
else
lock_cmd = '`unlock | 🔓`'
end

if database:get('bot:webpage:ban'..msg.chat_id_) then
lock_wp = '`lock | 🔐`'
else
lock_wp = '`unlock | 🔓`'
end
------------
if database:get('bot:hashtag:ban'..msg.chat_id_) then
lock_htag = '`lock | 🔐`'
else
lock_htag = '`unlock | 🔓`'
end
------------
if database:get('bot:tag:ban'..msg.chat_id_) then
lock_tag = '`lock | 🔐`'
else
lock_tag = '`unlock | 🔓`'
end
------------
if database:get('bot:location:ban'..msg.chat_id_) then
lock_location = '`lock | 🔐`'
else
lock_location = '`unlock | 🔓`'
end
------------
if database:get('bot:contact:ban'..msg.chat_id_) then
lock_contact = '`lock | 🔐`'
else
lock_contact = '`unlock | 🔓`'
end
------------
if database:get('bot:english:ban'..msg.chat_id_) then
lock_english = '`lock | 🔐`'
else
lock_english = '`unlock | 🔓`'
end
------------
if database:get('bot:arabic:ban'..msg.chat_id_) then
lock_arabic = '`lock | 🔐`'
else
lock_arabic = '`unlock | 🔓`'
end
------------
if database:get('bot:forward:ban'..msg.chat_id_) then
lock_forward = '`lock | 🔐`'
else
lock_forward = '`unlock | 🔓`'
end

if database:get('bot:document:ban'..msg.chat_id_) then
mute_doc = '`lock | 🔐`'
else
mute_doc = '`unlock | 🔓`'
end

if database:get('bot:markdown:ban'..msg.chat_id_) then
mute_mdd = '`lock | 🔐`'
else
mute_mdd = '`unlock | 🔓`'
end
else
exp_dat = math.floor(ex / 86400) + 1
			end
 	------------
	 local TXT = "*Group Settings Ban*\n======================\n*Ban all* : "..mute_all.."\n" .."*Ban Links* : "..mute_links.."\n" .."*Ban Inline* : "..mute_in.."\n" .."*Ban English* : "..lock_english.."\n" .."*Ban Forward* : "..lock_forward.."\n" .."*Ban Arabic* : "..lock_arabic.."\n" .."*Ban Hashtag* : "..lock_htag.."\n".."*Ban tag* : "..lock_tag.."\n" .."*Ban Webpage* : "..lock_wp.."\n" .."*Ban Location* : "..lock_location.."\n"
.."*Ban Photo* : "..mute_photo.."\n" .."*Ban video note* : "..mute_note.."\n" .."*Ban Text* : "..mute_text.."\n" .."*Ban Gifs* : "..mute_gifs.."\n" .."*Ban Voice* : "..mute_voice.."\n" .."*Ban Music* : "..mute_music.."\n" .."*Ban Video* : "..mute_video.."\n*Ban Cmd* : "..lock_cmd.."\n"  .."*Ban Markdown* : "..mute_mdd.."\n*Ban Document* : "..mute_doc.."\n"
.."*Expire* : "..exp_dat.."\n======================"
   send(msg.chat_id_, msg.id_, 1, TXT, 1, 'md')
end

local text = msg.content_.text_:gsub('تنظیمات مسدود','ban settings')
  	 if text:match("^ban settings$") and is_mod(msg.sender_user_id_, msg.chat_id_) then
	if database:get('bot:muteallban'..msg.chat_id_) then
	mute_all = '`فعال | 🔐`'
else
mute_all = '⭕️'
end
------------
if database:get('bot:text:ban'..msg.chat_id_) then
mute_text = '❌'
else
mute_text = '⭕️'
end

if database:get('bot:note:ban'..msg.chat_id_) then
mute_note = '❌'
else
mute_note = '⭕️'
end
------------
if database:get('bot:photo:ban'..msg.chat_id_) then
mute_photo = '❌'
else
mute_photo = '⭕️'
end
------------
if database:get('bot:video:ban'..msg.chat_id_) then
mute_video = '❌'
else
mute_video = '⭕️'
end
------------
if database:get('bot:gifs:ban'..msg.chat_id_) then
mute_gifs = '❌'
else
mute_gifs = '⭕️'
end
------------
if database:get('bot:music:ban'..msg.chat_id_) then
mute_music = '❌'
else
mute_music = '⭕️'
end
------------
if database:get('bot:inline:ban'..msg.chat_id_) then
mute_in = '❌'
else
mute_in = '⭕️'
end
------------
if database:get('bot:voice:ban'..msg.chat_id_) then
mute_voice = '❌'
else
mute_voice = '⭕️'
end
  ------------
if database:get('bot:links:ban'..msg.chat_id_) then
mute_links = '❌'
else
mute_links = '⭕️'
end
  ------------
if database:get('bot:sticker:ban'..msg.chat_id_) then
lock_sticker = '❌'
else
lock_sticker = '⭕️'
end
------------
 if database:get('bot:cmd:ban'..msg.chat_id_) then
lock_cmd = '❌'
else
lock_cmd = '⭕️'
end

  if database:get('bot:webpage:ban'..msg.chat_id_) then
lock_wp = '❌'
else
lock_wp = '⭕️'
end
------------
  if database:get('bot:hashtag:ban'..msg.chat_id_) then
lock_htag = '❌'
else
lock_htag = '⭕️'
end
------------
  if database:get('bot:tag:ban'..msg.chat_id_) then
lock_tag = '❌'
else
lock_tag = '⭕️'
end
------------
  if database:get('bot:location:ban'..msg.chat_id_) then
lock_location = '❌'
else
lock_location = '⭕️'
end
------------
  if database:get('bot:contact:ban'..msg.chat_id_) then
lock_contact = '❌'
else
lock_contact = '⭕️'
end
------------
  if database:get('bot:english:ban'..msg.chat_id_) then
lock_english = '❌'
else
lock_english = '⭕️'
end
------------
  if database:get('bot:arabic:ban'..msg.chat_id_) then
lock_arabic = '❌'
else
lock_arabic = '⭕️'
end
------------
  if database:get('bot:forward:ban'..msg.chat_id_) then
lock_forward = '❌'
else
lock_forward = '⭕️'
end

if database:get('bot:document:ban'..msg.chat_id_) then
mute_doc = '❌'
else
mute_doc = '⭕️'
end

if database:get('bot:markdown:ban'..msg.chat_id_) then
mute_mdd = '❌'
else
mute_mdd = '⭕️'
end
	------------
	------------
	local ex = database:ttl("bot:charge:"..msg.chat_id_)
if ex == -1 then
exp_dat = '`بی پایان`'
else
exp_dat = math.floor(ex / 86400) + 1
			end
 	------------
	  local TXT = "🗑┇تنظیمات گروه به روی حالت مسدود :\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n✔️┇~⪼ فعال\n✖️┇~⪼ غیرفعال\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
..mute_all.."میوت همه".."\n"
..mute_links.." لینکط".."\n"
..mute_in.." اینلاین".."\n"
..lock_english.." انگیلسی".."\n"
..lock_forward.." فروارد".."\n"
..lock_arabic.." فارسی".."\n\n"
..lock_htag.." هشتگ".."\n"
..lock_tag.." تگ".."\n"
..lock_wp.." وب".."\n"
..lock_location.." موقعیت مکانی".."\n"
..mute_photo.." عکس".."\n\n"
..mute_note.." سلفی".."\n\n"
..mute_text.." متن".."\n"
..mute_gifs.." گیف".."\n"
..lock_sticker.." استیکر".."\n"
..lock_contact.." مخاطب".."\n"
..mute_voice.." ویس".."\n"
..mute_music.." موزیک".."\n\n"
..mute_video.." فیلم".."\n"
..lock_cmd.." دستورات".."\n"
..mute_mdd.." منشن".."\n"
..mute_doc.." فایل".."\n"
.."┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
..exp_dat.."شارژ باقی مانده ".." \n"
.."┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
  send(msg.chat_id_, msg.id_, 1, TXT, 1, 'md')
   end
  -----------------------------------------------------------------------------------------------

  -----------------------------------------------------------------------------------------------
if (text and text == 'change dev text') and tonumber(msg.sender_user_id_) == tonumber(sudo_add) or (text and text == 'تغییر متن سودو') and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
if database:get('bot:lang:'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '<code» send the</code> <b>help</b>', 1, 'html')
else
send(msg.chat_id_, msg.id_, 1, '📥┇حال راهنمای خودرا وارد کنید !', 1, 'html')
end
redis:set('texts'..msg.sender_user_id_..''..bot_id, 'msg')
  return false end
if text:match("^(.*)$") then
local SASANZARE = redis:get('texts'..msg.sender_user_id_..''..bot_id)
if SASANZARE == 'msg' then
if database:get('bot:lang:'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '<code» Saved Send a</code> <b>help to watch the changes</b>', 1, 'html')
else
send(msg.chat_id_, msg.id_, 1, '✅┇متن سودو در راهنما تغییر کرد !', 1, 'html')
end
redis:set('texts'..msg.sender_user_id_..''..bot_id, 'no')
redis:set('text_sudo'..bot_id, text)
send(msg.chat_id_, msg.id_, 1, text , 1, 'html')
  return false end
 end
if (text and text == 'del dev text') and tonumber(msg.sender_user_id_) == tonumber(sudo_add) or (text and text == 'پاکسازی متن سودو') and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
 redis:del('text_sudo'..bot_id, text)
if database:get('bot:lang:'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '<b>Deleted</b>', 1, 'html')
else
 send(msg.chat_id_, msg.id_, 1, '☑┇پاک شد ! ', 1, 'html')
  end
  end
if text:match("^[Dd][Ee][Vv]$")or text:match("^سودو$") or text:match("^مدیر$") or text:match("^سودو ربات$") or text:match("^راد$") or text:match("^sudo$") and msg.reply_to_message_id_ == 0 then
  local text_sudo = redis:get('text_sudo'..bot_id)
local nSASI = redis:get('nmSASI'..bot_id)
local naSASI = redis:get('naSASI'..bot_id)
  if text_sudo then
  send(msg.chat_id_, msg.id_, 1, text_sudo, 1, 'md')
  else
  sendContact(msg.chat_id_, msg.id_, 0, 1, nil, (nSASI or 989916236675), (naSASI or "Mr ~> SASI"), "", bot_id)
end
 end
  for k,v in pairs(sudo_users) do
local text = msg.content_.text_:gsub('تغییر شماره سودو','change ph')
if text:match("^[Cc][Hh][Aa][Nn][Gg][Ee] [Pp][Hh]$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
if database:get('bot:lang:'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '_> Now send the_ *developer number*', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, 'هم اکنون شماره مورد نظر را وارد کنید !', 1, 'md')
end
redis:set('nSASI'..msg.sender_user_id_..''..bot_id, 'msg')
  return false end
end
if text:match("^+(.*)$") then
local SASIo = redis:get('sudoo'..text..''..bot_id)
local SASANZARE = redis:get('nSASI'..msg.sender_user_id_..''..bot_id)
if SASANZARE == 'msg' then
if database:get('bot:lang:'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '_> Now send the_ *name of the developer*', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, 'حال نام خاطب را وارد کنید !', 1, 'md')
end
redis:set('nmSASI'..bot_id, text)
redis:set('nSASI'..msg.sender_user_id_..''..bot_id, 'mmsg')
  return false end
end
if text:match("^(.*)$") then
local SASANZARE = redis:get('nSASI'..msg.sender_user_id_..''..bot_id)
if SASANZARE == 'mmsg' then
if database:get('bot:lang:'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '_> Saved Send a_ *DEV to watch the changes*', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, 'ذخیره شد !', 1, 'md')
end
redis:set('nSASI'..msg.sender_user_id_..''..bot_id, 'no')
redis:set('naSASI'..bot_id, text)
local nmSASI = redis:get('nmSASI'..bot_id)
sendContact(msg.chat_id_, msg.id_, 0, 1, nil, nmSASI, text , "", bot_id)
  return false end
end

local text = msg.content_.text_:gsub('ارتقا سودو','add sudo')
	if text:match("^[Aa][Dd][Dd] [Ss][Uu][Dd][Oo]$")  and tonumber(msg.sender_user_id_) == tonumber(sudo_add) and msg.reply_to_message_id_ then
	function promote_by_reply(extra, result, success)
	if redis:sismember('dev'..bot_id, result.sender_user_id_) then
  if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_User_ *'..result.sender_user_id_..'* _is Already sudo._', 1, 'md')
  else
   send(msg.chat_id_, msg.id_, 1, '👤┇کاربر *('..result.sender_user_id_..')* از قبل میتوانست ربات را کنترل کند !', 1, 'md')
  end
else
	redis:set('sudoo'..result.sender_user_id_..''..bot_id, 'yes')
	redis:sadd('dev'..bot_id, result.sender_user_id_)
  if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_User_ *'..result.sender_user_id_..'* _add as sudo._', 1, 'md')
  else
   send(msg.chat_id_, msg.id_, 1, '👤 اشتراک : *('..result.sender_user_id_..')* سودو شد !', 1, 'md')
  end
	end
end
	getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
end
	-----------------------------------------------------------------------------------------------
	if text:match("^[Aa][Dd][Dd] [Ss][Uu][Dd][Oo] @(.*)$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
	local apmd = {string.match(text, "^([Aa][Dd][Dd] [Ss][Uu][Dd][Oo]) @(.*)$")}
	function promote_by_username(extra, result, success)
	if result.id_ then
	redis:set('sudoo'..result.id_..''..bot_id, 'yes')
	redis:sadd('dev'..bot_id, result.id_)
  if database:get('bot:lang:'..msg.chat_id_) then
texts = '<code>User '..result.id_..' add as sudo.!</code>'
else
  texts = '👤┇کاربر ('..result.id_..') سودو شد !'
end
else
  if database:get('bot:lang:'..msg.chat_id_) then
texts = '<code>User not found!</code>'
else
  texts = 'موجود نیست !'
end
end
	   send(msg.chat_id_, msg.id_, 1, texts, 1, 'html')
end
	resolve_username(apmd[2],promote_by_username)
end
	-----------------------------------------------------------------------------------------------
	if text:match("^[Aa][Dd][Dd] [Ss][Uu][Dd][Oo] (%d+)$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
	local apmd = {string.match(text, "^([Aa][Dd][Dd] [Ss][Uu][Dd][Oo]) (%d+)$")}
	redis:set('sudoo'..apmd[2]..''..bot_id, 'yes')
	redis:sadd('dev'..bot_id, apmd[2])
if database:get('bot:lang:'..msg.chat_id_) then
	send(msg.chat_id_, msg.id_, 1, '_User_ *'..apmd[2]..'* _add as sudo._', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, '👤 اشتراک : *('..apmd[2]..')* سودو شد !', 1, 'md')
end
end
	-----------------------------------------------------------------------------------------------
  local text = msg.content_.text_:gsub('عزل سودو','rem sudo')
	if text:match("^[Rr][Ee][Mm] [Ss][Uu][Dd][Oo]$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) and msg.reply_to_message_id_ then
	function demote_by_reply(extra, result, success)
	if not redis:sismember('dev'..bot_id, result.sender_user_id_) then
  if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_User_ *'..result.sender_user_id_..'* _is not sudo._', 1, 'md')
  else
send(msg.chat_id_, msg.id_, 1, '👤┇کارلر : *('..result.sender_user_id_..')* ️در لیست افراد کنترل کننده ربات نیست !', 1, 'md')
  end
	else
	redis:del('sudoo'..result.sender_user_id_..''..bot_id, 'no')
	redis:srem('dev'..bot_id, result.sender_user_id_)
  if database:get('bot:lang:'..msg.chat_id_) then

   send(msg.chat_id_, msg.id_, 1, '_User_ *'..result.sender_user_id_..'* _Demoted sudo._', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '👤┇کاربر: *('..result.sender_user_id_..')* از مقام کنترل ربات عزل شد !', 1, 'md')
	end
  end
  end
	getMessage(msg.chat_id_, msg.reply_to_message_id_,demote_by_reply)
end
	-----------------------------------------------------------------------------------------------
	if text:match("^[Rr][Ee][Mm] [Ss][Uu][Dd][Oo] @(.*)$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
	local apmd = {string.match(text, "^([Rr][Ee][Mm] [Ss][Uu][Dd][Oo]) @(.*)$")}
	function demote_by_username(extra, result, success)
	if result.id_ then
	redis:del('sudoo'..result.id_..''..bot_id, 'no')
	redis:srem('dev'..bot_id, result.id_)
  if database:get('bot:lang:'..msg.chat_id_) then
texts = '<b>User </b><code>'..result.id_..'</code> <b>Demoted sudo</b>'
else
  texts = '👤 اشتراک : ('..result.id_..') از مقام کنترل ربات عزل شد !'
end
else
  if database:get('bot:lang:'..msg.chat_id_) then
texts = '<code>User not found!</code>'
else
  texts = 'موجود نیست !'
  end
end
	   send(msg.chat_id_, msg.id_, 1, texts, 1, 'html')
end
	resolve_username(apmd[2],demote_by_username)
end
	-----------------------------------------------------------------------------------------------
	if text:match("^[Rr][Ee][Mm] [Ss][Uu][Dd][Oo] (%d+)$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
	local apmd = {string.match(text, "^([Rr][Ee][Mm] [Ss][Uu][Dd][Oo]) (%d+)$")}
	redis:del('sudoo'..apmd[2]..''..bot_id, 'no')
	redis:srem('dev'..bot_id, apmd[2])
  if database:get('bot:lang:'..msg.chat_id_) then
	send(msg.chat_id_, msg.id_, 1, '_User_ *'..apmd[2]..'* _Demoted sudo._', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '👤┇کاربر *('..apmd[2]..')*  از مقام سودو برکنار شد ! ', 1, 'md')
  end
  end

local text = msg.content_.text_:gsub('افزون ریپلی ','add rep')
if text:match("^[Aa][Dd][Dd] [Rr][Ee][Pp]$") and is_owner(msg.sender_user_id_ , msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '_> Send the word_ *you want to add*', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '📥┇ورودی خود را وارد کنید !', 1, 'md')
end
redis:set('SASI1'..msg.sender_user_id_..''..bot_id..''..msg.chat_id_..'', 'msg')
  return false end
if text:match("^(.*)$") then
if not database:get('bot:repowner:mute'..msg.chat_id_) then
local SASAN = redis:get('SASAN'..text..''..bot_id..''..msg.chat_id_..'')
send(msg.chat_id_, msg.id_, 1, SASAN, 1, 'md')
end
local SASI1 = redis:get('SASI1'..msg.sender_user_id_..''..bot_id..''..msg.chat_id_..'')
if SASI1 == 'msg' then
if database:get('bot:lang:'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '_> Send the reply_ *you want to add*', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '📥┇جواب را وارد کنید !', 1, 'md')
end
redis:set('SASI1'..msg.sender_user_id_..''..bot_id..''..msg.chat_id_..'', 're')
redis:set('msg'..msg.sender_user_id_..''..bot_id..''..msg.chat_id_..'', text)
redis:sadd('repowner'..msg.sender_user_id_..''..bot_id..''..msg.chat_id_..'', text)
  return false end
if SASI1 == 're' then
local SASANZARE = redis:get('msg'..msg.sender_user_id_..''..bot_id..''..msg.chat_id_..'')
redis:set('SASAN'..SASANZARE..''..bot_id..''..msg.chat_id_..'', text)
redis:sadd('SASIre'..bot_id..''..msg.chat_id_..'', SASANZARE)
if database:get('bot:lang:'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '_> Saved_', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, "☑┇ذخیره شد !", 1, 'md')
end
redis:set('SASI1'..msg.sender_user_id_..''..bot_id..''..msg.chat_id_..'', 'no')
end
end

local text = msg.content_.text_:gsub('حذف ریپلی','rem rep')
if text:match("^[Rr][Ee][Mm] [Rr][Ee][Pp]$") and is_owner(msg.sender_user_id_ , msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '_> Send the word_ *you want to remov*', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '📥┇ورودی خود را وارد کنید !', 1, 'md')
end
redis:set('SASI1'..msg.sender_user_id_..''..bot_id..''..msg.chat_id_..'', 'nomsg')
  return false end
if text:match("^(.*)$") then
local SASI1 = redis:get('SASI1'..msg.sender_user_id_..''..bot_id..''..msg.chat_id_..'')
if SASI1 == 'nomsg' then
if database:get('bot:lang:'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '_> Deleted_', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '☑┇حذف شد !', 1, 'md')
end
redis:set('SASI1'..msg.sender_user_id_..''..bot_id..''..msg.chat_id_..'', 'no')
redis:set('SASAN'..text..''..bot_id..''..msg.chat_id_..'', " ")
 end
end

local text = msg.content_.text_:gsub('افزودن تمام ریپلی ها','add rep all')
if text:match("^[Aa][Dd][Dd] [Rr][Ee][Pp] [Aa][Ll][Ll]$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add)  then
if database:get('bot:lang:'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '_> Send the word_ *you want to add*', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '📥┇کلمه خودرا وارد کنید !', 1, 'md')
end
redis:set('SASI1'..msg.sender_user_id_..''..bot_id, 'msg')
  return false end
if text:match("^(.*)$") then
if not database:get('bot:repsudo:mute'..msg.chat_id_) then
local SASAN = redis:get('SASAN'..text..''..bot_id)
send(msg.chat_id_, msg.id_, 1, SASAN, 1, 'md')
end
local SASI1 = redis:get('SASI1'..msg.sender_user_id_..''..bot_id)
if SASI1 == 'msg' then
if database:get('bot:lang:'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '_> Send the reply_ *you want to add*', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '📥┇حال جواب خود را وارد کنید !', 1, 'md')
end
redis:set('SASI1'..msg.sender_user_id_..''..bot_id, 're')
redis:set('msg'..msg.sender_user_id_..''..bot_id, text)
  return false end
if SASI1 == 're' then
local SASANZARE = redis:get('msg'..msg.sender_user_id_..''..bot_id)
redis:set('SASAN'..SASANZARE..''..bot_id, text)
redis:sadd('SASIresudo'..bot_id, SASANZARE)
if database:get('bot:lang:'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '_> Saved_', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, "☑┇ریپلی با موفقیت ذخیره شد !", 1, 'md')
end
redis:set('SASI1'..msg.sender_user_id_..''..bot_id, 'no')
end
end

local text = msg.content_.text_:gsub('پاکسازی تمام ریپلی ها','rem rep all')
if text:match("^[Rr][Ee][Mm] [Rr][Ee][Pp] [Aa][Ll][Ll]$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add)  then
if database:get('bot:lang:'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '_> Send the word_ *you want to remov*', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '📥┇کلمه ورودی را وارد کنید !' , 1, 'md')
end
redis:set('SASI1'..msg.sender_user_id_..''..bot_id, 'nomsg')
  return false end
if text:match("^(.*)$") then
local SASI1 = redis:get('SASI1'..msg.sender_user_id_..''..bot_id)
if SASI1 == 'nomsg' then
if database:get('bot:lang:'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '_> Deleted_', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '☑┇حذف شد !', 1, 'md')
end
redis:set('SASI1'..msg.sender_user_id_..''..bot_id, 'no')
 redis:set('SASAN'..text..''..bot_id..'', " ")
 end
end

local text = msg.content_.text_:gsub('پاکسازی لیست سودو','clean sudo')
if text:match("^[Cc][Ll][Ee][Aa][Nn] [Ss][Uu][Dd][Oo]$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
  local list = redis:smembers('dev'..bot_id)
  for k,v in pairs(list) do
redis:del('dev'..bot_id, text)
redis:del('sudoo'..v..''..bot_id, 'no')
end
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> Bot developers_ *have been cleared*', 1, 'md')
else
  send(msg.chat_id_, msg.id_, 1, "☑┇تمامی سودو های ربات عزل شدند !", 1, 'md')
end
  end

local text = msg.content_.text_:gsub('پاکسازی ریپلی مدیران','clean rep owner')
if text:match("^[Cc][Ll][Ee][Aa][Nn] [Rr][Ee][Pp] [Oo][Ww][Nn][Ee][Rr]$") and is_owner(msg.sender_user_id_, msg.chat_id_) then
  local list = redis:smembers('SASIre'..bot_id..''..msg.chat_id_..'')
  for k,v in pairs(list) do
redis:del('SASIre'..bot_id..''..msg.chat_id_..'', text)
redis:set('SASAN'..v..''..bot_id..''..msg.chat_id_..'', " ")
end
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> Owner replies_ *cleared*', 1, 'md')
else
  send(msg.chat_id_, msg.id_, 1, "تمامی ریپلی های مدیران پاکسازی شد", 1, 'md')
end
  end

local text = msg.content_.text_:gsub('پاکسازی ریپلی سودو','clean rep sudo')
if text:match("^[Cc][Ll][Ee][Aa][Nn] [Rr][Ee][Pp] [Ss][Uu][Dd][Oo]$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add)  then
  local list = redis:smembers('SASIresudo'..bot_id)
  for k,v in pairs(list) do
redis:del('SASIresudo'..bot_id, text)
redis:set('SASAN'..v..''..bot_id..'', " ")
end
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '_> Sudo replies_ *cleared*', 1, 'md')
else
  send(msg.chat_id_, msg.id_, 1, "☑┇تمامی ریپلی های سودو پاکسازی شدند !", 1, 'md')
end
  end

local text = msg.content_.text_:gsub('لیست سودو','sudo list')
if text:match("^[Ss][Uu][Dd][Oo] [Ll][Ii][Ss][Tt]$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
     local list = redis:smembers('dev'..bot_id)
     if database:get('bot:lang:'..msg.chat_id_) then
     text = "<b>Sudo List:</b>\n\n"
   else
     text = "⛔️┇لیست سودوهای ربات :\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
     end
     for k,v in pairs(list) do
     local user_info = database:hgetall('user:'..v)
   if user_info and user_info.username then
   local username = user_info.username
   text = text.."<b>|"..k.."|</b>~⪼(@"..username..")\n"
   else
   text = text.."<b>|"..k.."|</b>~⪼(<code>"..v.."</code>)\n"
   end
     end
     if #list == 0 then
   if database:get('bot:lang:'..msg.chat_id_) then
   text = "<b>Sudo List is empty !</b>"
     else
   text = "لیست خالیست !"
   end
   end
     send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
   end
------------------------------------
local text = msg.content_.text_:gsub('لیست ریپلی سودو','rep sudo list')
if text:match("^[Rr][Ee][Pp] [Ss][Uu][Dd][Oo] [Ll][Ii][Ss][Tt]$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add)  then
	local list = redis:smembers('SASIresudo'..bot_id)
  if database:get('bot:lang:'..msg.chat_id_) then
  text = "<b>rep sudo List :</b>\nֆ • • • • • • • • • • • • • ֆ\n• ✅ :- Enabled\n• ❎ :- Disabled\nֆ • • • • • • • • • • • • • ֆ\n"
else
  text = "📑┇لیستجواب سودو :\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n✔┇فعال\n✖┇غیرفعال\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
  end
	for k,v in pairs(list) do
  local SASI11 = redis:get('SASAN'..v..''..bot_id)
			local botlua = "✔┇"
   if SASI11 == ' ' then
   botlua = "✖┇"
  if database:get('bot:lang:'..msg.chat_id_) then
  text = text.."<b>|"..k.."|</b>"..botlua.." ~⪼(<code>"..v.."</code>)\n"
  else
  text = text.."<b>|"..k.."|</b>"..botlua.." ~⪼("..v..")\n"
			end
		else
  if database:get('bot:lang:'..msg.chat_id_) then
text = text.."<b>|"..k.."|</b>"..botlua.." ~⪼(<code>"..v.."</code>)\n"
else
text = text.."<b>|"..k.."|</b>"..botlua.." ~⪼("..v..")\n"
			end
		end
	end
	if #list == 0 then
	   if database:get('bot:lang:'..msg.chat_id_) then
text = "<b>rep owner List is empty !</b>"
  else
text = "موجود نیست !"
end
end
	send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end

local text = msg.content_.text_:gsub('لیست ریپلی مدیران','rep owner list')
if text:match("^[Rr][Ee][Pp] [Oo][Ww][Nn][Ee][Rr] [Ll][Ii][Ss][Tt]$") and is_owner(msg.sender_user_id_, msg.chat_id_) then
  local list = redis:smembers('SASIre'..bot_id..''..msg.chat_id_..'')
  if database:get('bot:lang:'..msg.chat_id_) then
  text = "<b>rep owner List :</b>\nֆ • • • • • • • • • • • • • ֆ\n• ✅ :- Enabled\n• ❎ :- Disabled\nֆ • • • • • • • • • • • • • ֆ\n"
else
  text = "📑┇لیست کلمات جواب :\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n✔┇فعال\n✖┇غیرفعال\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
  end
	for k,v in pairs(list) do
local SASI11 = redis:get('SASAN'..v..''..bot_id..''..msg.chat_id_..'')
			local botlua = "✔┇"
 if SASI11 == ' ' then
 botlua = "✖┇"
  if database:get('bot:lang:'..msg.chat_id_) then
text = text.."<b>|"..k.."|</b>"..botlua.." ~⪼(<code>"..v.."</code>)\n"
 else
  text = text.."<b>|"..k.."|</b>"..botlua.." ~⪼("..v..")\n"
			end
		else
  if database:get('bot:lang:'..msg.chat_id_) then
text = text.."<b>|"..k.."|</b>"..botlua.." ~⪼(<code>"..v.."</code>)\n"
 else
  text = text.."<b>|"..k.."|</b>"..botlua.." ~⪼("..v..")\n"
			end
		end
	end
	if #list == 0 then
	   if database:get('bot:lang:'..msg.chat_id_) then
text = "<b>rep owner List is empty !</b>"
  else
text = "موجود نیست !"
end
end
	send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
	-----------------------------------------------------------------------------------------------
local text = msg.content_.text_:gsub('تکرار','echo')
  	if text:match("^echo (.*)$") and is_mod(msg.sender_user_id_, msg.chat_id_) then
	local txt = {string.match(text, "^(echo) (.*)$")}
   send(msg.chat_id_, msg.id_, 1, txt[2], 1, 'html')
end
	-----------------------------------------------------------------------------------------------
local text = msg.content_.text_:gsub('تنظیم قوانین','setrules')
  	if text:match("^[Ss][Ee][Tt][Rr][Uu][Ll][Ee][Ss] (.*)$") and is_mod(msg.sender_user_id_, msg.chat_id_) then
	local txt = {string.match(text, "^([Ss][Ee][Tt][Rr][Uu][Ll][Ee][Ss]) (.*)$")}
	database:set('bot:rules'..msg.chat_id_, txt[2])
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, "*> Group rules upadted..._", 1, 'md')
   else
   send(msg.chat_id_, msg.id_, 1, "✔┇قوانین بروز شدند !", 1, 'md')
end
  end


	-----------------------------------------------------------------------------------------------
  	if text:match("^[Rr][Uu][Ll][Ee][Ss]$")or text:match("^قوانین$") then
	local rules = database:get('bot:rules'..msg.chat_id_)
	if rules then
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '*Group Rules :*\n'..rules, 1, 'md')
 else
   send(msg.chat_id_, msg.id_, 1, '⚜┇قوانین گروه :\n'..rules, 1, 'md')
end
else
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '*rules msg not saved!*', 1, 'md')
 else
   send(msg.chat_id_, msg.id_, 1, '⚜┇قوانین ثبت نشده است !', 1, 'md')
end
	end
	end
	-----------------------------------------------------------------------------------------------
local text = msg.content_.text_:gsub('تنظیم نام','setname')
		if text:match("^[Ss][Ee][Tt][Nn][Aa][Mm][Ee] (.*)$") and is_mod(msg.sender_user_id_, msg.chat_id_)  then
	local txt = {string.match(text, "^([Ss][Ee][Tt][Nn][Aa][Mm][Ee]) (.*)$")}
	changetitle(msg.chat_id_, txt[2])
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_Group name updated!_\n'..txt[2], 1, 'md')
 else
   send(msg.chat_id_, msg.id_, 1, 'نام گروه به '..txt[2]' تغییر کرد ', 1, 'md')
   end
end
	-----------------------------------------------------------------------------------------------

		if text:match("^[Ss][Ee][Tt][Pp][Hh][Oo][Tt][Oo]$") and is_mod(msg.sender_user_id_, msg.chat_id_) or text:match("^تنظیم عکس") and is_mod(msg.sender_user_id_, msg.chat_id_) then
database:set('bot:setphoto'..msg.chat_id_..':'..msg.sender_user_id_,true)
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_Please send a photo noew!_', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, 'لطفا هم اکنون عکس مورد نظر خود را ارسال کنید !', 1, 'md')
end
end

	if text:match("^[Dd][Ee][Ll][Pp][Hh][Oo][Tt][Oo]$") and is_mod(msg.sender_user_id_, msg.chat_id_) or text:match("^حذف عکس") and is_mod(msg.sender_user_id_, msg.chat_id_) then
https.request('https://api.telegram.org/bot'..token..'/deleteChatPhoto?chat_id='..msg.chat_id_)
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_Photo Group Deleted!_', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, 'عکس گروه حذف !', 1, 'md')
end
end

local text = msg.content_.text_:gsub('تنظیم درباره','setabout')
       if text:match("^[Ss][Ee][Tt][Aa][Bb][Oo][Uu][Tt] (.*)$") and is_mod(msg.sender_user_id_, msg.chat_id_) then
       local text = {string.match(text, "^([Ss][Ee][Tt][Aa][Bb][Oo][Uu][Tt]) (.*)$")}
             bot.changeChannelAbout(msg.chat_id_,text[2])
       if database:get('bot:lang:'..msg.chat_id_) then
                  send(msg.chat_id_, msg.id_, 1, "*> Group About Upadted..._", 1, 'md')
                  else
                  send(msg.chat_id_, msg.id_, 1, "متن درباره گروه بروز شد !", 1, 'md')
               end
   end
-----------------------------------------------------------------------------------------------
local text = msg.content_.text_:gsub('شارژ','setexpire')
	if text:match("^[Ss][Ee][Tt][Ee][Xx][Pp][Ii][Rr][Ee] (%d+)$") and is_sudo(msg) then
		local a = {string.match(text, "^([Ss][Ee][Tt][Ee][Xx][Pp][Ii][Rr][Ee]) (%d+)$")}
		 local time = a[2] * day
   database:setex("bot:charge:"..msg.chat_id_,time,true)
		 database:set("bot:enable:"..msg.chat_id_,true)
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_Group Charged for_ *'..a[2]..'* _Days_', 1, 'md')
else
   send(msg.chat_id_, msg.id_, 1, '🔖 گروه به مدت  *{'..a[2]..'}* شارژ شد !', 1, 'md')
end
  end

	-----------------------------------------------------------------------------------------------
	if text:match("^[Ss][Tt][Aa][Tt][Ss]$") or text:match("^اعتبار$") and is_mod(msg.sender_user_id_, msg.chat_id_) then
local ex = database:ttl("bot:charge:"..msg.chat_id_)
 if ex == -1 then
if database:get('bot:lang:'..msg.chat_id_) then
		send(msg.chat_id_, msg.id_, 1, 'unlimited !', 1, 'md')
else
		send(msg.chat_id_, msg.id_, 1, '☑️ گروه به مدت نامحدود شارژ شده است !', 1, 'md')
end
 else
  local d = math.floor(ex / day ) + 1
if database:get('bot:lang:'..msg.chat_id_) then
	   		send(msg.chat_id_, msg.id_, 1, d.." *Group Days*", 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, "اعتبار گروه به مدت {"..d.."} روز است !", 1, 'md')
end
 end
end
	-----------------------------------------------------------------------------------------------

	if text:match("^اعتبار (-%d+)$") and is_sudo(msg) then
	local txt = {string.match(text, "^(اعتبار) (-%d+)$")}
local ex = database:ttl("bot:charge:"..txt[2])
 if ex == -1 then
		send(msg.chat_id_, msg.id_, 1, 'بینهایت !', 1, 'md')
 else
  local d = math.floor(ex / day ) + 1
send(msg.chat_id_, msg.id_, 1, "تعداد روز های باقی مانده : {"..d.."}", 1, 'md')
 end
end

	if text:match("^[Ss][Tt][Aa][Tt][Ss] [Gg][Pp] (-%d+)") and is_sudo(msg) then
	local txt = {string.match(text, "^([Ss][Tt][Aa][Tt][Ss] [Gg][Pp]) (-%d+)$")}
local ex = database:ttl("bot:charge:"..txt[2])
 if ex == -1 then
		send(msg.chat_id_, msg.id_, 1, '_No fanil_', 1, 'md')
 else
  local d = math.floor(ex / day ) + 1
	   		send(msg.chat_id_, msg.id_, 1, d.." *Group is Days*", 1, 'md')
 end
end
	-----------------------------------------------------------------------------------------------

  -----------------------------------------------------------------------------------------------
  if text:match("^[Ll][Ee][Aa][Vv][Ee] (-%d+)$") and is_sudo(msg) then
  	local txt = {string.match(text, "^([Ll][Ee][Aa][Vv][Ee]) (-%d+)$")}
	   send(msg.chat_id_, msg.id_, 1, '*Group* '..txt[2]..' *remov*', 1, 'md')
	   send(txt[2], 0, 1, '*Error*\n_Group is not my_', 1, 'md')
	   chat_leave(txt[2], bot_id)
  end

  if text:match("^خروج (-%d+)$") and is_sudo(msg) then
  	local txt = {string.match(text, "^(خروج) (-%d+)$")}
	   send(msg.chat_id_, msg.id_, 1, 'گروه {'..txt[2]..'} حذف شد !', 1, 'md')
	   send(txt[2], 0, 1, 'این گروه از لیست امن ربات حذف شد !', 1, 'md')
	   chat_leave(txt[2], bot_id)
  end
  -----------------------------------------------------------------------------------------------
  if text:match('^پلن 1 (-%d+)$') and is_sudo(msg) then
 local txt = {string.match(text, "^(پلن 1) (-%d+)$")}
 local SASI_info = nil
  function SASI333(extra,result,success)
   SASI_info = '@'..(result.username_ or 'موجود نیست')..''
 local timeplan1 = 2592000
 database:setex("bot:charge:"..txt[2],timeplan1,true)
	   send(msg.chat_id_, msg.id_, 1, 'گروه ('..txt[2]..') به مدت 30 روز شارژ شد !', 1, 'md')
	 send(txt[2], 0, 1, '☑┇30 روز شارژ شد !', 1, 'md')
	   for k,v in pairs(sudo_users) do
 send(v, 0, 1, "پلن 1 انجام شد  \n شناسه فرد تنظیم کننده : ("..msg.sender_user_id_..")\nیوزرنیم فرد تنظیم کننده : "..SASI_info.."\n🌐 اطلاعات گروه :\n\nشناسه گروه : ("..msg.chat_id_..")\nنام گروه : ("..chat.title_..")" , 1, 'md')
 end
	   database:set("bot:enable:"..txt[2],true)
  end
   getUser(msg.sender_user_id_, SASI333)
   end
  -----------------------------------------------------------------------------------------------
  if text:match('^[Pp][Ll][Aa][Nn]1 (-%d+)$') and is_sudo(msg) then
 local txt = {string.match(text, "^([Pp][Ll][Aa][Nn]1) (-%d+)$")}
 local timeplan1 = 2592000
 database:setex("bot:charge:"..txt[2],timeplan1,true)
	   send(msg.chat_id_, msg.id_, 1, '_Group_ '..txt[2]..' *Done 30 Days Active*', 1, 'md')
	   send(txt[2], 0, 1, '*Done 30 Days Active*', 1, 'md')
	   for k,v in pairs(sudo_users) do
	send(v, 0, 1, "*User "..msg.sender_user_id_.." Added bot to new group*" , 1, 'md')
 end
	   database:set("bot:enable:"..txt[2],true)
  end
  -----------------------------------------------------------------------------------------------
  if text:match('^پلن 2 (-%d+)$') and is_sudo(msg) then
 local txt = {string.match(text, "^(پلن 2) (-%d+)$")}
local SASI_info = nil
  function SASI333(extra,result,success)
   SASI_info = '@'..(result.username_ or 'موجود نیست !')..''
 local timeplan2 = 7776000
 database:setex("bot:charge:"..txt[2],timeplan2,true)
	   send(msg.chat_id_, msg.id_, 1, 'گروه به مدت ('..txt[2]..') 90 روز شارژ شد !', 1, 'md')
	   send(txt[2], 0, 1, 'گروه به مدت 90 روز شارژ شد !', 1, 'md')
	   for k,v in pairs(sudo_users) do
 send(v, 0, 1, "پلن 2 انجام شد !  \n شناسه فرد تنظیم کننده : ("..msg.sender_user_id_..")\nیوزرنیم فرد تنظیم کننده : "..SASI_info.."\n🌐 اطلاعات گروه :\n\nشناسه گروه : ("..msg.chat_id_..")\nنام گروه : ("..chat.title_..")" , 1, 'md')
 end
	   database:set("bot:enable:"..txt[2],true)
  end
 getUser(msg.sender_user_id_, SASI333)
 end
-------------------------------------------------------------------------------------------------
  if text:match('^[Pp][Ll][Aa][Nn]2 (-%d+)$') and is_sudo(msg) then
 local txt = {string.match(text, "^([Pp][Ll][Aa][Nn]2) (-%d+)$")}
 local timeplan2 = 7776000
 database:setex("bot:charge:"..txt[2],timeplan2,true)
	   send(msg.chat_id_, msg.id_, 1, '_Group_ '..txt[2]..' *Done 90 Days Active*', 1, 'md')
	   send(txt[2], 0, 1, '*Done 90 Days Active*', 1, 'md')
	   for k,v in pairs(sudo_users) do
	send(v, 0, 1, "*User "..msg.sender_user_id_.." Added bot to new group*" , 1, 'md')
 end
	   database:set("bot:enable:"..txt[2],true)
  end
  -----------------------------------------------------------------------------------------------
  if text:match('^پلن 3 (-%d+)$') and is_sudo(msg) then
 local txt = {string.match(text, "^(پلن 3) (-%d+)$")}
local SASI_info = nil
  function SASI333(extra,result,success)
   SASI_info = '@'..(result.username_ or 'موجود نیست !')..''
 database:set("bot:charge:"..txt[2],true)
	   send(msg.chat_id_, msg.id_, 1, 'گروه  ('..txt[2]..') نامحدود شارژ شد !', 1, 'md')
	   send(txt[2], 0, 1, 'گروهی به صورت نامحدود شارژ شد !', 1, 'md')
	   for k,v in pairs(sudo_users) do
send(v, 0, 1, "پلن 3 انجام شد ! \n شناسه فرد تنظیم کننده : ("..msg.sender_user_id_..")\nیوزرنیم فرد تنظیم کننده : "..SASI_info.."\n🌐 اطلاعات گروه :\n\nشناسه گروه : ("..msg.chat_id_..")\nنام گروه : ("..chat.title_..")" , 1, 'md')
 end
	   database:set("bot:enable:"..txt[2],true)
  end
 getUser(msg.sender_user_id_, SASI333)
 end
  -----------------------------------------------------------------------------------------------
  if text:match('^[Pp][Ll][Aa][Nn]3 (-%d+)$') and is_sudo(msg) then
 local txt = {string.match(text, "^([Pp][Ll][Aa][Nn]3) (-%d+)$")}
 database:set("bot:charge:"..txt[2],true)
	   send(msg.chat_id_, msg.id_, 1, '_Group_ '..txt[2]..' *Done Days No Fanil Active*', 1, 'md')
	   send(txt[2], 0, 1, '*Done Days No Fanil Active*', 1, 'md')
	   for k,v in pairs(sudo_users) do
	send(v, 0, 1, "*User "..msg.sender_user_id_.." Added bot to new group*" , 1, 'md')
 end
	   database:set("bot:enable:"..txt[2],true)
  end
  -----------------------------------------------------------------------------------------------
local text = msg.content_.text_:gsub('نصب ربات','add')
  if text:match('^[Aa][Dd][Dd]$') then
  local txt = {string.match(text, "^([Aa][Dd][Dd])$")}
local SASI_info = nil
	local hash = 'bot:owners:'..msg.chat_id_
	local add = [[
✅  ربات با موفقیت در گروه فعال شد !


❇️  ادمین اصلی گروه و مالک آن پس از این پیام به رسمیت شناخته شدند  و همچنین گروه به صورت نامحدود شارژ شد !
⁉️ برای دریافت راهنمای ربات و آگاهی از دستورات و کارایی و قوانین و برای دریافت پلی ارتباطی بین ما و شما دستور "راهنما" را وارد کنید !
🌐 تیم برنامه نویسی ]] ..botnamefa.. [[ لحظات امنی را بدون تبلیغ برای شما به ارمغان خواهد آورد
]]
  function SASI333(extra,result,success)
  if database:get("bot:charge:"..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '*Bot is already Added Group*', 1, 'md')
else
  send(msg.chat_id_, msg.id_, 1, "🗂 گروه  {"..chat.title_.."} از قبل در لیست مدیریتی گروه های امن ربات بود !", 1, 'md')
end
  end
 if not database:get("bot:charge:"..msg.chat_id_) then
 database:set("bot:charge:"..msg.chat_id_,true)
if database:get('bot:lang:'..msg.chat_id_) then
	   send(msg.chat_id_, msg.id_, 1, "*> Your ID :* _"..msg.sender_user_id_.."_\n*> Bot Added To Group*", 1, 'md')
   else
   database:sadd(hash,  msg.sender_user_id_)
  send(msg.chat_id_, msg.id_, 1, ""..add.."", 1, 'md')
end
	   for k,v in pairs(sudo_users) do
if database:get('bot:lang:'..msg.chat_id_) then
	send(v, 0, 1, ""..add.."" , 1, 'md')
else
send(v, 0, 1, "🔖 گروه جدیدی به به لیست گروه های ربات افزوده شد ! \n شناسه فرد تصب کننده : ("..msg.sender_user_id_..")\n یوزرنیم فرد نصب کننده : "..SASI_info.."\n🌐 اطلاعات گروه : \n\nشناسه گروه : ("..msg.chat_id_..")\n نام گروه : ("..chat.title_..")" , 1, 'md')
end
 end
	   database:set("bot:enable:"..msg.chat_id_,true)
  end
end
 getUser(msg.sender_user_id_, SASI333)
 end
  -----------------------------------------------------------------------------------------------
local text = msg.content_.text_:gsub('لغو نصب ربات','rem')
  if text:match('^[Rr][Ee][Mm]$') and is_sudo(msg) then
 local txt = {string.match(text, "^([Rr][Ee][Mm])$")}
local SASI_info = nil
  function SASI333(extra,result,success)
   SASI_info = '@'..(result.username_ or 'موجود نیست !')..''
if not database:get("bot:charge:"..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '*Bot is already remove Group*', 1, 'md')
else
  send(msg.chat_id_, msg.id_, 1, "🗂 گروه {"..chat.title_.."} در لیست گروه های امن ربات نبود !", 1, 'md')
end
  end
if database:get("bot:charge:"..msg.chat_id_) then
 database:del("bot:charge:"..msg.chat_id_)
if database:get('bot:lang:'..msg.chat_id_) then
	   send(msg.chat_id_, msg.id_, 1, "*> Your ID :* _"..msg.sender_user_id_.."_\n*> Bot Removed To Group!*", 1, 'md')
   else
  send(msg.chat_id_, msg.id_, 1, "🔖 گروه {"..chat.title_.."}  از لیست گروه های امن ربات حذف شد ! \n توسط : ("..msg.sender_user_id_..")", 1, 'md')
end
	   for k,v in pairs(sudo_users) do
if database:get('bot:lang:'..msg.chat_id_) then
	send(v, 0, 1, "*> Your ID :* _"..msg.sender_user_id_.."_\n*> Removed bot from new group*" , 1, 'md')
else
send(v, 0, 1, "🔖 گروهی از لیست گروه های امن حذف شد ! \n شناسه فرد حذف کنده  : ("..msg.sender_user_id_..")\n یوزرنیم فرد حذف کننده : "..SASI_info.."\n🌐 اطلاعات گروه : \n\nشناسه گروه : ("..msg.chat_id_..")\n نام گروه : ("..chat.title_..")" , 1, 'md')
end
 end
  end
  end
 getUser(msg.sender_user_id_, SASI333)
 end
  -----------------------------------------------------------------------------------------------
if text:match('^[Jj][Oo][Ii][Nn] (-%d+)') and is_sudo(msg) then
   local txt = {string.match(text, "^([Jj][Oo][Ii][Nn]) (-%d+)$")}
  	   send(msg.chat_id_, msg.id_, 1, '_Group_ '..txt[2]..' *is join*', 1, 'md')
  	   send(txt[2], 0, 1, '*Sudo Joined To Grpup*', 1, 'md')
  	   add_user(txt[2], msg.sender_user_id_, 10)
end
-----------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------
if text:match("^[Dd][Ee][Ll]$")  and is_mod(msg.sender_user_id_, msg.chat_id_) or text:match("^مسح$") and msg.reply_to_message_id_ ~= 0 and is_mod(msg.sender_user_id_, msg.chat_id_) then
delete_msg(msg.chat_id_, {[0] = msg.reply_to_message_id_})
delete_msg(msg.chat_id_, {[0] = msg.id_})
end
	----------------------------------------------------------------------------------------------
   if text:match('^پاکسازی (%d+)$') and is_owner(msg.sender_user_id_, msg.chat_id_) then
  local matches = {string.match(text, "^(پاکسازی) (%d+)$")}
   if msg.chat_id_:match("^-100") then
if tonumber(matches[2]) > 100 or tonumber(matches[2]) < 1 then
pm = 'حداقل باید 100 پیام باشد !'
send(msg.chat_id_, msg.id_, 1, pm, 1, 'html')
  else
tdcli_function ({
ID = "GetChatHistory",
 chat_id_ = msg.chat_id_,
from_message_id_ = 0,
   offset_ = 0,
limit_ = tonumber(matches[2])}, delmsg, nil)
pm ='تعداد {'..matches[2]..'} پیام حذف شد !'
send(msg.chat_id_, msg.id_, 1, pm, 1, 'html')
 end
  else pm ='❕┇هناك خطاء'
send(msg.chat_id_, msg.id_, 1, pm, 1, 'html')
  end
end


   if text:match('^[Dd]el (%d+)$') and is_owner(msg.sender_user_id_, msg.chat_id_) then
  local matches = {string.match(text, "^([Dd]el) (%d+)$")}
   if msg.chat_id_:match("^-100") then
if tonumber(matches[2]) > 100 or tonumber(matches[2]) < 1 then
pm = '<b>> Error</b>\n<b>use /del [1-1000] !<bb>'
send(msg.chat_id_, msg.id_, 1, pm, 1, 'html')
  else
tdcli_function ({
ID = "GetChatHistory",
 chat_id_ = msg.chat_id_,
from_message_id_ = 0,
   offset_ = 0,
limit_ = tonumber(matches[2])
}, delmsg, nil)
pm ='> <i>'..matches[2]..'</i> <b>Last Msgs Has Been Removed.</b>'
send(msg.chat_id_, msg.id_, 1, pm, 1, 'html')
 end
  else pm ='<b>> found!<b>'
send(msg.chat_id_, msg.id_, 1, pm, 1, 'html')
end
  end


  if text:match("^[Ss][Ee][Tt][Ll][Aa][Nn][Gg] (.*)$") and is_owner(msg.sender_user_id_, msg.chat_id_) or text:match("^زبان (.*)$") and is_owner(msg.sender_user_id_, msg.chat_id_) then
local langs = {string.match(text, "^(.*) (.*)$")}
  if langs[2] == "fa" or langs[2] == "فارسی" then
  if not database:get('bot:lang:'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, 'ربان خروجی فارسی بود !', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, 'زبان خروجی های ربات به فارسی تغییر کرد !', 1, 'md')
 database:del('bot:lang:'..msg.chat_id_)
end
end
  if langs[2] == "en" or langs[2] == "انگلیسی" then
  if database:get('bot:lang:'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '_> Language Bot is already_ *English*', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '> _Language Bot has been changed to_ *English* !', 1, 'md')
  database:set('bot:lang:'..msg.chat_id_,true)
end
end
end
----------------------------------------------------------------------------------------------
if (text and text == 'enable reply bot') and is_owner(msg.sender_user_id_, msg.chat_id_) or (text and text == 'Enable Reply Bot') and is_owner(msg.sender_user_id_, msg.chat_id_) or (text and text == 'ریپلی ربات فعال') and is_owner(msg.sender_user_id_, msg.chat_id_) then
  if not database:get('bot:rep:mute'..msg.chat_id_) then
  if database:get('bot:lang:'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '> *Replies bot is already enabled*️', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, 'ریپلی ربات فعال بود !', 1, 'md')
end
  else
  if database:get('bot:lang:'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '> *Replies bot has been enable*️', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, 'ریپلی ربات فعال شد !', 1, 'md')
 database:del('bot:rep:mute'..msg.chat_id_)
end
end
end
if (text and text == 'disable reply bot') and is_owner(msg.sender_user_id_, msg.chat_id_) or (text and text == 'Disable Reply Bot') and is_owner(msg.sender_user_id_, msg.chat_id_) or (text and text == 'ریپلی ربات غیرفعال') and is_owner(msg.sender_user_id_, msg.chat_id_) then
  if database:get('bot:rep:mute'..msg.chat_id_) then
  if database:get('bot:lang:'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '> *Replies bot is already disabled*️', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, 'ریپلی ربات غیرفعال بود !', 1, 'md')
end
else
  if database:get('bot:lang:'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '> *Replies bot has been disable*️', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, 'رپلی ربات غیرفعال شد !', 1, 'md')
  database:set('bot:rep:mute'..msg.chat_id_,true)
end
end
  end

if (text and text == 'idphoto on') and is_owner(msg.sender_user_id_, msg.chat_id_) or (text and text == 'Enable id photo') and is_owner(msg.sender_user_id_, msg.chat_id_) or (text and text == 'عکس ایدی فعال') and is_owner(msg.sender_user_id_, msg.chat_id_) then
if not database:get('bot:id:photo'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '> *id photo bot is already enabled*️', 1, 'md')
  else
  send(msg.chat_id_, msg.id_, 1, 'دریافت عکس در آیدی فعال بود !', 1, 'md')
  end
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '> *id photo bot has been enable*️', 1, 'md')
else
  send(msg.chat_id_, msg.id_, 1, 'دریافت عکس در آیدی فعال شد !', 1, 'md')
   database:del('bot:id:photo'..msg.chat_id_)
  end
end
end
if (text and text == 'idphoto off') and is_owner(msg.sender_user_id_, msg.chat_id_) or (text and text == 'Disable id photo') and is_owner(msg.sender_user_id_, msg.chat_id_) or (text and text == 'عکس ایدی غیرفعال') and is_owner(msg.sender_user_id_, msg.chat_id_) then
if database:get('bot:id:photo'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '> *id photo bot is already disabled*️', 1, 'md')
else
  send(msg.chat_id_, msg.id_, 1, 'دریافت عکس در آیدی غیرفعال بود !', 1, 'md')
  end
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '> *id photo bot has been disable*️', 1, 'md')
else
  send(msg.chat_id_, msg.id_, 1, 'دریافت عکس در آیدی غیرفعال شد !', 1, 'md')
database:set('bot:id:photo'..msg.chat_id_,true)
  end
end
end

if (text and text == 'bc on') and tonumber(msg.sender_user_id_) == tonumber(sudo_add) or (text and text == 'Enable Bc') and tonumber(msg.sender_user_id_) == tonumber(sudo_add) or (text and text == 'برادکست فعال') and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
if not database:get('bot:bc:groups') then
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '> *bc bot is already enabled*️', 1, 'md')
  else
  send(msg.chat_id_, msg.id_, 1, 'برادکست فعال بود !', 1, 'md')
  end
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '> *bc bot has been enable*️', 1, 'md')
else
  send(msg.chat_id_, msg.id_, 1, 'برادکست فعال شد !', 1, 'md')
   database:del('bot:bc:groups')
  end
end
end
if (text and text == 'bc off') and tonumber(msg.sender_user_id_) == tonumber(sudo_add) or (text and text == 'Disable Bc') and tonumber(msg.sender_user_id_) == tonumber(sudo_add) or (text and text == 'برادکست فعال') and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
if database:get('bot:bc:groups') then
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '> *bc bot is already disabled*️', 1, 'md')
else
  send(msg.chat_id_, msg.id_, 1, 'برادکست غیرفعال بود !', 1, 'md')
  end
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '> *bc bot has been disable*️', 1, 'md')
else
  send(msg.chat_id_, msg.id_, 1, 'برادکست غیرفعال شد !', 1, 'md')
database:set('bot:bc:groups',true)
  end
end
end
if (text and text == 'autoleave on') and tonumber(msg.sender_user_id_) == tonumber(sudo_add) or (text and text == 'Enable Leave') and tonumber(msg.sender_user_id_) == tonumber(sudo_add) or (text and text == 'برادکست غیرفعال') and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
if not database:get('bot:leave:groups') then
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '> Autoleave is already enabled', 1, 'md')
  else
  send(msg.chat_id_, msg.id_, 1, 'خروج خودکار روشن بود !', 1, 'md')
  end
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '> Autoleave has been enabled', 1, 'md')
else
  send(msg.chat_id_, msg.id_, 1, 'خروج خودکار روشن شد !', 1, 'md')
   database:del('bot:leave:groups'..msg.chat_id_)
  end
end
end
if (text and text == 'autoleave off') and tonumber(msg.sender_user_id_) == tonumber(sudo_add) or (text and text == 'Disable Leave') and tonumber(msg.sender_user_id_) == tonumber(sudo_add) or (text and text == 'تعطيل المغادره') and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
if database:get('bot:leave:groups') then
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '> *Auto leave  is already disabled*️', 1, 'md')
else
  send(msg.chat_id_, msg.id_, 1, 'خروج خودکار خاموش بود !', 1, 'md')
  end
else
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '> Autoleave has been disabled', 1, 'md')
else
  send(msg.chat_id_, msg.id_, 1, 'خروج خودکار خاموش شد !', 1, 'md')
database:set('bot:leave:groups'..msg.chat_id_,true)
  end
end
end
	-----------------------------------------------------------------------------------------------
if (text and text == 'enable reply sudo') and is_owner(msg.sender_user_id_, msg.chat_id_)  or (text and text == 'Enable Reply sudo') and is_owner(msg.sender_user_id_, msg.chat_id_) or (text and text == 'ریپلی سودو فعال') and is_owner(msg.sender_user_id_, msg.chat_id_) then
  if not database:get('bot:repsudo:mute'..msg.chat_id_) then
  if database:get('bot:lang:'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '> *Replies sudo is already enabled*️', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, 'ریپلی سودو فعال بود !', 1, 'md')
end
  else
  if database:get('bot:lang:'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '> *Replies sudo has been enable*️', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, 'ریپلی سودو فعال شد !', 1, 'md')
 database:del('bot:repsudo:mute'..msg.chat_id_)
end
end
end
if (text and text == 'disable reply sudo') and is_owner(msg.sender_user_id_, msg.chat_id_)  or (text and text == 'Disable Reply sudo') and is_owner(msg.sender_user_id_, msg.chat_id_) or (text and text == 'ریپلی سودو غیرفعال') and is_owner(msg.sender_user_id_, msg.chat_id_) then
  if database:get('bot:repsudo:mute'..msg.chat_id_) then
  if database:get('bot:lang:'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '> *Replies sudo is already disabled*️', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, 'ریپلی سودو غیرفعال بود !', 1, 'md')
end
else
  if database:get('bot:lang:'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '> *Replies sudo has been disable*️', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, 'ریپلی سودو غیرفعال شد !', 1, 'md')
  database:set('bot:repsudo:mute'..msg.chat_id_,true)
end
end
  end
if (text and text == 'enable reply owner') and is_owner(msg.sender_user_id_, msg.chat_id_)  or (text and text == 'Enable Reply owner') and is_owner(msg.sender_user_id_, msg.chat_id_) or (text and text == 'ریپلی مالک فعال') and is_owner(msg.sender_user_id_, msg.chat_id_) then
  if not database:get('bot:repowner:mute'..msg.chat_id_) then
  if database:get('bot:lang:'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '> *Replies owner is already enabled*️', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, 'ریپلی مالکان فعال بود !', 1, 'md')
end
  else
  if database:get('bot:lang:'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '> *Replies owner has been enable*️', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, 'ریپلی مالکان فعال شد !', 1, 'md')
 database:del('bot:repowner:mute'..msg.chat_id_)
end
end
end
if (text and text == 'disable reply owner') and is_owner(msg.sender_user_id_, msg.chat_id_)  or (text and text == 'Disable Reply owner') and is_owner(msg.sender_user_id_, msg.chat_id_) or (text and text == 'ریپلی مالک غیرفعال') and is_owner(msg.sender_user_id_, msg.chat_id_) then
  if database:get('bot:repowner:mute'..msg.chat_id_) then
  if database:get('bot:lang:'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '> *Replies owner is already disabled*️', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, 'ریپلی مالکان غیرفعال بود !', 1, 'md')
end
else
  if database:get('bot:lang:'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '> *Replies owner has been disable*️', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, 'ریپلی مالکان غیرفعال شد !', 1, 'md')
  database:set('bot:repowner:mute'..msg.chat_id_,true)
end
end
  end
	-----------------------------------------------------------------------------------------------
   if text:match("^[Ii][Dd][Gg][Pp]$") or text:match("^ایدی گروه$") then
send(msg.chat_id_, msg.id_, 1, "*"..msg.chat_id_.."*", 1, 'md')
  end
	-----------------------------------------------------------------------------------------------
if (text and text == 'id on') and is_owner(msg.sender_user_id_, msg.chat_id_)  or (text and text == 'Enable Id') and is_owner(msg.sender_user_id_, msg.chat_id_) or (text and text == 'ایدی فعال') and is_owner(msg.sender_user_id_, msg.chat_id_) then
  if not database:get('bot:id:mute'..msg.chat_id_) then
  if database:get('bot:lang:'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '> *ID is already enabled*️', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '☑┇فعال بود !', 1, 'md')
end
  else
  if database:get('bot:lang:'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '> *ID has been enable*️', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '☑┇فعال شد !', 1, 'md')
 database:del('bot:id:mute'..msg.chat_id_)
end
end
end
if (text and text == 'id off') and is_owner(msg.sender_user_id_, msg.chat_id_)  or (text and text == 'Disable Id') and is_owner(msg.sender_user_id_, msg.chat_id_) or (text and text == 'ایدی غیرفعال') and is_owner(msg.sender_user_id_, msg.chat_id_) then
  if database:get('bot:id:mute'..msg.chat_id_) then
  if database:get('bot:lang:'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '> *ID is already disabled*️', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, 'قابلیت دریافت مشخصات غیرفعال بود !', 1, 'md')
end
else
  if database:get('bot:lang:'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '> *ID has been disable*️', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, 'قابلیت دریافت مشخصات غیرفعال شد !', 1, 'md')
  database:set('bot:id:mute'..msg.chat_id_,true)
end
end
  end
	-----------------------------------------------------------------------------------------------
if  text:match("^[Ii][Dd]$") and msg.reply_to_message_id_ == 0 or text:match("^ایدی$") and msg.reply_to_message_id_ == 0 then
local SASI_info = nil
 function SASI333(extra,result,success)
  SASI_info = '@'..(result.username_ or 'موجود نیست !')..''
local function getpro(extra, result, success)
local user_msgs = database:get('user:msgs'..msg.chat_id_..':'..msg.sender_user_id_)
   if result.photos_[0] then
if is_sudo(msg) then
if database:get('bot:lang:'..msg.chat_id_) then
t = 'Sudo'
else
t = 'سودو'
end
elseif is_creator(msg.sender_user_id_, msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
t = 'Group creator'
else
t = 'سازنده گروه'
end
elseif is_owner(msg.sender_user_id_, msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
t = 'Group Owner'
else
t = 'مالک گروه'
end
elseif is_mod(msg.sender_user_id_, msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
t = 'Group Moderator'
else
t = 'ادمین گروه'
end
elseif is_vip(msg.sender_user_id_, msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
t = 'Group Moderator'
else
t = 'ویژه'
end
else
if database:get('bot:lang:'..msg.chat_id_) then
t = 'Group Member'
else
t = 'عضو معمولی'
end
end

if not database:get('bot:id:mute'..msg.chat_id_) then
  if not database:get('bot:id:photo'..msg.chat_id_) then
   if database:get('bot:lang:'..msg.chat_id_) then
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, result.photos_[0].sizes_[1].photo_.persistent_id_,"> Group ID : "..msg.chat_id_.."\n> Your ID : "..msg.sender_user_id_.."\n> UserName : "..SASI_info.."\n> Your Rank : "..t.."\n> Msgs : "..user_msgs,msg.id_,msg.id_.."")
else
  sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, result.photos_[0].sizes_[1].photo_.persistent_id_,"📝 یوزنیم : ("..msg.sender_user_id_..")\n🗂 شناسه : "..SASI_info.."\n🏅 سطح شما : "..t.."\n📩 سطح پیام های دریافتی : {"..user_msgs.."}",msg.id_,msg.id_.."")
   end
   else
if is_sudo(msg) then
if database:get('bot:lang:'..msg.chat_id_) then
t = 'Sudo'
else
t = 'سودو'
end
elseif is_creator(msg.sender_user_id_, msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
t = 'Group creator'
else
t = 'سازنده گروه '
end
elseif is_owner(msg.sender_user_id_, msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
t = 'Group Owner'
else
t = 'مالک گروه'
end
elseif is_mod(msg.sender_user_id_, msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
t = 'Group Moderator'
else
t = 'ادمین گروه'
end
elseif is_vip(msg.sender_user_id_, msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
t = 'Group Moderator'
else
t = 'ویژه'
end
else
if database:get('bot:lang:'..msg.chat_id_) then
t = 'Group Member'
else
t = 'عضو معمولی'
end
end
   if database:get('bot:lang:'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "<b>> Group ID :</b> "..msg.chat_id_.."\n<b>> Your ID :</b> "..msg.sender_user_id_.."\n<b>> UserName :</b> "..SASI_info.."\n<b>> Your Rank :</b> "..t.."\n<b>> Msgs : </b><code>"..user_msgs.."</code>", 1, 'html')
   else
send(msg.chat_id_, msg.id_, 1, "📝 یوزنیم : ("..msg.sender_user_id_..")\n🗂 شناسه : "..SASI_info.."\n🏅 سطح شما : "..t.."\n📩 سطح پیام های دریافتی : {"..user_msgs.."}", 1, 'html')
end
end
else
if database:get('bot:lang:'..msg.chat_id_) then
	send(msg.chat_id_, msg.id_, 1, '_ID_ *Disable!*', 1, 'md')
	else
   send(msg.chat_id_, msg.id_, 1, '✅┇غیرفعال است !',1, 'md')
end
end
   else
if is_sudo(msg) then
if database:get('bot:lang:'..msg.chat_id_) then
t = 'Sudo'
else
t = 'سودو'
end
elseif is_creator(msg.sender_user_id_, msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
t = 'Group creator'
else
t = 'سازنده گروه'
end
elseif is_owner(msg.sender_user_id_, msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
t = 'Group Owner'
else
t = 'مالک گروه'
end
elseif is_mod(msg.sender_user_id_, msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
t = 'Group Moderator'
else
t = 'ادمین گروه'
end
elseif is_vip(msg.sender_user_id_, msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
t = 'Group Moderator'
else
t = 'ویژه'
end
else
if database:get('bot:lang:'..msg.chat_id_) then
t = 'Group Member'
else
t = 'عضو معمولی'
end
end
   if not database:get('bot:id:mute'..msg.chat_id_) then
   if not database:get('bot:id:photo'..msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "You Have'nt Profile Photo!!\n\n> <b>> Group ID :</b> "..msg.chat_id_.."\n<b>> Your ID :</b> "..msg.sender_user_id_.."\n<b>> UserName :</b> "..SASI_info.."\n<b>> Your Rank :</b> "..t.."\n<b>> Msgs : </b><code>"..user_msgs.."</code>", 1, 'html')
   else
send(msg.chat_id_, msg.id_, 1, "📝 یوزنیم : ("..msg.sender_user_id_..")\n🗂 شناسه : "..SASI_info.."\n🏅 سطح شما : "..t.."\n📩 سطح پیام های دریافتی : {"..user_msgs.."}", 1, 'html')
end
else
if is_sudo(msg) then
if database:get('bot:lang:'..msg.chat_id_) then
t = 'Sudo'
else
t = 'سودو'
end
elseif is_creator(msg.sender_user_id_, msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
t = 'Group creator'
else
t = 'سازنده گروه'
end
elseif is_owner(msg.sender_user_id_, msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
t = 'Group Owner'
else
t = 'مالک گروه'
end
elseif is_mod(msg.sender_user_id_, msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
t = 'Group Moderator'
else
t = 'ادمین گروه'
end
elseif is_vip(msg.sender_user_id_, msg.chat_id_) then
if database:get('bot:lang:'..msg.chat_id_) then
t = 'Group Moderator'
else
t = 'عضو ویژه'
end
else
if database:get('bot:lang:'..msg.chat_id_) then
t = 'Group Member'
else
t = 'عضو معمولی'
end
end
if database:get('bot:lang:'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "<b>> Group ID :</b> "..msg.chat_id_.."\n<b>> Your ID :</b> "..msg.sender_user_id_.."\n<b>> UserName :</b> "..SASI_info.."\n<b>> Your Rank :</b> "..t.."\n<b>> Msgs : </b><code>"..user_msgs.."</code>", 1, 'html')
   else
send(msg.chat_id_, msg.id_, 1, "📝 یوزنیم : ("..msg.sender_user_id_..")\n🗂 شناسه : "..SASI_info.."\n🏅 سطح شما : "..t.."\n📩 سطح پیام های دریافتی : {"..user_msgs.."}", 1, 'html')
end
end
else
if database:get('bot:lang:'..msg.chat_id_) then
	send(msg.chat_id_, msg.id_, 1, '_ID_ *Disable!*', 1, 'md')
	else
   send(msg.chat_id_, msg.id_, 1, 'این دستور غیرفعال میباشد !',1, 'md')
end
end
   end
   end
   tdcli_function ({
ID = "GetUserProfilePhotos",
user_id_ = msg.sender_user_id_,
offset_ = 0,
limit_ = 1
  }, getpro, nil)
end
getUser(msg.sender_user_id_, SASI333)
end


   if text:match('^محاسبه (%d+)$') then
  local id = text:match('^محاسبه (%d+)$')
  local text = 'حساب شد !'
tdcli_function ({ID="SendMessage", chat_id_=msg.chat_id_, reply_to_message_id_=msg.id_, disable_notification_=0, from_background_=1, reply_markup_=nil, input_message_content_={ID="InputMessageText", text_=text, disable_web_page_preview_=1, clear_draft_=0, entities_={[0] = {ID="MessageEntityMentionName", offset_=0, length_=19, user_id_=id}}}}, dl_cb, nil)
   end

   if text:match('^[Ww][Hh][Oo][Ii][Ss] (%d+)$') then
  local id = text:match('^[Ww][Hh][Oo][Ii][Ss] (%d+)$')
  local text = 'Click to view user!'
tdcli_function ({ID="SendMessage", chat_id_=msg.chat_id_, reply_to_message_id_=msg.id_, disable_notification_=0, from_background_=1, reply_markup_=nil, input_message_content_={ID="InputMessageText", text_=text, disable_web_page_preview_=1, clear_draft_=0, entities_={[0] = {ID="MessageEntityMentionName", offset_=0, length_=19, user_id_=id}}}}, dl_cb, nil)
   end
local text = msg.content_.text_:gsub('معلومات','res')
if text:match("^[Rr][Ee][Ss] (.*)$") then
local memb = {string.match(text, "^([Rr][Ee][Ss]) (.*)$")}
function whois(extra,result,success)
if result.username_ then
 result.username_ = '@'..result.username_
   else
 result.username_ = 'موجود نیست !'
   end
  if database:get('bot:lang:'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '> *Name* :'..result.first_name_..'\n> *Username* : '..result.username_..'\n> *ID* : '..msg.sender_user_id_, 1, 'md')
  else
send(msg.chat_id_, msg.id_, 1, '📜┇ یوزرنیم ~⪼ ('..result.username_..')\n🔘┇نام ~⪼ ('..result.first_name_..')', 1, 'md')
  end
end
getUser(memb[2],whois)
end
   -----------------------------------------------------------------------------------------------
if (text and text == 'pin on') and is_owner(msg.sender_user_id_, msg.chat_id_)  or (text and text == 'Enable Pin') and is_owner(msg.sender_user_id_, msg.chat_id_) or (text and text == 'سجاق فعال') and is_owner(msg.sender_user_id_, msg.chat_id_) then
   if not database:get('bot:pin:mute'..msg.chat_id_) then
   if database:get('bot:lang:'..msg.chat_id_) then
 send(msg.chat_id_, msg.id_, 1, '> *Pin is already enabled*️', 1, 'md')
 else
 send(msg.chat_id_, msg.id_, 1, 'قابلیت سنجاق پیام فعال بود !', 1, 'md')
 end
   else
   if database:get('bot:lang:'..msg.chat_id_) then
 send(msg.chat_id_, msg.id_, 1, '> *Pin has been enable*️', 1, 'md')
 else
 send(msg.chat_id_, msg.id_, 1, 'قابلیت سنجاق پیام فعال شد !', 1, 'md')
  database:del('bot:pin:mute'..msg.chat_id_)
 end
 end
 end
 if (text and text == 'pin off') and is_owner(msg.sender_user_id_, msg.chat_id_)  or (text and text == 'disable Pin') and is_owner(msg.sender_user_id_, msg.chat_id_) or (text and text == 'سنجاق غیرفعال') and is_owner(msg.sender_user_id_, msg.chat_id_) then
   if database:get('bot:pin:mute'..msg.chat_id_) then
   if database:get('bot:lang:'..msg.chat_id_) then
 send(msg.chat_id_, msg.id_, 1, '> *Pin is already disabled*️', 1, 'md')
 else
 send(msg.chat_id_, msg.id_, 1, 'قابلیت سنجاق کردن پیام غیرفعال بود !', 1, 'md')
 end
 else
   if database:get('bot:lang:'..msg.chat_id_) then
 send(msg.chat_id_, msg.id_, 1, '> *Pin has been disable*️', 1, 'md')
 else
 send(msg.chat_id_, msg.id_, 1, 'قابلیت سنجاق کردن پیام غیرفعال شد !', 1, 'md')
   database:set('bot:pin:mute'..msg.chat_id_,true)
 end
 end
   end

   if text:match("^[Pp][Ii][Nn]$") and is_mod(msg.sender_user_id_, msg.chat_id_) and not is_owner(msg.sender_user_id_, msg.chat_id_) or text:match("^سنجاق$") and is_mod(msg.sender_user_id_, msg.chat_id_) and not is_owner(msg.sender_user_id_, msg.chat_id_) then
  local id = msg.id_
  local msgs = {[0] = id}
   if not database:get('bot:pin:mute'..msg.chat_id_) then
 pin(msg.chat_id_,msg.reply_to_message_id_,0)
	   database:set('pinnedmsg'..msg.chat_id_,msg.reply_to_message_id_)
if database:get('bot:lang:'..msg.chat_id_) then
	send(msg.chat_id_, msg.id_, 1, '_Msg han been_ *pinned!*', 1, 'md')
	else
   send(msg.chat_id_, msg.id_, 1, 'پست شما پین شد !',1, 'md')
end
else
if database:get('bot:lang:'..msg.chat_id_) then
	send(msg.chat_id_, msg.id_, 1, '_Pin msg_ *Disable!*', 1, 'md')
	else
   send(msg.chat_id_, msg.id_, 1, 'این ویژگی غیرفعال شده است !',1, 'md')
end
end
end

   if text:match("^[Uu][Nn][Pp][Ii][Nn]$") and is_mod(msg.sender_user_id_, msg.chat_id_) and not is_owner(msg.sender_user_id_, msg.chat_id_) or text:match("^حذف سنجاق$") and is_mod(msg.sender_user_id_, msg.chat_id_) and not is_owner(msg.sender_user_id_, msg.chat_id_) or text:match("^الغاء التثبيت") and is_mod(msg.sender_user_id_, msg.chat_id_) and not is_owner(msg.sender_user_id_, msg.chat_id_) then
   if not database:get('bot:pin:mute'..msg.chat_id_) then
   unpinmsg(msg.chat_id_)
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_Pinned Msg han been_ *unpinned!*', 1, 'md')
 else
   send(msg.chat_id_, msg.id_, 1, 'پست پین شده حذف شد !', 1, 'md')
end
else
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_UNPin msg_ *Disable!*', 1, 'md')
 else
   send(msg.chat_id_, msg.id_, 1, 'این ویژگی غیرفعال شده است !', 1, 'md')
end
end
   end

   if text:match("^[Pp][Ii][Nn]$") and is_owner(msg.sender_user_id_, msg.chat_id_) or text:match("^سنجاق$") and is_owner(msg.sender_user_id_, msg.chat_id_) then
  local id = msg.id_
  local msgs = {[0] = id}
 pin(msg.chat_id_,msg.reply_to_message_id_,0)
	   database:set('pinnedmsg'..msg.chat_id_,msg.reply_to_message_id_)
if database:get('bot:lang:'..msg.chat_id_) then
	send(msg.chat_id_, msg.id_, 1, '_Msg han been_ *pinned!*', 1, 'md')
	else
   send(msg.chat_id_, msg.id_, 1, 'پست پین شد !',1, 'md')
end
end

   if text:match("^[Uu][Nn][Pp][Ii][Nn]$") and is_owner(msg.sender_user_id_, msg.chat_id_) or text:match("^حذف پین$") and is_owner(msg.sender_user_id_, msg.chat_id_) or text:match("^حذف سنجاق") and is_owner(msg.sender_user_id_, msg.chat_id_) then
   unpinmsg(msg.chat_id_)
if database:get('bot:lang:'..msg.chat_id_) then
   send(msg.chat_id_, msg.id_, 1, '_Pinned Msg han been_ *unpinned!*', 1, 'md')
 else
   send(msg.chat_id_, msg.id_, 1, 'پست پین شده حذف شد !', 1, 'md')
end
   end

   if text:match("^[Vv][Ii][Ee][Ww]$") or text:match("^بازدید$") then
  database:set('bot:viewget'..msg.sender_user_id_,true)
if database:get('bot:lang:'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '*Please send a post now!*', 1, 'md')
else
  send(msg.chat_id_, msg.id_, 1, '📥┇لطفا پست خود را ارسال کنید ! ',1, 'md')
end
   end
  end
  ----------------------------------------------------------------------------------------------
   -----------------------------------------------------------------------------------------------
   if text:match("^[Hh][Ee][Ll][Pp]$") or text:match("^راهنما$") and is_mod(msg.sender_user_id_, msg.chat_id_) then

   local text =  [[
• Bot | ربات : ]] ..botnamefa.. [[

╌╌╌╌╌╌╌╌╌╌
※ English guide menu 🇺🇸
ᗚ Get the Setup Menu :
`Help1` 
ᗚGet Cleanup Menu :
`Help2`
ᗚGet the lock menu :
`help3`
ᗚGet the Sudo menu :
`Help4`

💬 Sudo Guide is only applicable to the main robot managers 🈯️
💭To receive each menu, please send the command after the description -Like Help 1 ✅
╌╌╌╌╌╌╌╌╌╌
※ منوی راهنمای فارسی 🇮🇷
↫ برای دریافت راهنمای مدیریتی :
`راهنمای تنظیمی` 
↫ برای دریافت راهنمای پاکسازی :
`راهنمای پاکسازی`
↫ برای دریافت راهنمای قفلی :
`راهنمای قفلی` 
↫ برای دریافت راهنمای سودو :
`راهنمای سودو` 

💬 راهنمای سودو تنها برای مدیران اصلی ربات قابل اجرا است✅
💭 برای دریافت هر منو لطفاً دستور بعد از توضیحات ارسال کنید - مثل راهنمای تنظیمی✅
╌╌╌╌╌╌╌╌╌╌
🇮🇷شما میتوانید از هر دو دستورات فارسی و انگلیسی استفاده کنید
🇺🇸You can use both English and Persian commands
╌╌╌╌╌╌╌╌╌╌
]]
send(msg.chat_id_, msg.id_, 1, text, 1, 'md')
   end
      -----------------------------------------------------------------------------------------------
   if text:match("^[Hh][Ee][Ll][Pp]1$") or text:match("^راهنمای تنظیمی$") and is_mod(msg.sender_user_id_, msg.chat_id_) then
   local text = [[
   🗂 به بخش راهنمای تنظیمی ربات خوش آمدید !
📌 این بخش صرفا جهت مدیران گروه میباشد !
⁉️ اعضای معمولی درصورت استفاده از آن هیچ پاسخی دریافت نخواهند کرد !

• برای دریافت تنظیمات مربوط به حالت اخطار  :
•• تنظیمات اخطار

• برای دریافت تنظیمات مربوط به حالت مسدود :
•• تنظیمات مسدود 

• برای دریافت تنظیمات معمولی : 
•• تنظیمات

• برای دادن مقام و عزل کسی از مدیریت :
•• ارتقا ادمین
•• عزل ادمین

• برای ویژه کردن کسی :
•• ویژه

• برای حذف ویژه کردن کسی :
••عزل ویژه

• برای مسدود کردن کردن کاربر :
•• مسدود 

• برای اخراج فردی از گروه : 
•• اخراج

•   برای تغییر زبان خروجی گروه به فارسی و انگلیسی : 
•• زبان فارسی
•• زبان انگلیسی

• برای سایلنت کردن و حذف آن :
•• سایلنت 
•• حذف سایلنت

• برای سنجاق کردن متنی و حذف آن :
•• سنجاق
•• حذف سنجاق

• برای ثبت قوانین :
•• تنظیم قوانین - نوشتن متن قوانین جلوی تنظیم قوانین

• برای ثبت لینک :
•• تنظیم لینک
   
   
   ]]
   send(msg.chat_id_, msg.id_, 1, text, 1, 'md')
   end
      if text:match("^[Hh][Ee][Ll][Pp]3$") or text:match("^راهنمای قفلی$") and is_mod(msg.sender_user_id_, msg.chat_id_) then
	  local text = [[
🗂 به بخش راهنمای قفلی ربات خوش آمدید !
📌 این بخش صرفا جهت مدیران گروه میباشد !
⁉️ اعضای معمولی درصورت استفاده از آن هیچ پاسخی دریافت نخواهند کرد !

• حالت معمولی :
قفل | بازکردن 

 لینک | تگ | هشتگ | وب |عکس | گیف | فیلم | سلفی | ربات | استیکر | فایل | دکمه شیشه ای | موقعیت مکانی | ویرایش | فارسی | انگلیسی 

• حالت مسدود :
بازکردن ... با اخراج
قفل ... با اخراج
 لینک | تگ | هشتگ | وب |عکس | گیف | فیلم | سلفی | ربات | استیکر | فایل | دکمه شیشه ای | موقعیت مکانی | ویرایش | فارسی | انگلیسی 

• حالت اخطار :
بازکردن ... با اخظار
قفل ... با مسدود 

 لینک | تگ | هشتگ | وب |عکس | گیف | فیلم | سلفی | ربات | استیکر | فایل | دکمه شیشه ای | موقعیت مکانی | ویرایش | فارسی | انگلیسی 
   
   ]]
   send(msg.chat_id_, msg.id_, 1, text, 1, 'md')
   end
   
     if text:match("^[Hh][Ee][Ll][Pp]2$") or text:match("^راهنمای پاکسازی$") and is_mod(msg.sender_user_id_, msg.chat_id_) then
	  local text = [[
🗂 به بخش راهنمای پاکسازی ربات خوش آمدید !
📌 این بخش صرفا جهت مدیران گروه میباشد !
⁉️ اعضای معمولی درصورت استفاده از آن هیچ پاسخی دریافت نخواهند کرد !

• پرای حذف 100 پیام اخیر :
•• پاکسازی 100

• برای پاکسازی ربات های موجود در گروه :
•• پاکسازی ربات 

• برای پاکسازی عضو های مسدود :
•• پاکسازی لیست سیاه

• برای حذف لیست ویژه :
•• پاکسازی لیست ویژه

• برای پاکسازی قوانین ثبت شده :
•• پاکسازی قوانین :

• برای پاکسازی لیست سکوت :
•• پاکسازی لیست سکوت 

•  برای پاکسازی لینک گروه :
•• پاکسازی لینک

• برای پاکسازی لیست کلمات فیلتر :
•• پاکسازی فیلتر 

• برای پاکسازی اکانت های متروکه :
•• پاکسازی متروکه
   
   ]]
   send(msg.chat_id_, msg.id_, 1, text, 1, 'md')
   end
    if text:match("^[Hh][Ee][Ll][Pp]4$") or text:match("^راهنمای سودو$") and is_mod(msg.sender_user_id_, msg.chat_id_) then
	  local text = [[
✪ به راهنما سودو ربات خوش اومدید !
✪ این بخش صرفا مخصوص سودو و سازنده ربات میباشد .!
┅─═════─┅
➲ bot stats
 ⇝ آمار سوپرگروه های ربات 
┅─═════─┅
➲ files 
⇝ فایل های ربات 
┅─═════─┅
➲ get file name.lua
⇝ دریافت فایل مورد نظر با اسم 
┅─═════─┅
➲ addfile
⇝ اضافه کردن فایل با ریپلی 
┅─═════─┅
➲ inline on or off 
⇝ روشن یا خاموش کردن پنل اینلاین
┅─═════─┅
➲ set inline link
⇝ ثبت تبلیغ اینلاین 
┅─═════─┅
➲ enable or disable add auto
⇝ فعال یا غیر فعال کردن اد خودکار 
┅─═════─┅
➲ leave 
⇝ لفت دادن ربات از گروه مورد نظر 
┅─═════─┅
➲ fwd 
⇝ فوروارد به گروه های ربات 
┅─═════─┅
➲ bc TEXT 
⇝ تکرار متن شما 
┅─═════─┅
➲ Numbers Group
⇝ دریافت تعداد گروه 
┅─═════─┅
➲ Links Groups
⇝ دریافت لینک های گروه 
┅─═════─┅
➲ Clean Creators
⇝ پاک کردن سازنده ها
┅─═════─┅
➲ setxpire 10
⇝ شارژ برای گروه 
┅─═════─┅
➲ Leave Groupid
⇝ ترک گروه با ایدی 
┅─═════─┅
➲ Plan 1 2 3 
⇝ شارژ گروه بر اساس پلن های ربات 
┅─═════─┅
➲ Reload
⇝ ریلود کردن فال های ربات 
┅─═════─┅
➲ update source
⇝ نصب آخرین نسخه به روی سرور شما
( از این دستور تا زمانی ک اعلام نشده استفاده نکنید ! )
┅─═════─┅
➲ inline on | off
➲ set inline text (text)
➲ set inline link (link)
⇝ تنظیمات مربوط به عضویت اختیاری
┅─═════─┅
➲ change ph
⇝ تغییر شماره سودو
┅─═════─
➲ banall | silentall
➲ unbanall | unsilentall 
⇝ محدود کردن 
┅─═════─
➲ add sudo :)

۞ سودوی عزیز  برای دریافت فایل ها و پلاگین های ربات در کانال 
t.me/SASIBotFiles
عضو شوید
   ]]
   send(msg.chat_id_, msg.id_, 1, text, 1, 'md')
   end
if text:match("^reload$") or text:match("^ریلود$") then
dofile('Main.lua')
io.popen("rm -rf ~/.telegram-cli/data/animation/*")
io.popen("rm -rf ~/.telegram-cli/data/audio/*")
io.popen("rm -rf ~/.telegram-cli/data/document/*")
io.popen("rm -rf ~/.telegram-cli/data/photo/*")
io.popen("rm -rf ~/.telegram-cli/data/sticker/*")
io.popen("rm -rf ~/.telegram-cli/data/temp/*")
io.popen("rm -rf ~/.telegram-cli/data/thumb/*")
io.popen("rm -rf ~/.telegram-cli/data/video/*")
io.popen("rm -rf ~/.telegram-cli/data/voice/*")
io.popen("rm -rf ~/.telegram-cli/data/profile_photo/*")
send(msg.chat_id_, msg.id_, 1, 'فایل های ربات از نو بازنگری گشت !', 1, 'md')
end

if text:match("^bot stats$") and is_sudo(msg) then
local gps = database:scard("bot:groups") or 0
  local users = database:scard("bot:userss") or 0
    local allmgs = database:get("bot:allmsgs") or 0

local text = [[
آمار ربات شما :

تعداد گروه ها  : ]]..gps.. [[

تعداد کاربران ]] ..users.. [[

تعداد پیام های دریافتی : ]] ..allmgs.. [[
]]
send(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end
if text:match("^source$") or text:match("^prime$") or text:match("^سورس$") or text:match("^about$") or text:match("^info$") or text:match("^درباره$")  then

local text =  [[
🌐┇<strong>SASAN PRIME</strong>
-- 🔋 Version : 3 Alpha Prime --
◀┇<a href="https://telegram.me/source_search"> Source News Channel </a>
🎩┇<a href="https://telegram.me/MrLTE"> Coder and developer </a>
┄┄┄┄┄┄┄┄┄┄┄┄
✅┇<a href="https://telegram.me/GOLD_TABCHI"> Our Glori TABCHI bot  </a>
┄┄┄┄┄┄┄┄┄┄┄┄
📮┇<strong>EXTRAlink_bot</strong>
😐┇<a href="https://telegram.me/ExtraLink_bot"> This is me :P </a>

]]
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
   end

if text:match("^del acc$") or text:match("^دیلیت اکانت$") then

   local text =  [[
🗑┇لینک دیلیت اکانت شما ! ⬇️
‼️┇ این لینک برای غیرفعال کردن حساب کاربری تلگرامی شما میباشد !
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
🌐┇<a href="https://telegram.org/deactivate">کلیک کنید </a>
]]
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
   end
   if text:match("^ping$") or text:match("^پینگ$") or text:match("^ربات$") or text:match("^انلاینی$") then
      local text =  [[
<a href="https://telegram.me/]]..channel1..[["> -- Extralink_bot is online -- </a>
]]
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
  -----------------------------------------------------------------------------------------------
 end
  -----------------------------------------------------------------------------------------------
 -- end code --
  -----------------------------------------------------------------------------------------------
  elseif (data.ID == "UpdateChat") then
chat = data.chat_
chats[chat.id_] = chat
  -----------------------------------------------------------------------------------------------
  elseif (data.ID == "UpdateMessageEdited") then
   local msg = data
  	function get_msg_contact(extra, result, success)
	local text = (result.content_.text_ or result.content_.caption_)
  if not is_mod(result.sender_user_id_, result.chat_id_) then
   check_filter_words(result, text)
   if text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or
text:match("[Tt].[Mm][Ee]") or text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or
text:match("[Tt][Ee][Ll][Ee][Ss][Cc][Oo].[Pp][Ee]") then
   if database:get('bot:links:mute'..result.chat_id_) then
local msgs = {[0] = data.message_id_}
 delete_msg(msg.chat_id_,msgs)
	end

   if text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or
text:match("[Tt].[Mm][Ee]") or text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or
text:match("[Tt][Ee][Ll][Ee][Ss][Cc][Oo].[Pp][Ee]") then
   if database:get('bot:links:warn'..result.chat_id_) then
local msgs = {[0] = data.message_id_}
 delete_msg(msg.chat_id_,msgs)
send(msg.chat_id_, 0, 1, "🚫┇ارسال لینک ممنوع میباشد !", 1, 'html')
	end
end
end

	if result.id_ and result.content_.text_ then
  if not is_mod(result.sender_user_id_, result.chat_id_) then
   check_filter_words(result, text)
   	if text:match("[Hh][Tt][Tt][Pp][Ss]://") or text:match("[Hh][Tt][Tt][Pp]://") or text:match(".[Ii][Rr]") or text:match(".[Cc][Oo][Mm]") or text:match(".[Oo][Rr][Gg]") or text:match(".[Ii][Nn][Ff][Oo]") or text:match("[Ww][Ww][Ww].") or text:match(".[Tt][Kk]") then
   if database:get('bot:webpage:mute'..result.chat_id_) then
local msgs = {[0] = data.message_id_}
 delete_msg(msg.chat_id_,msgs)
	end

   if database:get('bot:webpage:warn'..result.chat_id_) then
local msgs = {[0] = data.message_id_}
 delete_msg(msg.chat_id_,msgs)
send(msg.chat_id_, 0, 1, "🚫┇ارسال لینک سایت ممنوع میباشد !", 1, 'html')
	end
end
end
end
end
	if result.id_ and result.content_.text_ then
  if not is_mod(result.sender_user_id_, result.chat_id_) then
   check_filter_words(result, text)
   if text:match("@") then
   if database:get('bot:tag:mute'..result.chat_id_) then
local msgs = {[0] = data.message_id_}
 delete_msg(msg.chat_id_,msgs)
	end
	   if database:get('bot:tag:warn'..result.chat_id_) then
local msgs = {[0] = data.message_id_}
 delete_msg(msg.chat_id_,msgs)
send(msg.chat_id_, 0, 1,  "🚫┇تگ کردن ممنوع میباشد !", 1, 'html')

	end
end
end
	if result.id_ and result.content_.text_ then
  if not is_mod(result.sender_user_id_, result.chat_id_) then
   check_filter_words(result, text)
   	if text:match("#") then
   if database:get('bot:hashtag:mute'..result.chat_id_) then
local msgs = {[0] = data.message_id_}
 delete_msg(msg.chat_id_,msgs)
	end
	   if database:get('bot:hashtag:warn'..result.chat_id_) then
local msgs = {[0] = data.message_id_}
 delete_msg(msg.chat_id_,msgs)
send(msg.chat_id_, 0, 1, "🚫┇هشتگ کردن ممنوع میباشد !", 1, 'html')
	end
end
end
	if result.id_ and result.content_.text_ then
  if not is_mod(result.sender_user_id_, result.chat_id_) then
   check_filter_words(result, text)
   	if text:match("/")  then
   if database:get('bot:cmd:mute'..result.chat_id_) then
local msgs = {[0] = data.message_id_}
 delete_msg(msg.chat_id_,msgs)
	end
	   if database:get('bot:cmd:warn'..result.chat_id_) then
local msgs = {[0] = data.message_id_}
 delete_msg(msg.chat_id_,msgs)
send(msg.chat_id_, 0, 1, "🚫┇سواستفاده از دستورات ممنوع میباشد !", 1, 'html')
	end
end
end
end
	if result.id_ and result.content_.text_ then
  if not is_mod(result.sender_user_id_, result.chat_id_) then
   check_filter_words(result, text)
   	if text:match("[\216-\219][\128-\191]") then
   if database:get('bot:arabic:mute'..result.chat_id_) then
local msgs = {[0] = data.message_id_}
 delete_msg(msg.chat_id_,msgs)
	end
	end
	   if database:get('bot:arabic:warn'..result.chat_id_) then
local msgs = {[0] = data.message_id_}
 delete_msg(msg.chat_id_,msgs)
send(msg.chat_id_, 0, 1, "🚫┇حروف فارسی ممنوع میباشد !", 1, 'html')
	end
 end
end
end
	if result.id_ and result.content_.text_ then
  if not is_mod(result.sender_user_id_, result.chat_id_) then
   check_filter_words(result, text)
   if text:match("[ASDFGHJKLQWERTYUIOPZXCVBNMasdfghjklqwertyuiopzxcvbnm]") then
   if database:get('bot:english:mute'..result.chat_id_) then
local msgs = {[0] = data.message_id_}
 delete_msg(msg.chat_id_,msgs)
	end
	   if database:get('bot:english:warn'..result.chat_id_) then
local msgs = {[0] = data.message_id_}
 delete_msg(msg.chat_id_,msgs)
send(msg.chat_id_, 0, 1, "🚫┇حروف انگلیسی ممنوع میباشد !", 1, 'html')
end
end
end
end
	if result.id_ and result.content_.text_ then
  if not is_mod(result.sender_user_id_, result.chat_id_) then
   check_filter_words(result, text)
	if database:get('editmsg'..msg.chat_id_) == 'delmsg' then
  local id = msg.message_id_
  local msgs = {[0] = id}
  local chat = msg.chat_id_
  delete_msg(chat,msgs)
  send(msg.chat_id_, 0, 1, "🚫┇ویرایش ممنوع میباشد !", 1, 'html')
	end
end
end
end
	end
getMessage(msg.chat_id_, msg.message_id_,get_msg_contact)
  -----------------------------------------------------------------------------------------------
  elseif (data.ID == "UpdateOption" and data.name_ == "my_id") then
tdcli_function ({ID="GetChats", offset_order_="9223372036854775807", offset_chat_id_=0, limit_=20}, dl_cb, nil)
  end
  -----------------------------------------------------------------------------------------------
end

