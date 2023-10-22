Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 363877F6633
	for <lists+greybus-dev@lfdr.de>; Thu, 23 Nov 2023 19:27:25 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3C95140A7C
	for <lists+greybus-dev@lfdr.de>; Thu, 23 Nov 2023 18:27:24 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	by lists.linaro.org (Postfix) with ESMTPS id DD6463EC22
	for <greybus-dev@lists.linaro.org>; Sun, 22 Oct 2023 12:03:47 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=Udjc9rrc;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (lists.linaro.org: domain of nandhakumar.singaram@gmail.com designates 209.85.216.41 as permitted sender) smtp.mailfrom=nandhakumar.singaram@gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-27b22de9b5bso1379794a91.3
        for <greybus-dev@lists.linaro.org>; Sun, 22 Oct 2023 05:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697976227; x=1698581027; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=p/eE2iwjhBbOe3VZZ3RYTaBbrjxq/R/X+GGySVAzau0=;
        b=Udjc9rrc0qPk1vvY+rEtEAl31A2NoAhf67qd6KFC2dsmGEL7fpDq8+n9Tb/mhk9+3H
         Y6VZrV2LqUw+jc5mgZEDZSQB7UK6s305/f0W8OFlEvJxiMJugdtCW+2nfUbQP9oevUeF
         6b2aKcU008JuAbJiDpkBw6T+GWhT7ZYNYQgedCO55AZu4D/EDO4MLYiSYUB/Vk5n2H4B
         ciB2vXER1sqCsIbAoHm6jDJigB9Qb4AImz3IsUdwdtAOYRgihu4FdLT8TW5tlznSHZP+
         iMCXRqigdzXdSbYcCLy5KYLzB4Y7T3H2AX4/EGOfsifOp5ARH3cnlD58RMvkqtgjm/W9
         cA/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697976227; x=1698581027;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p/eE2iwjhBbOe3VZZ3RYTaBbrjxq/R/X+GGySVAzau0=;
        b=DigLQPRct0IAE608rj+ta+/o9J1b0w6v1n++UWf3Vy2eYFJRL2zfKZ7xseCsDJtFkR
         crYFJ/QWvW9YOVmVy3mF7buuyxE3CIUlw/G3IrHVUpuyihJcop4oPN4+iwISXt/PFjpd
         SQAB1qYp/pzpRYt82QxCpZe6J214r29KQiuyfM3DKUbxAqVPt5zF6Ya43bJQPbI2fzi3
         Uc+0jef8OgQPFYXy3ZBXM6ubfpSSnO6AlLU+fuTrWMe00AxdPMfMiU1Rg4c2nBjBQtgl
         a6oYIoc95SBPqJGugA603Tg4pwDZyXz9bnerpl+ysRtQijOD8JaFX/mgxB8pdB5OWS33
         g6pA==
X-Gm-Message-State: AOJu0YykCIYYTAdwnoHX67PVbtJwr8P/B/zKzzHhLvLZar+8sJDZxKQ6
	6liaXMsTbmZs99XJyCEegsk=
X-Google-Smtp-Source: AGHT+IGRFz9ZInmubBn8DZsC49Gxsp+1AuFYvUY87+ZRzwqgsgTlaeyx7ImsdMRhqntoNGx1a4wq7g==
X-Received: by 2002:a17:90a:55cf:b0:27d:ba33:699b with SMTP id o15-20020a17090a55cf00b0027dba33699bmr4572377pjm.2.1697976226880;
        Sun, 22 Oct 2023 05:03:46 -0700 (PDT)
Received: from ubuntu ([122.171.143.200])
        by smtp.gmail.com with ESMTPSA id t3-20020a6564c3000000b005ac384b71cbsm3587393pgv.60.2023.10.22.05.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Oct 2023 05:03:46 -0700 (PDT)
Date: Sun, 22 Oct 2023 05:03:31 -0700
From: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <20231022120331.GA3552@ubuntu>
References: <cover.1697969950.git.nandhakumar.singaram@gmail.com>
 <cade10d4b94127900a015e0b2ab94da5dd8c2c63.1697969950.git.nandhakumar.singaram@gmail.com>
 <2023102219-boat-shaky-f491@gregkh>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2023102219-boat-shaky-f491@gregkh>
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: DD6463EC22
X-Spamd-Bar: ------
X-Spamd-Result: default: False [-6.10 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.216.41:from];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com]
X-Rspamd-Action: no action
X-MailFrom: nandhakumar.singaram@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: HV65TW2QUDQ65UEJNET7MAYXPYH76TY7
X-Message-ID-Hash: HV65TW2QUDQ65UEJNET7MAYXPYH76TY7
X-Mailman-Approved-At: Thu, 23 Nov 2023 18:26:52 +0000
CC: Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, kumaran.4353@gmail.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 3/3] staging: greybus: fixed prefer using ftrace warning
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/HV65TW2QUDQ65UEJNET7MAYXPYH76TY7/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Oct 22, 2023 at 01:19:33PM +0200, Greg Kroah-Hartman wrote:
> On Sun, Oct 22, 2023 at 03:42:26AM -0700, Nandha Kumar Singaram wrote:
> > Adhere to linux coding style. Reported by checkpatch.pl:
> > WARNING: Unnecessary ftrace-like logging - prefer using ftrace
> > 
> > Signed-off-by: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
> > ---
> >  drivers/staging/greybus/bootrom.c | 2 --
> >  1 file changed, 2 deletions(-)
> 
> Again, subject line should have "bootrom" in there somewhere, right?
> 
> thanks,
> 
> greg k-h

Will update and share the patchset again.

Thanks,
Nandha Kumar
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
