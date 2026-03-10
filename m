Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YD2JKY2YsGkukgIAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Tue, 10 Mar 2026 23:17:49 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ECAA258D3F
	for <lists+greybus-dev@lfdr.de>; Tue, 10 Mar 2026 23:17:49 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8E515402B2
	for <lists+greybus-dev@lfdr.de>; Tue, 10 Mar 2026 22:17:48 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	by lists.linaro.org (Postfix) with ESMTPS id 421773FDB1
	for <greybus-dev@lists.linaro.org>; Tue, 10 Mar 2026 20:06:50 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=CEmz4m8q;
	spf=pass (lists.linaro.org: domain of sanjayembeddedse@gmail.com designates 209.85.210.175 as permitted sender) smtp.mailfrom=sanjayembeddedse@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-823c56765fdso6679895b3a.1
        for <greybus-dev@lists.linaro.org>; Tue, 10 Mar 2026 13:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773173209; x=1773778009; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=maRFdwFBItYsUxmd+9t8qBnRnOAkqFEhAXgbmQcZeFE=;
        b=CEmz4m8qftiL/D6PrT63U/rq6g1YBHH7VB/7djKfCzpNjsFfyBnWlRAR9zZYWhLu8a
         FCqR+5M5tTijZLQG16taVOBY8Z5vT9OLKvATVcoH/s2a5iE3M5hTHl2CTgZmqIRo2tNv
         uIOlqur0mt29sqBgGmXgnocU4RsmPhap7c6+vptihncsGby1GTuVQq/Reob9FayKf0xF
         JURP1g/k+gFSCcCaWWTDQJjaEV6i+1ctZTiIuplnWimgvBB0nvjelgIg+HuaGRpbxI9L
         j1nL5RlUzUse/a9WXTViLsSotmCfb/myDATh3wX1N/TwdaZzCPkrjIwP0KKWIcX0LyOI
         GEzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773173209; x=1773778009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=maRFdwFBItYsUxmd+9t8qBnRnOAkqFEhAXgbmQcZeFE=;
        b=Jm30gmXjQdxh/FY56rEChRsm9pFOzk4AU982SZfmme88t1gLohvLm2hpQlf6YoDRnu
         1pwZGu3G9JtfDL454VYinwbxfiKiTZGZ5I+cYc/b44P5voD8TcNROrrOi12b4w9w3AOj
         tOm29IUOGL8BG14Z/zqDcRlA38fXIikQiga9Ph3y3UyRyC4eGt7GWHssKlXCxbazhbtV
         t54qnq2I/PlHwrfhPnCEV45lebnbI6NZT5UlkRl7/V/AqRL0gCEj8HsXVjCoMliXkw7i
         s0I7nOW6J2WwXReJxuOk1i/LFnIacTj40+Vvba3KynQIz+sCYO3AL/xZzKSb8lCJCYlC
         z4UQ==
X-Forwarded-Encrypted: i=1; AJvYcCXz66oLc4RAfGJw1eig2i8ZjaH+V/YkYUpjtZKtp+bTNqYsyXEkQA6Mji4S1UI+rJxje94MKwy33e+Qlw==@lists.linaro.org
X-Gm-Message-State: AOJu0YyYyCz/j+laTJ9pt44nbeg0RtNjEhTS2O5yyWyXhSMcE+JztSzI
	5EAFtsPvTRjETyJmVXLeVjE2GZGQJbkDb6ycnAcsVX5lQ7RCis6qbX5S
X-Gm-Gg: ATEYQzxIeMJZzFGH3JMHTXKcdxTi+qiNAkKMz2yfuGwR41D1WrvYjKYxjoVDQhxg4KY
	+wYPIySy3xZnOV9PfDJatBU8dy+Jd3D9xKZ8f6EJ830V3HWIUF1e3cobWAms1x5JaeqsxhudXxv
	oQE+cdKgxCVi+Dno5hkZvo5ZAmxI/yvwxJ/JzqOHv6Nt+nmwtzmA1vkVZ5L2kRPE2M1Bz8xEzCv
	Wczs5U7gT95HpjrHo8vrV91nc3wZUaqVdMxSRsyxxepju0zI9XmKhmf/K5GAUELgBsjk6r4TKUi
	T0rILLnoYAg8n9uodSoyUFxznHtT79K1vm3+vQocugraFfaeOPqrrICaptVWulzRlJxuqfW5omM
	H40QjMaCPIAn2lb5wuWNZtb1CkI6SHQT+tpu+uYG8EIqE1dW8j4twrXt/rKzWXd+H3Dy4fRHwim
	H4tqFO7zWLx5tGMnMPi6otIzaEZr1sMCLxNTNySBNvvV6T7gL3
X-Received: by 2002:a05:6a00:ac0f:b0:829:7e6d:cf1f with SMTP id d2e1a72fcca58-829f721be36mr107593b3a.51.1773173209251;
        Tue, 10 Mar 2026 13:06:49 -0700 (PDT)
Received: from hu-ckantibh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6dc2d0asm101660b3a.13.2026.03.10.13.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 13:06:48 -0700 (PDT)
From: Sanjay Chitroda <sanjayembeddedse@gmail.com>
X-Google-Original-From: Sanjay Chitroda <sanjayembedded@gmail.com>
To: jic23@kernel.org,
	m.tretter@pengutronix.de,
	mchehab@kernel.org,
	p.zabel@pengutronix.de,
	tiffany.lin@mediatek.com,
	andrew-ct.chen@mediatek.com,
	yunfei.dong@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	pure.logic@nexus-software.ie
Date: Wed, 11 Mar 2026 01:35:13 +0530
Message-Id: <20260310200513.2162018-8-sanjayembedded@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260310200513.2162018-1-sanjayembedded@gmail.com>
References: <20260310200513.2162018-1-sanjayembedded@gmail.com>
MIME-Version: 1.0
X-Spamd-Bar: ---
X-MailFrom: sanjayembeddedse@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 3I2S5HAVVEVWRL3DUSIDHB74TLTMZIZ5
X-Message-ID-Hash: 3I2S5HAVVEVWRL3DUSIDHB74TLTMZIZ5
X-Mailman-Approved-At: Tue, 10 Mar 2026 22:17:16 +0000
CC: dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org, kernel@pengutronix.de, kees@kernel.org, nabijaczleweli@nabijaczleweli.xyz, marcelo.schmitt1@gmail.com, maudspierings@gocontroll.com, hverkuil+cisco@kernel.org, ribalda@chromium.org, straube.linux@gmail.com, dan.carpenter@linaro.org, lukagejak5@gmail.com, ethantidmore06@gmail.com, samasth.norway.ananda@oracle.com, karanja99erick@gmail.com, s9430939@naver.com, tglx@kernel.org, mingo@kernel.org, sun.jian.kdev@gmail.com, weibu@redadmin.org, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, sanjayembeddedse@gmail.com, skhan@linuxfoundation.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 7/7] staging: rtl8723bs: simplify cleanup using __free
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/3I2S5HAVVEVWRL3DUSIDHB74TLTMZIZ5/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 6ECAA258D3F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.09 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,pengutronix.de,mediatek.com,gmail.com,collabora.com,linuxfoundation.org,nexus-software.ie];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[43];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.282];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sanjayembeddedse@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FREEMAIL_CC(0.00)[baylibre.com,analog.com,kernel.org,pengutronix.de,nabijaczleweli.xyz,gmail.com,gocontroll.com,chromium.org,linaro.org,oracle.com,naver.com,redadmin.org,vger.kernel.org,lists.infradead.org,lists.linaro.org,lists.linux.dev,linuxfoundation.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev,cisco];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email]
X-Rspamd-Action: no action

From: Sanjay Chitroda <sanjayembeddedse@gmail.com>

Replace manual cleanup logic with __free attribute from cleanup.h. This
removes explicit kfree() calls and simplifies the error handling paths.

No functional change intended for kmalloc().

Signed-off-by: Sanjay Chitroda <sanjayembeddedse@gmail.com>
---
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 13 ++-----
 drivers/staging/rtl8723bs/hal/sdio_ops.c      | 37 ++++---------------
 2 files changed, 11 insertions(+), 39 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 8d259820f103..2badf7d1aec4 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -627,7 +627,6 @@ static void hal_ReadEFuse_WiFi(
 	u8 *pbuf
 )
 {
-	u8 *efuseTbl = NULL;
 	u16 eFuse_Addr = 0;
 	u8 offset, wden;
 	u8 efuseHeader, efuseExtHdr, efuseData;
@@ -640,7 +639,7 @@ static void hal_ReadEFuse_WiFi(
 	if ((_offset + _size_byte) > EFUSE_MAX_MAP_LEN)
 		return;
 
-	efuseTbl = kmalloc(EFUSE_MAX_MAP_LEN, GFP_ATOMIC);
+	u8 *efuseTbl __free(kfree) = kmalloc(EFUSE_MAX_MAP_LEN, GFP_ATOMIC);
 	if (!efuseTbl)
 		return;
 
@@ -702,8 +701,6 @@ static void hal_ReadEFuse_WiFi(
 
 	rtw_hal_set_hwreg(padapter, HW_VAR_EFUSE_BYTES, (u8 *)&used);
 	rtw_hal_set_hwreg(padapter, HW_VAR_EFUSE_USAGE, (u8 *)&efuse_usage);
-
-	kfree(efuseTbl);
 }
 
 static void hal_ReadEFuse_BT(
@@ -713,7 +710,6 @@ static void hal_ReadEFuse_BT(
 	u8 *pbuf
 )
 {
-	u8 *efuseTbl;
 	u8 bank;
 	u16 eFuse_Addr;
 	u8 efuseHeader, efuseExtHdr, efuseData;
@@ -728,7 +724,7 @@ static void hal_ReadEFuse_BT(
 	if ((_offset + _size_byte) > EFUSE_BT_MAP_LEN)
 		return;
 
-	efuseTbl = kmalloc(EFUSE_BT_MAP_LEN, GFP_ATOMIC);
+	u8 *efuseTbl __free(kfree) = kmalloc(EFUSE_BT_MAP_LEN, GFP_ATOMIC);
 	if (!efuseTbl)
 		return;
 
@@ -739,7 +735,7 @@ static void hal_ReadEFuse_BT(
 
 	for (bank = 1; bank < 3; bank++) { /*  8723b Max bake 0~2 */
 		if (hal_EfuseSwitchToBank(padapter, bank) == false)
-			goto exit;
+			return;
 
 		eFuse_Addr = 0;
 
@@ -804,9 +800,6 @@ static void hal_ReadEFuse_BT(
 
 	rtw_hal_set_hwreg(padapter, HW_VAR_EFUSE_BT_BYTES, (u8 *)&used);
 	rtw_hal_set_hwreg(padapter, HW_VAR_EFUSE_BT_USAGE, (u8 *)&efuse_usage);
-
-exit:
-	kfree(efuseTbl);
 }
 
 void Hal_ReadEFuse(
diff --git a/drivers/staging/rtl8723bs/hal/sdio_ops.c b/drivers/staging/rtl8723bs/hal/sdio_ops.c
index c9cb20c61a2b..303139a75551 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_ops.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_ops.c
@@ -179,9 +179,7 @@ static u32 sdio_read32(struct intf_hdl *intfhdl, u32 addr)
 	if (shift == 0) {
 		val = sd_read32(intfhdl, ftaddr, NULL);
 	} else {
-		u8 *tmpbuf;
-
-		tmpbuf = kmalloc(8, GFP_ATOMIC);
+		u8 *tmpbuf __free(kfree) = kmalloc(8, GFP_ATOMIC);
 		if (!tmpbuf)
 			return SDIO_ERR_VAL32;
 
@@ -189,8 +187,6 @@ static u32 sdio_read32(struct intf_hdl *intfhdl, u32 addr)
 		sd_read(intfhdl, ftaddr, 8, tmpbuf);
 		memcpy(&le_tmp, tmpbuf + shift, 4);
 		val = le32_to_cpu(le_tmp);
-
-		kfree(tmpbuf);
 	}
 	return val;
 }
@@ -223,19 +219,17 @@ static s32 sdio_readN(struct intf_hdl *intfhdl, u32 addr, u32 cnt, u8 *buf)
 	if (shift == 0) {
 		err = sd_read(intfhdl, ftaddr, cnt, buf);
 	} else {
-		u8 *tmpbuf;
 		u32 n;
 
 		ftaddr &= ~(u16)0x3;
 		n = cnt + shift;
-		tmpbuf = kmalloc(n, GFP_ATOMIC);
+		u8 *tmpbuf __free(kfree) = kmalloc(n, GFP_ATOMIC);
 		if (!tmpbuf)
 			return -ENOMEM;
 
 		err = sd_read(intfhdl, ftaddr, n, tmpbuf);
 		if (!err)
 			memcpy(buf, tmpbuf + shift, cnt);
-		kfree(tmpbuf);
 	}
 	return err;
 }
@@ -326,22 +320,18 @@ static s32 sdio_writeN(struct intf_hdl *intfhdl, u32 addr, u32 cnt, u8 *buf)
 	if (shift == 0) {
 		err = sd_write(intfhdl, ftaddr, cnt, buf);
 	} else {
-		u8 *tmpbuf;
 		u32 n;
 
 		ftaddr &= ~(u16)0x3;
 		n = cnt + shift;
-		tmpbuf = kmalloc(n, GFP_ATOMIC);
+		u8 *tmpbuf __free(kfree) = kmalloc(n, GFP_ATOMIC);
 		if (!tmpbuf)
 			return -ENOMEM;
 		err = sd_read(intfhdl, ftaddr, 4, tmpbuf);
-		if (err) {
-			kfree(tmpbuf);
+		if (err)
 			return err;
-		}
 		memcpy(tmpbuf + shift, buf, cnt);
 		err = sd_write(intfhdl, ftaddr, n, tmpbuf);
-		kfree(tmpbuf);
 	}
 	return err;
 }
@@ -491,7 +481,6 @@ static s32 _sdio_local_read(
 	struct intf_hdl *intfhdl;
 	u8 mac_pwr_ctrl_on;
 	s32 err;
-	u8 *tmpbuf;
 	u32 n;
 
 	intfhdl = &adapter->iopriv.intf;
@@ -503,7 +492,7 @@ static s32 _sdio_local_read(
 		return _sd_cmd52_read(intfhdl, addr, cnt, buf);
 
 	n = round_up(cnt, 4);
-	tmpbuf = kmalloc(n, GFP_ATOMIC);
+	u8 *tmpbuf __free(kfree) = kmalloc(n, GFP_ATOMIC);
 	if (!tmpbuf)
 		return -ENOMEM;
 
@@ -511,8 +500,6 @@ static s32 _sdio_local_read(
 	if (!err)
 		memcpy(buf, tmpbuf, cnt);
 
-	kfree(tmpbuf);
-
 	return err;
 }
 
@@ -529,7 +516,6 @@ s32 sdio_local_read(
 	struct intf_hdl *intfhdl;
 	u8 mac_pwr_ctrl_on;
 	s32 err;
-	u8 *tmpbuf;
 	u32 n;
 
 	intfhdl = &adapter->iopriv.intf;
@@ -544,7 +530,7 @@ s32 sdio_local_read(
 		return sd_cmd52_read(intfhdl, addr, cnt, buf);
 
 	n = round_up(cnt, 4);
-	tmpbuf = kmalloc(n, GFP_ATOMIC);
+	u8 *tmpbuf __free(kfree) = kmalloc(n, GFP_ATOMIC);
 	if (!tmpbuf)
 		return -ENOMEM;
 
@@ -552,8 +538,6 @@ s32 sdio_local_read(
 	if (!err)
 		memcpy(buf, tmpbuf, cnt);
 
-	kfree(tmpbuf);
-
 	return err;
 }
 
@@ -570,7 +554,6 @@ s32 sdio_local_write(
 	struct intf_hdl *intfhdl;
 	u8 mac_pwr_ctrl_on;
 	s32 err;
-	u8 *tmpbuf;
 
 	intfhdl = &adapter->iopriv.intf;
 
@@ -583,7 +566,7 @@ s32 sdio_local_write(
 	)
 		return sd_cmd52_write(intfhdl, addr, cnt, buf);
 
-	tmpbuf = kmalloc(cnt, GFP_ATOMIC);
+	u8 *tmpbuf __free(kfree) = kmalloc(cnt, GFP_ATOMIC);
 	if (!tmpbuf)
 		return -ENOMEM;
 
@@ -591,8 +574,6 @@ s32 sdio_local_write(
 
 	err = sd_write(intfhdl, addr, cnt, tmpbuf);
 
-	kfree(tmpbuf);
-
 	return err;
 }
 
@@ -880,16 +861,14 @@ void sd_int_dpc(struct adapter *adapter)
 	}
 
 	if (hal->sdio_hisr & SDIO_HISR_TXERR) {
-		u8 *status;
 		u32 addr;
 
-		status = kmalloc(4, GFP_ATOMIC);
+		u8 *status  __free(kfree) = kmalloc(4, GFP_ATOMIC);
 		if (status) {
 			addr = REG_TXDMA_STATUS;
 			hal_sdio_get_cmd_addr_8723b(adapter, WLAN_IOREG_DEVICE_ID, addr, &addr);
 			_sd_read(intfhdl, addr, 4, status);
 			_sd_write(intfhdl, addr, 4, status);
-			kfree(status);
 		}
 	}
 
-- 
2.34.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
