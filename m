Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id E0nEAkX0CWqGvgQAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Sun, 17 May 2026 19:00:53 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F6D562596
	for <lists+greybus-dev@lfdr.de>; Sun, 17 May 2026 19:00:52 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 9BDE940144
	for <lists+greybus-dev@lfdr.de>; Sun, 17 May 2026 16:51:18 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	by lists.linaro.org (Postfix) with ESMTPS id 8CD8D3F78C
	for <greybus-dev@lists.linaro.org>; Fri, 15 May 2026 06:03:07 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=iBDpqz7f;
	arc=pass ("google.com:s=arc-20240605:i=1");
	spf=pass (lists.linaro.org: domain of grlicanikolai@gmail.com designates 209.85.128.42 as permitted sender) smtp.mailfrom=grlicanikolai@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48d102471a4so85611655e9.2
        for <greybus-dev@lists.linaro.org>; Thu, 14 May 2026 23:03:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778824986; cv=none;
        d=google.com; s=arc-20240605;
        b=PALixPkH2nwjI+iH+/qTKO0u8t4+PhvRA/jxZ+KGmPTT4y6qF1B+JMm0nqOgYN941K
         zKqLOhVII3kgrWXfMGhVm51lGS7v+gGuiAGcSry/k1BCrxq70Ax6gTlhyLly6jMQXerj
         MQC7686eD1XuRdwVjgsDdbcTKUQzvmxcSclGqxlYtwUVFiEiRT1K2ZWMNIIrtE4lJdk9
         54V3inHy2tKxgm0b30P8KoWBQsDQRjGE7fsOW29CvQA9RDwusF6dNyFQTiJ1uCZnbmer
         QkoAay2AIw+ZIcIVlnCkIDKIbC8VyB6ynh9sAzQ2mhm5X9RpCE6Mu/SQ8EWPI2B28/GL
         ekhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=Aaj3dPrgig/DfJjtFEpTVsiPTYzN5yfiO/NHuts+Ytk=;
        fh=NUm8+3ZDuYj5rA5nqqYRW0zdac0MfhG1y+w8cxcZLYk=;
        b=QBSnrhTCTLw8BoeNl83e/uDZLTducIkXEYW4G40/ryrhPk7HBy8PNeGGA/DiadlXiw
         fkQWdWWmdgbXuHASzM3Ke8M/h3dYdC0gsUPwqbRgd9w4/ipNn8JjdennNS2OexXv1DC9
         QMaRwVNGgDGWl6l6Vem531Dz/aORvyfvRLDfq6/QgShOmsfVV1LimgJ33FQfu5TACtH9
         wtwEAmScZkM9gUTx3n2nlZH2Ojr+aJB57TSoS/m22z5ZLyAtPhQnVFPs+jwAuTB47FRF
         yQAHfWllt2PJq2T+XApQOJyVNV7vLkdjrYrojhyaxW/ZP9eHHmQzq6IDDhf8s6sJo0ZQ
         DWYw==;
        darn=lists.linaro.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778824986; x=1779429786; darn=lists.linaro.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Aaj3dPrgig/DfJjtFEpTVsiPTYzN5yfiO/NHuts+Ytk=;
        b=iBDpqz7fEQSGJzvTJo8hzNE/gMW1ZQoAv/zORTAHF/qUZqrkqQAAlDo09G1oVfqY0j
         M3uaTxCJidohKOMiby8RPPVPEjBDi30eaa/uOJbRtPz0G2vtY8GUubnBgaeB8RAqjiwH
         JSGZ16zvOS8BuyJb19z0oPlsl+WmxjESLEejj1pFD2SCVyMi14AsLfKowADlmpC/o3qU
         UuWz/8VC6ow4k+7xHhqkUROzpczvfGUTOPHmPcV20V+zwvezCSMiCz9DpcWSnr+QL/Uh
         S1kPoCUdlpTOyfw8k+hYKBbff4PQKsj13sFsIqZwLdmIAAhZmWKH7OLhZzugVAV7Xchj
         /n8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778824986; x=1779429786;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Aaj3dPrgig/DfJjtFEpTVsiPTYzN5yfiO/NHuts+Ytk=;
        b=c42rt+ON38c5d6IrlJvIOObt8S7VymqtiAqhKFMl/hs5r1pHznk6icmDNc6yB7zNbi
         xLTnTk+zPQybiW38FvQXMYUTiw67iJNlPioRXbJi3b4di66kCepRZqk4vrB9Oa/6l8nT
         X9Tump1e7J8KID0VXmlzlXnxDripZ27DSpxnFbibpABAC3YI91QT1vqTzaKnJ7pp6VAq
         rEPI7IFx7B40cG3PkF/YM+qWwI8J0mGmwKM6Yqj66doP2wKqkFgJqv4iN5yap8Dai4pw
         U0thMNG3FKZLFobQbShLAiKFIYA+awIXbyGqJxR23SB2do99U1y5EBaa1YvodonvUagJ
         sUNw==
X-Forwarded-Encrypted: i=1; AFNElJ/pfCSiQ5U+xEkDehsk1N4OE+KjJI2DJBmIuS/eWgKMKZ2sdg8iKgRNCObtEEFfcJDUtD5UCkuRpU5FlQ==@lists.linaro.org
X-Gm-Message-State: AOJu0Yw7eisF1hktl+bf2OYH0X6zCHGbzO/staW6jgswPrXgfYFThdBH
	2YWw6VmF/zZ967g0yKebJVp8K5ZAuoJzvzJsI3Zet/OuHbAXsxUowbFw9+P6jXs3ApOJtFkZxo4
	upEGFaMNgCnbizTVIq/+lHkWmWSVEHmM=
X-Gm-Gg: Acq92OHuI4NKG+fLjQVaubeUvoYs2TmAH5PLRjHo41nW5/limlxPivKJYpbxTk+52U8
	/xMym70liDrjshIVGb6n8Kcdv0lID8RHvd662DfzZ4zbONXvFq57SEd2orLNFiasDcd9yUPqLkR
	X7JbrGpj7O0c3jlsus8l9KRACnrIcmzn6beBihQGGB5l5mIxCZjJL1Rmcb8H5oxM03AtSee3E5h
	n5Pc0FN/z85TYfGFfFzXDMLdBWFYvsg7qolMcfWF1Hrfl95PWKm/phE1Hx1vpHq5XcmSBdfmMVa
	PpUOmHM9w8TS5wmQAgA/ZpGkbWiscZva0wvkPKb7hXBiGQdHNQ11rkWExFXeABvUtyhJqcHWRJn
	eGHHBBgf2foaoxKt3ffvEgas5QCIJbwMhVn1fYXRYhQjGSSDGiTjBic4aVvz6eAOBQVc=
X-Received: by 2002:a05:600c:4685:b0:48e:5d91:cfe3 with SMTP id
 5b1f17b1804b1-48fe5fd494dmr31304385e9.1.1778824986093; Thu, 14 May 2026
 23:03:06 -0700 (PDT)
MIME-Version: 1.0
From: Nikolai Grlica <grlicanikolai@gmail.com>
Date: Fri, 15 May 2026 10:02:26 +0200
X-Gm-Features: AVHnY4JHE0g8qHERYKAOhG9RJyALpijvctwVsgQdcLRK0DE68UR71NfvhVr0sgo
Message-ID: <CAKSDPXASdY+EP8r8YLJ6YcQYKTKsVrVEAK-BJOt-=UXMXk=DQQ@mail.gmail.com>
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>, Mark Greer <mgreer@animalcreek.com>
X-Spamd-Bar: -----
X-MailFrom: grlicanikolai@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 2WECZJMG52MW4XMLA35AZ5UWL5O5P2SL
X-Message-ID-Hash: 2WECZJMG52MW4XMLA35AZ5UWL5O5P2SL
X-Mailman-Approved-At: Sun, 17 May 2026 16:51:14 +0000
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: audio: add missing newlines to sysfs attributes
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/2WECZJMG52MW4XMLA35AZ5UWL5O5P2SL/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: multipart/mixed; boundary="===============4940746227475115487=="
X-Rspamd-Queue-Id: 76F6D562596
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.09 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	DATE_IN_PAST(1.00)[56];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[multipart/mixed,multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,animalcreek.com];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~,4:+];
	GREYLIST(0.00)[pass,body];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[grlicanikolai@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_RCPT(0.00)[greybus-dev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_SPAM(0.00)[0.999];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,mail.gmail.com:mid,lists.linaro.org:helo,lists.linaro.org:rdns,desc.name:url]
X-Rspamd-Action: no action

--===============4940746227475115487==
Content-Type: multipart/alternative; boundary="00000000000069ef750651d4f765"

--00000000000069ef750651d4f765
Content-Type: text/plain; charset="UTF-8"

Sysfs attribute output should be newline-terminated.

Add missing newlines to the Greybus audio manager module attribute show
functions.

Signed-off-by: Nikolai Grlica <grlicanikolai@gmail.com>
---
 drivers/staging/greybus/audio_manager_module.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/greybus/audio_manager_module.c
b/drivers/staging/greybus/audio_manager_module.c
index dc90cc2d2308..5737f2a32f5a 100644
--- a/drivers/staging/greybus/audio_manager_module.c
+++ b/drivers/staging/greybus/audio_manager_module.c
@@ -75,7 +75,7 @@ static void gb_audio_module_release(struct kobject *kobj)
 static ssize_t gb_audio_module_name_show(struct gb_audio_manager_module
*module,
  struct gb_audio_manager_module_attribute *attr, char *buf)
 {
- return sysfs_emit(buf, "%s", module->desc.name);
+ return sysfs_emit(buf, "%s\n", module->desc.name);
 }

 static struct gb_audio_manager_module_attribute
gb_audio_module_name_attribute =
@@ -84,7 +84,7 @@ static struct gb_audio_manager_module_attribute
gb_audio_module_name_attribute =
 static ssize_t gb_audio_module_vid_show(struct gb_audio_manager_module
*module,
  struct gb_audio_manager_module_attribute *attr, char *buf)
 {
- return sysfs_emit(buf, "%d", module->desc.vid);
+ return sysfs_emit(buf, "%d\n", module->desc.vid);
 }

 static struct gb_audio_manager_module_attribute
gb_audio_module_vid_attribute =
@@ -93,7 +93,7 @@ static struct gb_audio_manager_module_attribute
gb_audio_module_vid_attribute =
 static ssize_t gb_audio_module_pid_show(struct gb_audio_manager_module
*module,
  struct gb_audio_manager_module_attribute *attr, char *buf)
 {
- return sysfs_emit(buf, "%d", module->desc.pid);
+ return sysfs_emit(buf, "%d\n", module->desc.pid);
 }

 static struct gb_audio_manager_module_attribute
gb_audio_module_pid_attribute =
@@ -103,7 +103,7 @@ static ssize_t gb_audio_module_intf_id_show(struct
gb_audio_manager_module *modu
     struct gb_audio_manager_module_attribute *attr,
     char *buf)
 {
- return sysfs_emit(buf, "%d", module->desc.intf_id);
+ return sysfs_emit(buf, "%d\n", module->desc.intf_id);
 }

 static struct gb_audio_manager_module_attribute
@@ -114,7 +114,7 @@ static ssize_t gb_audio_module_ip_devices_show(struct
gb_audio_manager_module *m
        struct gb_audio_manager_module_attribute *attr,
        char *buf)
 {
- return sysfs_emit(buf, "0x%X", module->desc.ip_devices);
+ return sysfs_emit(buf, "0x%X\n", module->desc.ip_devices);
 }

 static struct gb_audio_manager_module_attribute
@@ -125,7 +125,7 @@ static ssize_t gb_audio_module_op_devices_show(struct
gb_audio_manager_module *m
        struct gb_audio_manager_module_attribute *attr,
        char *buf)
 {
- return sysfs_emit(buf, "0x%X", module->desc.op_devices);
+ return sysfs_emit(buf, "0x%X\n", module->desc.op_devices);
 }

 static struct gb_audio_manager_module_attribute

base-commit: 81f55766523e5293604cb96c5e98d10da345ff33
--
2.54.0

--00000000000069ef750651d4f765
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><font color=3D"#000000">Sysfs attribute output should be n=
ewline-terminated.<br><br>Add missing newlines to the Greybus audio manager=
 module attribute show<br>functions.<br><br>Signed-off-by: Nikolai Grlica &=
lt;<a href=3D"mailto:grlicanikolai@gmail.com">grlicanikolai@gmail.com</a>&g=
t;<br>---<br>=C2=A0drivers/staging/greybus/audio_manager_module.c | 12 ++++=
++------<br>=C2=A01 file changed, 6 insertions(+), 6 deletions(-)<br><br>di=
ff --git a/drivers/staging/greybus/audio_manager_module.c b/drivers/staging=
/greybus/audio_manager_module.c<br>index dc90cc2d2308..5737f2a32f5a 100644<=
br>--- a/drivers/staging/greybus/audio_manager_module.c<br>+++ b/drivers/st=
aging/greybus/audio_manager_module.c<br>@@ -75,7 +75,7 @@ static void gb_au=
dio_module_release(struct kobject *kobj)<br>=C2=A0static ssize_t gb_audio_m=
odule_name_show(struct gb_audio_manager_module *module,<br>=C2=A0 struct gb=
_audio_manager_module_attribute *attr, char *buf)<br>=C2=A0{<br>- return sy=
sfs_emit(buf, &quot;%s&quot;, module-&gt;<a href=3D"http://desc.name">desc.=
name</a>);<br>+ return sysfs_emit(buf, &quot;%s\n&quot;, module-&gt;<a href=
=3D"http://desc.name">desc.name</a>);<br>=C2=A0}<br>=C2=A0<br>=C2=A0static =
struct gb_audio_manager_module_attribute gb_audio_module_name_attribute =3D=
<br>@@ -84,7 +84,7 @@ static struct gb_audio_manager_module_attribute gb_au=
dio_module_name_attribute =3D<br>=C2=A0static ssize_t gb_audio_module_vid_s=
how(struct gb_audio_manager_module *module,<br>=C2=A0 struct gb_audio_manag=
er_module_attribute *attr, char *buf)<br>=C2=A0{<br>- return sysfs_emit(buf=
, &quot;%d&quot;, module-&gt;desc.vid);<br>+ return sysfs_emit(buf, &quot;%=
d\n&quot;, module-&gt;desc.vid);<br>=C2=A0}<br>=C2=A0<br>=C2=A0static struc=
t gb_audio_manager_module_attribute gb_audio_module_vid_attribute =3D<br>@@=
 -93,7 +93,7 @@ static struct gb_audio_manager_module_attribute gb_audio_mo=
dule_vid_attribute =3D<br>=C2=A0static ssize_t gb_audio_module_pid_show(str=
uct gb_audio_manager_module *module,<br>=C2=A0 struct gb_audio_manager_modu=
le_attribute *attr, char *buf)<br>=C2=A0{<br>- return sysfs_emit(buf, &quot=
;%d&quot;, module-&gt;desc.pid);<br>+ return sysfs_emit(buf, &quot;%d\n&quo=
t;, module-&gt;desc.pid);<br>=C2=A0}<br>=C2=A0<br>=C2=A0static struct gb_au=
dio_manager_module_attribute gb_audio_module_pid_attribute =3D<br>@@ -103,7=
 +103,7 @@ static ssize_t gb_audio_module_intf_id_show(struct gb_audio_mana=
ger_module *modu<br>=C2=A0 =C2=A0 =C2=A0struct gb_audio_manager_module_attr=
ibute *attr,<br>=C2=A0 =C2=A0 =C2=A0char *buf)<br>=C2=A0{<br>- return sysfs=
_emit(buf, &quot;%d&quot;, module-&gt;desc.intf_id);<br>+ return sysfs_emit=
(buf, &quot;%d\n&quot;, module-&gt;desc.intf_id);<br>=C2=A0}<br>=C2=A0<br>=
=C2=A0static struct gb_audio_manager_module_attribute<br>@@ -114,7 +114,7 @=
@ static ssize_t gb_audio_module_ip_devices_show(struct gb_audio_manager_mo=
dule *m<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct gb_audio_manager_module_attri=
bute *attr,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 char *buf)<br>=C2=A0{<br>- retur=
n sysfs_emit(buf, &quot;0x%X&quot;, module-&gt;desc.ip_devices);<br>+ retur=
n sysfs_emit(buf, &quot;0x%X\n&quot;, module-&gt;desc.ip_devices);<br>=C2=
=A0}<br>=C2=A0<br>=C2=A0static struct gb_audio_manager_module_attribute<br>=
@@ -125,7 +125,7 @@ static ssize_t gb_audio_module_op_devices_show(struct g=
b_audio_manager_module *m<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct gb_audio_ma=
nager_module_attribute *attr,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 char *buf)<br>=
=C2=A0{<br>- return sysfs_emit(buf, &quot;0x%X&quot;, module-&gt;desc.op_de=
vices);<br>+ return sysfs_emit(buf, &quot;0x%X\n&quot;, module-&gt;desc.op_=
devices);<br>=C2=A0}<br>=C2=A0<br>=C2=A0static struct gb_audio_manager_modu=
le_attribute<br><br>base-commit: 81f55766523e5293604cb96c5e98d10da345ff33<b=
r>--<br>2.54.0</font><br></div>

--00000000000069ef750651d4f765--

--===============4940746227475115487==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

--===============4940746227475115487==--
