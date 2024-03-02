Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B63986EFF7
	for <lists+greybus-dev@lfdr.de>; Sat,  2 Mar 2024 10:59:57 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id DC9A443F6A
	for <lists+greybus-dev@lfdr.de>; Sat,  2 Mar 2024 09:59:55 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	by lists.linaro.org (Postfix) with ESMTPS id 087BC40B2E
	for <greybus-dev@lists.linaro.org>; Sat,  2 Mar 2024 09:59:50 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linaro.org header.s=google header.b=R5kOElOa;
	spf=pass (lists.linaro.org: domain of dan.carpenter@linaro.org designates 209.85.128.51 as permitted sender) smtp.mailfrom=dan.carpenter@linaro.org;
	dmarc=pass (policy=none) header.from=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-412d537a91bso1653535e9.1
        for <greybus-dev@lists.linaro.org>; Sat, 02 Mar 2024 01:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709373589; x=1709978389; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WXevwhgIr2J2YRRZ5pTYABsmmlbW89cM1iNV1W0EhcQ=;
        b=R5kOElOaAfyjLIz6lvsJM+H7mCRqH2lbf7zyEqpL9zS5coy7uuSyhGib/SF0xfZwDG
         /w/Yljs2G0smsZmaujIuN21ZbnEC3i4nvz8e3LjjivxEjUuRW/3MTm8yQGyDdDaRb/SV
         Zo9TJL3+/YmHWSHeOLaxA/MSeWnz18ZVjZjBjaTEWQLoAdIsHX1HHr2WHzUggekM1Jom
         XugfqiczM7W5Qorda1N4qpargZRDI7+V4/hW6JP7Xe7YKqQ2Mfb6fSMdEGzFVjN2ASRo
         1YNQppadgLEMfH1zr6IN7Ahx6thwHDpETcY971yW1Qjd/0JcQ87SI6nviDfcfIc+i/QK
         YPAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709373589; x=1709978389;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WXevwhgIr2J2YRRZ5pTYABsmmlbW89cM1iNV1W0EhcQ=;
        b=t+/5+AJWA9U+QUquF6suY8OMSJvgQXhth9fMmXi3rS28wPbNZbq2rlYGlYzgZd5cil
         tkYBWBlmA3HZtEWat2y22EptixdBMqhCLZawyefWKgt4XY0IPlWgV7NScQzaLAXUlz0s
         mEVxEnQl/Bpw6GqKbGZE/6VxI92IvdqG7bNaixIWrpMOCFCC6MU5TgJTPhBK9sEEYrMx
         5/y1sdWKkGtrezrNaErwfT62O/rB/gKXxmUWkw39KfmCkjiyURrxw9xZ5cgh2TLv1j+z
         Tk4///7Stx/gBZccrT3tdRPOPe72OKiIMJnzHVMRq2dLLzx+mCmQB8rqey0xZUzyK7Zo
         JS9g==
X-Forwarded-Encrypted: i=1; AJvYcCWcipEjlB/mKVFX1YXuAqwO5KrnErGXe7o97ork5QI+lZOk/9zhkCjj3IXVfRrQgxY2bhWmfPK7fQQlgAeZk97W4nAwMGcFX7rNu1CU
X-Gm-Message-State: AOJu0YzaJmvkBEjI+wp7izWU8wGeAAS9/XdFY4GxEM3kaauWGScqQwok
	hJlYDZaNbpAhprWuUwqlW//0453QeNcGDXXGf79gXYe9hFEhzYsdUZxpMXvGTBUexQ==
X-Google-Smtp-Source: AGHT+IGp8XtRUBc+woL08R4bjKNomQ6c36yPs4xmUB7xf/YAncZBACwwvcMHn7i4i9lCZGd9kOTtyw==
X-Received: by 2002:a05:600c:5192:b0:412:afed:5cfb with SMTP id fa18-20020a05600c519200b00412afed5cfbmr3731099wmb.15.1709373589034;
        Sat, 02 Mar 2024 01:59:49 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id z9-20020a05600c114900b00410bca333b7sm10876433wmz.27.2024.03.02.01.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Mar 2024 01:59:48 -0800 (PST)
Date: Sat, 2 Mar 2024 12:59:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Mikhail Lobanov <m.lobanov@rosalinux.ru>
Message-ID: <7ef732ad-a50f-4cf5-8322-376f42eb051b@moroto.mountain>
References: <20240301190425.120605-1-m.lobanov@rosalinux.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240301190425.120605-1-m.lobanov@rosalinux.ru>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 087BC40B2E
X-Spamd-Bar: ----
X-Spamd-Result: default: False [-4.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.128.51:from];
	MISSING_XM_UA(0.00)[];
	ARC_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,linuxfoundation.org,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	DKIM_TRACE(0.00)[linaro.org:+]
Message-ID-Hash: H7ZURKDKJSFDLEWOGQECMG52XCOAPBYM
X-Message-ID-Hash: H7ZURKDKJSFDLEWOGQECMG52XCOAPBYM
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] greybus: Fix deref of NULL in __gb_lights_flash_brightness_set
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/H7ZURKDKJSFDLEWOGQECMG52XCOAPBYM/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Mar 01, 2024 at 02:04:24PM -0500, Mikhail Lobanov wrote:
> Dereference of null pointer in the __gb_lights_flash_brightness_set function.
> Assigning the channel the result of executing the get_channel_from_mode function
> without checking for NULL may result in an error.

get_channel_from_mode() can only return NULL when light->channels_count
is zero.

Although get_channel_from_mode() seems buggy to me.  If it can't
find the correct mode, it just returns the last channel.  So potentially
it should be made to return NULL.

diff --git a/drivers/staging/greybus/light.c b/drivers/staging/greybus/light.c
index d62f97249aca..acd435f5d25d 100644
--- a/drivers/staging/greybus/light.c
+++ b/drivers/staging/greybus/light.c
@@ -95,15 +95,15 @@ static struct led_classdev *get_channel_cdev(struct gb_channel *channel)
 static struct gb_channel *get_channel_from_mode(struct gb_light *light,
 						u32 mode)
 {
-	struct gb_channel *channel = NULL;
+	struct gb_channel *channel;
 	int i;
 
 	for (i = 0; i < light->channels_count; i++) {
 		channel = &light->channels[i];
 		if (channel && channel->mode == mode)
-			break;
+			return channel;
 	}
-	return channel;
+	return NULL;
 }
 
 static int __gb_lights_flash_intensity_set(struct gb_channel *channel,
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
