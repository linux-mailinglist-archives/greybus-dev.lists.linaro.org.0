Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WFnQKH0Vg2nihQMAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Wed, 04 Feb 2026 10:46:37 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 289A0E407F
	for <lists+greybus-dev@lfdr.de>; Wed, 04 Feb 2026 10:46:37 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 27B543F9D9
	for <lists+greybus-dev@lfdr.de>; Wed,  4 Feb 2026 09:46:36 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	by lists.linaro.org (Postfix) with ESMTPS id AB7EC3F750
	for <greybus-dev@lists.linaro.org>; Wed,  4 Feb 2026 09:46:33 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linaro.org header.s=google header.b=bsAn2CyV;
	spf=pass (lists.linaro.org: domain of dan.carpenter@linaro.org designates 209.85.221.52 as permitted sender) smtp.mailfrom=dan.carpenter@linaro.org;
	dmarc=pass (policy=none) header.from=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-432d2670932so5920016f8f.2
        for <greybus-dev@lists.linaro.org>; Wed, 04 Feb 2026 01:46:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770198393; x=1770803193; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/s7GqwS0RYtq25/D0ZyCexH8s1Q1mK/+ZBZIJKp9rYc=;
        b=bsAn2CyVz0BcCeQK4AOX5DDbTwv4xI1hlaJAsxdbNDNoAwMJaQbTSMyutGhaoS7kUK
         rDeX+W4gVPeYWrTGBp9wnFBV7mTsZQHJb1+cwPIp3KaLdxkR79fwZ3jHsVR+dWpc53wI
         GVI3HRNlfByRlrRLC3Mz89Kus9APKK2jMiAYdq52Aa+x1mk18Rqb2enavdAAcxmQbZSi
         YBJnfFPMSwIj/iy0k7muSrTZj8YG1D9Vsm12mGKhPS2iVx29R45i3maDNlB9XXp/5+XN
         GZoVvC8YqDEEYLvzzxzVkQxSIsM41+6E1SrGya//XEn/Di6CH4dOKiciIjGHyrC+wx5i
         jA3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770198393; x=1770803193;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/s7GqwS0RYtq25/D0ZyCexH8s1Q1mK/+ZBZIJKp9rYc=;
        b=BoVyrhIoP1XxHBquxXDz4VFUE25SyCm7oQvDlVUwm9xwjXjUF9QalObMmD2Nu5yaGn
         t1qy7owSL09H/CRG9ubn94+vuAfVrdz5Qc3/+O7mWCCbhygr5otDBQW7rKl49IPVK8QN
         CkzCLjFFl4E7MjOrlYkFGE5ySgtgMPWu9g+V263BU8o0ddAukZGKAMx/ak6pF6WZXFDQ
         7YXOY1GmzLMcgJSww499yQnpynyZcofsPmsJCd+DSTbR5rA7kkNpXcSucaEp/5NeygIc
         DPk561h3hi0Of3zzAVhon3xcj7h1bNvzYHhLosXlfpOdJkupuWMNyXmgXqO8nuVBrc1f
         HWXw==
X-Forwarded-Encrypted: i=1; AJvYcCXKQpMdyseEuEmxiKB7AgGAqwr3azPVD2A9H2MVlJk3q3id8heTk5lahAO+4nQITFuXj3GjtCgo3TNwpw==@lists.linaro.org
X-Gm-Message-State: AOJu0Yxzjq6s+V4hOApgputwpTWnfxR0nlVe64lZag05mcfppN0u9Kwj
	7ofS1scEoNg0kxUUSGOxYPLclSWQGQC1+F3hiyi+wp+9PagEUn22jxmAwNvHVswbKX5sRg==
X-Gm-Gg: AZuq6aL88bVGWlFt/idAcctfzcmWCMqD5Kl2n8+8jdCeLN1ndV+3BzYpabBzgj5N1bc
	aQZLMcvPhwnVvHY/3eCJuArxN2iKFz7cGuMp+4AQBiWxtywucM/d3dyBGh3Hs/L2ZF3Tg3mlTNR
	qigKpZQ0mtv5VdL0TyJfapFe6r3HFJoh2XERDww6uAmPdYkdmX1qLIwBNftwuFK23H5hXOqdvtC
	KXfe3BmHZE+CxA1ZdFHSb8O9GgOLMc5WG7vGOKWzvnhJ8yy5uvrkOc8y/VT10Vdj5TaDvGmlLAa
	Ixuuy9IKtoupWNjp59ae2WoFZFJ7nU9Vcx3lg+s6AsvmvNbhWcuVBJ4DI0cyCYGLa6LNxo5PVJM
	ZxcbrxdxKaFLswrAecHwdUbW3TwX0xAZ+SvXPPI4JZAwbDDeeUmfgGNfxkXQ4UthAc6jZQUwWs7
	n4cy8R5tlkk0Eu+BXB
X-Received: by 2002:a5d:5f88:0:b0:435:a4a9:6f67 with SMTP id ffacd0b85a97d-43618059bbdmr3236589f8f.42.1770198392548;
        Wed, 04 Feb 2026 01:46:32 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43617e38ec5sm5689345f8f.14.2026.02.04.01.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 01:46:32 -0800 (PST)
Date: Wed, 4 Feb 2026 12:46:29 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Neel Bullywon <neelb2403@gmail.com>
Message-ID: <aYMVdePjEkJ7gTE2@stanley.mountain>
References: <20260203212254.90855-1-neelb2403@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260203212254.90855-1-neelb2403@gmail.com>
X-Spamd-Bar: ---
Message-ID-Hash: L6AUV7KCTUE6KGOKIR7VORO6FJOMBK6B
X-Message-ID-Hash: L6AUV7KCTUE6KGOKIR7VORO6FJOMBK6B
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: gbphy: replaced sprintf() with sysfs_emit()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/L6AUV7KCTUE6KGOKIR7VORO6FJOMBK6B/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.01 / 15.00];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_SPAM(0.00)[0.997];
	DMARC_POLICY_ALLOW(0.00)[linaro.org,none];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,greybus-dev-bounces@lists.linaro.org];
	R_DKIM_REJECT(0.00)[linaro.org:s=google];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,stanley.mountain:mid,lists.linaro.org:helo,lists.linaro.org:rdns]
X-Rspamd-Queue-Id: 289A0E407F
X-Rspamd-Action: no action

On Tue, Feb 03, 2026 at 04:22:54PM -0500, Neel Bullywon wrote:
> Replaced sprintf() with sysfs_emit in the protocol_id_show() sysfs
> attribute func to prevent any potential buffer overflows

There are no buffer overflows here.  buf is PAGE_SIZE so it's more
than large enough.  I like this change, but the commit message
implies there is a potential buffer overflow and that's wrong.

Say something like:  "This code is safe, but replace sprintf()
with sysfs_emit() because we are trying to get rid of calls to
sprintf() as part of kernel hardenning and sysfs_emit() is more
appropriate in this context".

> 
> This is to ensure a kernel-wide migration to safer string formatting
> functions for sysfs handlers
> 
> This was compile-tested only (no VM/hardware used)

Don't put this sort of comment in the commit message.  Put it under the
--- cut off line.

> 
> Signed-off-by: Neel Bullywon <neelb2403@gmail.com>
> ---
  ^^^
Here.

regards,
dan carpenter
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
