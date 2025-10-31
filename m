Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 016FCC26A86
	for <lists+greybus-dev@lfdr.de>; Fri, 31 Oct 2025 19:59:49 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id CC23B3F7E6
	for <lists+greybus-dev@lfdr.de>; Fri, 31 Oct 2025 18:59:47 +0000 (UTC)
Received: from mout.web.de (mout.web.de [217.72.192.78])
	by lists.linaro.org (Postfix) with ESMTPS id 0910F3F797
	for <greybus-dev@lists.linaro.org>; Fri, 31 Oct 2025 18:57:50 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=web.de header.s=s29768273 header.b="v1O/vyF3";
	dmarc=pass (policy=quarantine) header.from=web.de;
	spf=pass (lists.linaro.org: domain of Markus.Elfring@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=Markus.Elfring@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1761937069; x=1762541869; i=markus.elfring@web.de;
	bh=xCFB1k+U8G/katsdVnXIlr1OsTRxG1sRhgLyFr3nUDs=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=v1O/vyF3rRHt/MIptn692Lw9CDyvezAXkJa5/ErkoXiBWMcMG+jEXjMKuaC71aSt
	 K2lFMssjJK3h5Lm20AkyhEyLOFOrt1AMnlI+01uJ6IdV/x/qWiBv/Mzv5ftvRmRAB
	 fnWLCWYx6DZVH/9i7Uh5MCHM/l/ePSOYr5eH0V7fLyH1NYTa056qWMzEAtpO3sp8B
	 E25BUkauUaCZ/q0bz2mAgXBwUK3b7KPbg4GO19eeTvW3o2A47Yw5FrPo16BSXkZH5
	 aLPI3+MAcLxJ3DFHh8W5xwAAhAFof1Dc/R0jCNi3wHiUr2gFB+fl2iN+u9fLMR+n1
	 5DGnLsKC3Z9bSgaooQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.206]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MlbHE-1vxcit08AM-00auDl; Fri, 31
 Oct 2025 19:57:49 +0100
Message-ID: <b542b028-4f9b-44cd-aca7-5d4977c2faa4@web.de>
Date: Fri, 31 Oct 2025 19:57:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: greybus-dev@lists.linaro.org, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Johan Hovold <johan@kernel.org>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
X-Provags-ID: V03:K1:VC/dqoja5zTdKmSiDP35CnR2TVkFTm5rUKklub6tNsfabEo7R1d
 GDWXGjgZizekYES25WstRTaQDY6UzamDlAzdRUTBN8sOQ/zeyGkQcjwxUYojNDyVYkc6mc5
 E4IZl78z98FPP99tI6C85XeJ/sNQHfp6DPNwedkh/Ze4a41tCVrI8Dab17YyQMFiouqRsg2
 /d5EHqqtF9V9Q0ba4ZiTg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:5BnxZTlOTC4=;WtpIBY5e8lDMCKGS6Qhs/aRHeA7
 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
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 0910F3F797
X-Spamd-Bar: ----
X-Spamd-Result: default: False [-4.10 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[web.de,quarantine];
	ONCE_RECEIVED(0.20)[];
	R_SPF_ALLOW(-0.20)[+a:mout.web.de];
	RWL_MAILSPIKE_VERYGOOD(-0.20)[217.72.192.78:from];
	R_DKIM_ALLOW(-0.20)[web.de:s=s29768273];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_IN_DNSWL_LOW(-0.10)[217.72.192.78:from];
	FREEMAIL_ENVFROM(0.00)[web.de];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:8560, ipnet:217.72.192.0/20, country:DE];
	RCVD_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[web.de];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,animalcreek.com,gmail.com];
	RCPT_COUNT_SEVEN(0.00)[8];
	FROM_EQ_ENVFROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.905];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[web.de:+]
X-Rspamd-Action: no action
X-MailFrom: Markus.Elfring@web.de
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: DTELE5HW4QIB5DZJM5XFI6HTOWB4NXNP
X-Message-ID-Hash: DTELE5HW4QIB5DZJM5XFI6HTOWB4NXNP
X-Mailman-Approved-At: Fri, 31 Oct 2025 18:59:45 +0000
CC: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Miaoqian Lin <linmq006@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] greybus: es2: Use pointer from memcpy() call for assignment in output_async()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/DTELE5HW4QIB5DZJM5XFI6HTOWB4NXNP/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 31 Oct 2025 19:50:39 +0100

A pointer was assigned to a variable. The same pointer was used for
the destination parameter of a memcpy() call.
This function is documented in the way that the same value is returned.
Thus convert two separate statements into a direct variable assignment for
the return value from a memory copy action.

The source code was transformed by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/greybus/es2.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/greybus/es2.c b/drivers/greybus/es2.c
index 7630a36ecf81..d71d37b41a66 100644
--- a/drivers/greybus/es2.c
+++ b/drivers/greybus/es2.c
@@ -194,8 +194,7 @@ static int output_async(struct es2_ap_dev *es2, void *req, u16 size, u8 cmd)
 		return -ENOMEM;
 	}
 
-	buf = (u8 *)dr + sizeof(*dr);
-	memcpy(buf, req, size);
+	buf = memcpy((u8 *)dr + sizeof(*dr), req, size);
 
 	dr->bRequest = cmd;
 	dr->bRequestType = USB_DIR_OUT | USB_TYPE_VENDOR | USB_RECIP_INTERFACE;
-- 
2.51.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
