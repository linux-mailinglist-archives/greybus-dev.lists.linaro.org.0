Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ZawALZWVmWkKVQMAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Sat, 21 Feb 2026 12:23:01 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B2D16CC14
	for <lists+greybus-dev@lfdr.de>; Sat, 21 Feb 2026 12:23:01 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8EBA540302
	for <lists+greybus-dev@lfdr.de>; Sat, 21 Feb 2026 11:22:59 +0000 (UTC)
Received: from sonic308-44.consmr.mail.ir2.yahoo.com (sonic308-44.consmr.mail.ir2.yahoo.com [77.238.178.180])
	by lists.linaro.org (Postfix) with ESMTPS id A4020402E1
	for <greybus-dev@lists.linaro.org>; Sat, 21 Feb 2026 11:06:01 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=yahoo.pl header.s=s2048 header.b=CPveCsAK;
	spf=pass (lists.linaro.org: domain of tomasz.unger@yahoo.pl designates 77.238.178.180 as permitted sender) smtp.mailfrom=tomasz.unger@yahoo.pl;
	dmarc=pass (policy=reject) header.from=yahoo.pl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1771671960; bh=EsmR7eOA+/s42igq1qgKvvvbupv7+iotIZrcUsJayOc=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=CPveCsAK7SbsnFC4wQTgLmXQBLNdbmXNjVstflpnikMqmZlz9clBJUHcVNXqsScYc0MWuguKosG4CjS1WkyKtHrS1F11GYXq3s8VwceIwTTE+NhfZhhGFSYDgphzYhd4npTS2j3HbAwUOW0Hc3lMQ6ARccr0c/4upa4eYMcYBu/AkVJgBRoanr3dLFqxx7znc4OZ7/7draHdhaoaeFt4wRbBxlDO0+JGLQsCIcqBNaQMc81KWA9dkWqAhDz3ux57XoIJSstgaP/iXyPFGpZqbDtwgP0x1ChjxpbBmsZhGni7f035z4YGsCcKI5TtXJA08KbI/ZiY4iJmUHGO2c4V0Q==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1771671960; bh=3Mwo/iNEqYc+WKFGAVMnugo8FWNDk8J+XKiVAiJ725o=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=ZA7MysprwIsQsWtxlcWr9Dwva+QDvEVjvhyYauK8wraNu/WY8R9I1WNjZWp/E8LrZQ+XaehtlIdhx+8YYzDrYba/JkG2su94oEE88s+yq0wZtIFpEpf/zWAzIjXR+xSYiDI88mLQZslV/JRpUPr1EP1RAtkIlJuBhq0RB08/JcRMwlU4aiVXQ+4qoZlrykShUBa8VJIbdTzMVk8DpDJUNOMdaRIEnSCCFxP37LyKv3fttG1MbVohs4ymv9ZP807YSgzxVobNN7yGfCWB0mnqaPBX+oR714ED3j7kdFJSQdBpFqQKyVgzNBmoZtl6rNCSWeTzx1CkZS/ohGZF+bfEmQ==
X-YMail-OSG: vieHaLIVM1nexAXF0b2aLKqWLbxCFR.utzTw.MJ7XvF5RlWO6mliyYxusUtRkWZ
 slFBLGD2xoMCuKBmzR4tgf3wQpdEV8gPCembgxfEKR0rnjVIxIYxDuPKVWr4LzcDsWVxEQ3xs1mM
 pS2S730i4jPBr9zMc7If2Ytn_ec5S8vOV_6_3OaBCX1jsm98MaJsaItnVu5IvD7pHCS4b_iVtl.E
 jV8eAwgHuPPm7E.UdrSFKz22OTGBHMg6sFZ4.u5YyqXMeaw_REIoMvtGERMQfCbNMSR_w6bPZ6e2
 6HGTmO0NZZZ0Gt_vQOBnuSF3HyrdWXjQg4_ED.jcShgpI9i9rWufuJHRHXpUuN2g5AJ_3IZKsBl8
 GYUh8IIcX9BUcYIaRco7dkbmwD79IWADEQHzUn.o5uhNnds6BlFgsTwgQphlnzCDD1nkYMVf7zYI
 anramKFUEl6G0PwEr6KhyPyhP3bRvBHW9mA8Ipver8W8bNf3XV8j4A37a2NYRddEZM7f0oH4ew11
 FMIOiGqB_PNG_h.tzqLOimjC83_xq606acPYKoyCLrWTwbPOIikUZQKv_jcLyylTqfpzeM5PZto_
 .YQQ3xP4vGsK3Y8v4f0u2.aKvlUYgl7aPUwQR6cW7bY.bABZ34lx5i46Lx85b.gbjvp_Rqwe9cls
 xmJxgVWHHtHUBpeBDnG6prsR_Ahh75Wx.pH0dMvhk5r.T6jiziUnzZ_f.cnUQOV0JPNeB7UdVhhn
 efDOCLJAhOTDamVzLgNWMnzo6FzO1nTu1V3Tka25lpPkTT_9BouAaa05xjPKSQLe9ZZL93tshqEk
 tYBVfAIxKtpe0EyBVNR965THqTfuDyU_RJTwHWiGbynraVik1uujUyaWPtdZ.7RGPyio7JDednbu
 ENHUesbjPZUlmt.i1m28RmpOW9FZrju6s1dv341WAqfIX2Kuklc8YdcDJ7HCAa9Zc7KV8z6PELja
 2_FXxzMicAED5sjk2Yz7xi_kJYN6rBgqAyWce60UXjCKxSDOxAh4lnE4fqi6dhTGBGe_CVovZBK.
 3tRmu55_8WCAuNgNYvWaYkA6tfduofIBPw8dKHap5HT1qQJEMWI7jOYk.29SoIgDRoBT.SND3pI4
 RHBTbbCiUfBcLoyj7o4In21QWCahFwvNfk0QqoNrYXILsAsVT68TZFZMDQ1b7zYOx8uR1Jhkx88l
 5aRKmd0goPhYHQRTkuGEwJeew7JpDr.rQaFDrQLyLzbTPmTSe5.2M63fibeqwE5tgjQevpjmXNAJ
 rInQ9DJdEHuJN75zBzR5FRQd6AL08Vx9.GW4OiUv7oZwTFwSvHkwwIUV.QN01L4CWwpAZ.1LbiZi
 tU5QZGS83PBf5N_t6Zy5N4ufcB0hEP5yVD19r9I6hBBItQf2_9jvRsZ.EaXNTNvW93STiokufxa_
 AsE6ApnrySxO8hXObySNhoqRlZDd5Bt3iBnIEqw6W.5p.9eCQq0.xvXwbBZzjOHQ7K.DrgkcsD7Z
 R4I3Araf7efV3TYj2NBtje7eSQyyPV2boCAc2KBEdip_6CmVjMkisWdTroJiCergOAfgQ6zA4yk4
 8OjFypkk.NB11aJ3UR0gnwIwoEhP6PXaqDeswW6MLQc5fYhAD0ajD76qZuP6YZOMr6NLXU9jQh_V
 Uc8kFw3PqMo5nxiXJGdb_5EC6b_i2iF6s3hwGPBvsSpULHgmfffTwfZfacX75vUcyd6sp2HmQj_y
 CHVquTrjNJ84ljaccXP5GykIlDhvFxRuo3rVISnWaa1NU88VA.8XWEEon..DO5I6He4q1hl0gh5f
 IBC6npAiditTJtWTYN0edWCqwpLCD57BySce_bCSLCRss4mIam77x8Xb.YwvRRydE8M1CTTO1SIu
 U8ySO4JulnxBBVoiz4r0jKzlOOM.HYDx_KJKldQehrS4Sn.5G.8gSktKZD7i5Shccv7aEknWopNL
 mOgMMfdaEcki1TrfPl2uT4ZieMA1Qr7quXYV3emFiXV1Rv.QudtFzS69c8rik5EA_j8nxBn9uxcb
 b_eLZoGlmQmKK5yxStTSaO6Eik.CDxZWOTx.6b3GBnIVZGBo5YeUgqJ3MVXNTGz7aZdW.aVHcGCm
 UCymdTIATpEu4DD_LdaoRi8pkUpiTpIQ98zxu1.ZhV8SCx.bQpu.25JXujpiLYy45_XPJ8lTTIsK
 1wbO9XVL707VOp05.mTtCwV7dj881RUkgNliDWCMLrYIvVTLUMu7H2ISzN8SlGwC9GZjxdjkgLzh
 Id5FlKtIKqQ5iDH1ieHDzekpUUTMSBe4I..fdDtJI_4m99sVlWp0uJlUkZ7L.V.RKjjtHPEaxjZ6
 XqpKSC_OIB4DgoeYVDgY3mykKIobnHlPHBRFa5vHmFSRW2pY-
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: d46571b9-dbc3-4645-a58e-48b857632efd
Received: from sonic.gate.mail.ne1.yahoo.com by sonic308.consmr.mail.ir2.yahoo.com with HTTP; Sat, 21 Feb 2026 11:06:00 +0000
Received: by hermes--production-ir2-bbcfb4457-24w5t (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID a2cf8435db8eb5524e503b6779dbffa9;
          Sat, 21 Feb 2026 11:03:59 +0000 (UTC)
From: tomasz.unger@yahoo.pl
To: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Date: Sat, 21 Feb 2026 12:03:55 +0100
Message-ID: <20260221110355.9006-1-tomasz.unger@yahoo.pl>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
References: <20260221110355.9006-1-tomasz.unger.ref@yahoo.pl>
X-Spamd-Bar: --
X-MailFrom: tomasz.unger@yahoo.pl
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: QUCP4DVG5LBFLVS5LJ2NUB7H6GNTKPDJ
X-Message-ID-Hash: QUCP4DVG5LBFLVS5LJ2NUB7H6GNTKPDJ
X-Mailman-Approved-At: Sat, 21 Feb 2026 11:22:57 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: Fix spelling mistake in Kconfig
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/QUCP4DVG5LBFLVS5LJ2NUB7H6GNTKPDJ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.49 / 15.00];
	DMARC_POLICY_REJECT(2.00)[yahoo.pl : SPF not aligned (relaxed),reject];
	R_DKIM_REJECT(1.00)[yahoo.pl:s=s2048];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+mx];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.linaro.org,lists.linux.dev,vger.kernel.org,yahoo.pl];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[yahoo.pl];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[tomasz.unger@yahoo.pl,greybus-dev-bounces@lists.linaro.org];
	DKIM_TRACE(0.00)[yahoo.pl:-];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,yahoo.pl:mid,yahoo.pl:email]
X-Rspamd-Queue-Id: 29B2D16CC14
X-Rspamd-Action: no action

From: Tomasz Unger <tomasz.unger@yahoo.pl>

Replace 'busses' with 'buses' in help text.

Found using codespell.

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
 drivers/staging/greybus/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/Kconfig b/drivers/staging/greybus/Kconfig
index 1e745a8d439c..7635f3e850fa 100644
--- a/drivers/staging/greybus/Kconfig
+++ b/drivers/staging/greybus/Kconfig
@@ -123,7 +123,7 @@ menuconfig GREYBUS_BRIDGED_PHY
 	help
 	  Select this option to pick from a variety of Greybus Bridged
 	  PHY class drivers.  These drivers emulate a number of
-	  different "traditional" busses by tunneling them over Greybus.
+	  different "traditional" buses by tunneling them over Greybus.
 	  Examples of this include serial, SPI, USB, and others.
 
 	  To compile this code as a module, chose M here: the module
-- 
2.53.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
