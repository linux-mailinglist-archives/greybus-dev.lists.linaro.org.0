Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id opWQDXHfL2okIQUAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Mon, 15 Jun 2026 13:18:09 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id E4427685AA3
	for <lists+greybus-dev@lfdr.de>; Mon, 15 Jun 2026 13:18:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b="lrnMij/i";
	spf=pass (mail.lfdr.de: domain of "greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org" designates 44.210.186.118 as permitted sender) smtp.mailfrom="greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=gmail.com (policy=none)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D493540A90
	for <lists+greybus-dev@lfdr.de>; Mon, 15 Jun 2026 11:18:07 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	by lists.linaro.org (Postfix) with ESMTPS id 542D13F96F
	for <greybus-dev@lists.linaro.org>; Sun, 14 Jun 2026 15:45:29 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4903d730b1fso32541595e9.2
        for <greybus-dev@lists.linaro.org>; Sun, 14 Jun 2026 08:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781451928; x=1782056728; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Ovn4XB3GgCDHVcufiauy/1mVBNPpRS6FI6cibDiq4A=;
        b=lrnMij/iJqoqW76al4SMO+Lkl92s5F+z74V34rZqPZrXfdLj+lxIVxxzQgvk4fk1dD
         7raxHge3PoFNd6oQEmCBgryKAeeIpayKdAoO96j0weW6QXzDjiFAsLmVDuhiK++FSLO6
         5wmC9YgSBLIrJvsWn+PBGKiYzvgU1RFRsa0O/IRJ3LK/vnLQd/k3zkYdhTewBxQJpQX7
         k2G5a1JmTSJRcP8YsYWWEyzmK296v54HkyScqCxuvYjkgJhNWHTS/HLsjvOYT7fXXnxZ
         labR1NbpLVoXKNrp64llT1iKBNqcU7ArbF3Xevilsyjag6plqNSNgAow281kyFUHsdEI
         wFOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781451928; x=1782056728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5Ovn4XB3GgCDHVcufiauy/1mVBNPpRS6FI6cibDiq4A=;
        b=aRW22uG6n57nidysFDTIOhTkA8T1eCnPVlZ3fvyz+wIcxmZMeJhPfNUTHqW+sUK6hi
         jZq+R6vvXy+dYfekv3yLSERfMkCTOfytUbESv/RQqrOYSqJHJGTdkUvP5yc2s823Bgvm
         BXdp6JGDK3+CSgG/QNYEd7qcgqmVQDT+g4MksG0/V7BH3zJoSkXuzTE2iBx+MY3vkoGo
         fKijW0F1z6iEC4ifB6LLo0mNPCJNGsejCvCVCUswgvnXfxuNhIPkm9J4GGvfYXe6hZAA
         mRlCWzb5r1snVONs84KwUinLFr6uT07mY7vG5QdKN6fGJzlhMiS2iRhFQgZuAZ4Skl/V
         Elkw==
X-Forwarded-Encrypted: i=1; AFNElJ+HHA+Nl6MQtckkEVJSTvjWm++UIYjnwYXOsXfc+Zj+fcofwg0NbA3X8TBfF8kntym7s+P7vXpgM1Amew==@lists.linaro.org
X-Gm-Message-State: AOJu0YwRIDU8gysy+jcMw+EixKtabEdAqVAcsqShB2OGQBWKw8wu969P
	Q87Pvjx11I+5WZFo1PXC9VgXTmJKaVLRw10OkAKQdp5/gQ3iTuGko//W
X-Gm-Gg: Acq92OGJfJkk4Y5Ubkgr5F5aMCH/RKqP2zynEe1zr62u+7ewdsvitEX6+ZmfISgMjJG
	vN99vZzOCZ9qt2qeI6laAJnKKFvAIgJ5ZikXEBQCqUZ/X/T4U3/+vgeh+aCuFh0l0gXoK2/rwA4
	hNIBirTLs//Wb4dC1UTLbIWYCxeuBqIpNEhtlGpKQzdzjCULFc2lchMMZFG2PS8a/aA+Z2YE/+E
	9gfBrf2emCSASG3g83BYXqrgWdqd4kGPwVkBWn4EPPcAoBgGX9SBBuZQPytENFjjnI3FjP9QyWv
	jsuEIrap0TNgIsTYNvEY4PpvWESjyogmAthQhUmXzjpdn4FePHc109AntXtF4ydkfdsV/9HJyXz
	Q0jWGcS5z1032ZDAITmXSjnti8fCfANqwLwCUnxQALhKQNOTj4TH1dRyfM00KTUKjcVIP7ez+ja
	J+1+3MVZ2lI3EsiFJh3/ZeP9Z0DUu1rdIWTP/7v3QRjQCc2Q==
X-Received: by 2002:a05:600c:3512:b0:491:9969:739d with SMTP id 5b1f17b1804b1-4922011393fmr92175955e9.29.1781451928107;
        Sun, 14 Jun 2026 08:45:28 -0700 (PDT)
Received: from fedora ([154.182.122.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922031b7d2sm184237135e9.5.2026.06.14.08.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 08:45:27 -0700 (PDT)
From: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
To: gregkh@linuxfoundation.org
Date: Sun, 14 Jun 2026 18:43:28 +0300
Message-ID: <20260614154329.5176-2-abdelnasserhussein11@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260614154329.5176-1-abdelnasserhussein11@gmail.com>
References: <20260614154329.5176-1-abdelnasserhussein11@gmail.com>
MIME-Version: 1.0
X-Spamd-Bar: --
X-MailFrom: abdelnasserhussein11@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: PFWFOQK24ZWYD36GEGF3DA6ICH6GAEHL
X-Message-ID-Hash: PFWFOQK24ZWYD36GEGF3DA6ICH6GAEHL
X-Mailman-Approved-At: Mon, 15 Jun 2026 11:17:31 +0000
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Abdelnasser Hussein <abdelnasserhussein11@gmail.com>, Dan Carpenter <dan.carpenter@oracle.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v3 1/2] staging: greybus: audio_codec: fix sscanf return value check
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/PFWFOQK24ZWYD36GEGF3DA6ICH6GAEHL/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.59 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:johan@kernel.org,m:elder@kernel.org,m:greybus-dev@lists.linaro.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:abdelnasserhussein11@gmail.com,m:dan.carpenter@oracle.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[abdelnasserhussein11@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com,oracle.com];
	DKIM_TRACE(0.00)[gmail.com:-];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abdelnasserhussein11@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E4427685AA3

Smatch static checker warns:
drivers/staging/greybus/audio_codec.c:335 gbaudio_module_update()
warn: sscanf doesn't return error codes

The sscanf() function returns the number of successfully matched input
items, not a negative error code. Compare the return value directly
with the expected number of conversions (3) instead of storing it in
'ret' and returning it as an error code, which leads to returning
a positive value on failure.

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Closes: https://lore.kernel.org/all/YoOLnDkHgVltyXK7@kili/

Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
---
Changes in v3:
- Split from the previous v2 patch into a separate patch.
- Updated tags to properly credit Dan Carpenter for the smatch warning.

 drivers/staging/greybus/audio_codec.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/audio_codec.c b/drivers/staging/greybus/audio_codec.c
index 720aa752e17e..295222ec0f1a 100644
--- a/drivers/staging/greybus/audio_codec.c
+++ b/drivers/staging/greybus/audio_codec.c
@@ -311,8 +311,7 @@ int gbaudio_module_update(struct gbaudio_codec_info *codec,
 	}
 
 	/* parse dai_id from AIF widget's stream_name */
-	ret = sscanf(w->sname, "%s %d %s", intf_name, &dai_id, dir);
-	if (ret < 3) {
+	if (sscanf(w->sname, "%s %d %s", intf_name, &dai_id, dir) != 3) {
 		dev_err(codec->dev, "Error while parsing dai_id for %s\n", w->name);
 		return -EINVAL;
 	}
-- 
2.54.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
