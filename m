Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aIgELktTGWqYvAgAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Fri, 29 May 2026 10:50:19 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7495FF7D3
	for <lists+greybus-dev@lfdr.de>; Fri, 29 May 2026 10:50:19 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 6C4954096B
	for <lists+greybus-dev@lfdr.de>; Fri, 29 May 2026 08:50:18 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	by lists.linaro.org (Postfix) with ESMTPS id 671A6404E0
	for <greybus-dev@lists.linaro.org>; Thu, 28 May 2026 13:52:46 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=UJ0fzwkY;
	spf=pass (lists.linaro.org: domain of alfievarghese22@gmail.com designates 209.85.214.181 as permitted sender) smtp.mailfrom=alfievarghese22@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2b4583f0a1aso94161865ad.3
        for <greybus-dev@lists.linaro.org>; Thu, 28 May 2026 06:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779976365; x=1780581165; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A71OUHyyRe1M+VCs+XKSSgTKfIfoE57tMLNWnn+zSKk=;
        b=UJ0fzwkYHyMHXwj8kIR03WqBNiQRWP/Wir4mZekpAKY8kX457H1Bd4pPe+kBZltx2U
         HBEC0BXywBRC/hG54v4VQsgnFQ/622If4ypnLY39o5ciX+RVfLmt/fD3uzLrzOtM1c4p
         b/1PpozwRAxcfekgB2R/cD5vcJNDpwLax7ot2qu0IYKMrdrAfUo8+Mt2Ml4OpXVKPEDM
         8cA6fVKwDDR9ljEe1NM/Gg4agzrU3wYdL+4SadvjQ+HygWSm2or8lL8Wlc5iW/dA680n
         0vlYYy6Eu8f/xKAOfbOyGR9XEFrn37CM6gWA8ng9cI56Xi3buaWGFNUmb1VGLkK0aByo
         XV1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779976365; x=1780581165;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A71OUHyyRe1M+VCs+XKSSgTKfIfoE57tMLNWnn+zSKk=;
        b=HXglNMs3TmQhXPjshKvLBxj0nsW5K6ajFQBQxb5CD5CE5g+0coJ42qYjF0ibl9iMEK
         MnXvBFIQF71oituiBtVZnSGMX+JmD3cT1EEYC5V6IQxMLC2dss8vGE3YSUB9K6WoF5Z0
         4Qf4xBeJFoWxViccUtwrRbdKpAIpArvq4b97mpKCw6kUxJDfnEkxQ0fcRlGF0ruaPduZ
         vSjxKUqCpqWh3j9l41Nt84JYx5nunNeoNjkONgIC4rCk5vEE7SpinUmC0//ocnwHxEkm
         l/WEpqUCVTdIDhSEn/+Lg923YtuoMEYFJaKVVvKQ9N9o3FKzpe5XubqwQj9BaWIaGaqB
         07LA==
X-Gm-Message-State: AOJu0Yyrj4ZgwGLvO+PNit3qynv0jmQfKRk/Mr7CFOCQbUmWkvbniWNv
	n+kdhxCW6EfLhRhjn0QPWlmXLux9nd+qY1G2x+LYX1ny1IMdOZNjl/D3
X-Gm-Gg: Acq92OEjmbQzo77I8DK6vFpJfZ/oGyjJHJCMeyD+d1S/TMVG1q7/RTJBR8Rf33VZvhu
	SKWnJ838FEN6iQw1ZmXGIoWhvJtlPNNB89fzn8uOmuRTG3nxUoWIcwV5YWFhfnY1vz+LJNhTZoJ
	stPWyCHSqYnsvvNJsUOZ4r7JGva28XcIg0aEnRztWohn1vFQa23siqzWn80otDNJi9Z4t0AWTdU
	3ZsIP/UUs6Np94P1s1u86okmIe2a5dy48QiZKpVuN6/LuFtq2J+8VI/Td4hNBBu5TuXIf7brqga
	cUV2ra5G81T9sIpYGOGEsFXsnfeB7ckeVgyEKAMVIAapGtVPXlHxBBYdUtqAXQfvq2Is9S+HpkN
	6o2h8Qz+ZOsg+PpcxPMKmIYS7myuMj0hqWhZt6c6namG10pzvEw40rDvp4ymsxuw+uHprdaQu9D
	RrNXD60e4e7BgJhos3RImhBdJkrPufgRAVO/hCoJ+2pQo/pEsycGPRaZmVACe/G4a+AbfpoRYop
	q6vUsRCvdcCvuwS6qfWO+CfgNge//AB1AGO0MGluzkAVaWns/EU
X-Received: by 2002:a17:903:4405:b0:2b2:b117:1e1b with SMTP id d9443c01a7336-2beb0758814mr299325935ad.17.1779976365551;
        Thu, 28 May 2026 06:52:45 -0700 (PDT)
Received: from localhost ([1.39.75.74])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bed2061c59sm127792595ad.2.2026.05.28.06.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 06:52:45 -0700 (PDT)
From: Alfie Varghese <alfievarghese22@gmail.com>
To: Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Thu, 28 May 2026 13:52:21 +0000
Message-ID: <20260528135229.2816-1-alfievarghese22@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Spamd-Bar: --
X-MailFrom: alfievarghese22@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: OYUZF74FQAGLKQA6POMBD7AMXUTEO6PV
X-Message-ID-Hash: OYUZF74FQAGLKQA6POMBD7AMXUTEO6PV
X-Mailman-Approved-At: Fri, 29 May 2026 08:50:11 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Alfie Varghese <alfievarghese22@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: vibrator: return device_create() errors
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/OYUZF74FQAGLKQA6POMBD7AMXUTEO6PV/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [1.59 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-0.926];
	FROM_NEQ_ENVFROM(0.00)[alfievarghese22@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email]
X-Rspamd-Queue-Id: 5E7495FF7D3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

gb_vibrator_probe() maps any device_create() failure to -EINVAL. This
loses the real errno returned by the driver core, such as -ENOMEM, and
makes probe failures harder to diagnose correctly.

Return PTR_ERR(dev) instead so callers receive the actual failure reason
while preserving the existing cleanup path.

Signed-off-by: Alfie Varghese <alfievarghese22@gmail.com>
---
 drivers/staging/greybus/vibrator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/vibrator.c b/drivers/staging/greybus/vibrator.c
index 0ec4d317c..763c234fb 100644
--- a/drivers/staging/greybus/vibrator.c
+++ b/drivers/staging/greybus/vibrator.c
@@ -161,7 +161,7 @@ static int gb_vibrator_probe(struct gb_bundle *bundle,
 	dev = device_create(&vibrator_class, &bundle->dev,
 			    MKDEV(0, 0), vib, "vibrator%d", vib->minor);
 	if (IS_ERR(dev)) {
-		retval = -EINVAL;
+		retval = PTR_ERR(dev);
 		goto err_ida_remove;
 	}
 	vib->dev = dev;
-- 
2.54.0.windows.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
