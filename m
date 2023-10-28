Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 419D67F6639
	for <lists+greybus-dev@lfdr.de>; Thu, 23 Nov 2023 19:28:00 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 527863F98E
	for <lists+greybus-dev@lfdr.de>; Thu, 23 Nov 2023 18:27:59 +0000 (UTC)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	by lists.linaro.org (Postfix) with ESMTPS id 0FBD83EFA7
	for <greybus-dev@lists.linaro.org>; Sat, 28 Oct 2023 20:25:38 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=EdGLPvp4;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (lists.linaro.org: domain of nandhakumar.singaram@gmail.com designates 209.85.210.46 as permitted sender) smtp.mailfrom=nandhakumar.singaram@gmail.com
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-6ce2b6b3cb6so2159618a34.3
        for <greybus-dev@lists.linaro.org>; Sat, 28 Oct 2023 13:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698524737; x=1699129537; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q6s/dbIiHsKw5qILIs0FnO/CHdVCCm522luSBKh8UXM=;
        b=EdGLPvp4YS46yPKJY6Qvs8Y9mCGhbk8ZzN59G2Xb+BlOKouQpAQgkqzpOaZnhD3aFw
         ljLEG8bq9iT4FqHehAfRgQkJe1YAHYH14q2oQVeWDfFCBYV7qSHKRf/ne2W4fOKCkp/X
         dC9vLoUNO9IXXYlf7DCeu1ji6YpI2IwsYN/+tK69iRf0ypKeYb9JMsTO8scnakjBEfgH
         P2RutpBEYtOSqbMxAxZ1nlYWmQ4J9lluuk5YzSHmLtNooW8D2I8HzT/wHB66ZFqR94kl
         d4m3fqbGJaSDsJx2In+TCJ5aibYoPoJuytE8fKGoRQ25tP+55cthT8f2F2MaahpDy8dU
         YXVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698524737; x=1699129537;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q6s/dbIiHsKw5qILIs0FnO/CHdVCCm522luSBKh8UXM=;
        b=IIEzpyvCSZhaZdDasTklW5FzX5ii25h9cMXAX81wbSUfHf/NTvTdolJzT74YNYy0Vb
         o3xVMlaXaYMxTfjZOSCjbH6BJnBCwaxzGy3Rq4N3wYnFv400eG3GMcy3IBci3T8ChwPG
         VGvt3anxLsuzSKn3ru8xZx8F8If2IJBLg9mXJujsjadTjPRaJGaBiOj51blvu5tbMODB
         xY+CiKd6Wv+Y19CMPEWED/FAOV8lYbySuOCnhBBBZQT0jE9+HA+1KEUePTCoRJL5Bsce
         DMHLk6zutPN5Fi3fgfMkQtbEYi4mY16y4FoBCh/BLZ2GLHdB/4ut4AVle8aDEiWW4LcP
         46Dw==
X-Gm-Message-State: AOJu0Yxpnqs0DztpQaH/M5ctW8dhoMQ58i8xDAQmkTJHHanEB5DJAVls
	ObJTZohU2tAe06s//Q3jBCA=
X-Google-Smtp-Source: AGHT+IHgdcrSFcttPGdKfN9SFlEHz8t+uTkvmaSR08wn5o7z7JDWzEKSLWaWmcv5gBShAZhWs2kn5A==
X-Received: by 2002:a05:6808:2a87:b0:3ad:f536:2f26 with SMTP id fc7-20020a0568082a8700b003adf5362f26mr6254410oib.18.1698524737423;
        Sat, 28 Oct 2023 13:25:37 -0700 (PDT)
Received: from ubuntu ([122.171.167.85])
        by smtp.gmail.com with ESMTPSA id a18-20020aa780d2000000b006c06804cd39sm3288830pfn.153.2023.10.28.13.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Oct 2023 13:25:37 -0700 (PDT)
Date: Sat, 28 Oct 2023 13:25:31 -0700
From: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
To: Alex Elder <elder@ieee.org>
Message-ID: <20231028202531.GB2432@ubuntu>
References: <cover.1697976302.git.nandhakumar.singaram@gmail.com>
 <39be7bb04ce1362b00aa31a638ebe2e88dd81fec.1697976302.git.nandhakumar.singaram@gmail.com>
 <5d457162-d20a-43a5-989e-ef263fbd91b2@ieee.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5d457162-d20a-43a5-989e-ef263fbd91b2@ieee.org>
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 0FBD83EFA7
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.10 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.210.46:from];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
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
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com]
X-Rspamd-Action: no action
X-MailFrom: nandhakumar.singaram@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: J6DVNIVI7WI6ZSULSUXQUWPDN2VRJDKX
X-Message-ID-Hash: J6DVNIVI7WI6ZSULSUXQUWPDN2VRJDKX
X-Mailman-Approved-At: Thu, 23 Nov 2023 18:27:06 +0000
CC: Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, kumaran.4353@gmail.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2 3/3] staging: greybus: bootrom: fixed prefer using ftrace warning
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/J6DVNIVI7WI6ZSULSUXQUWPDN2VRJDKX/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Oct 26, 2023 at 01:20:47PM -0500, Alex Elder wrote:
> On 10/22/23 7:22 AM, Nandha Kumar Singaram wrote:
> > Adhere to linux coding style. Reported by checkpatch.pl:
> > WARNING: Unnecessary ftrace-like logging - prefer using ftrace
> > 
> > Signed-off-by: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
> 
> This change looks reasonable to me, though I don't think
> ftrace provides device information.
> 
> Acked-by: Alex Elder <elder@linaro.org>
> 
> > ---
> >   drivers/staging/greybus/bootrom.c | 2 --
> >   1 file changed, 2 deletions(-)
> > 
> > diff --git a/drivers/staging/greybus/bootrom.c b/drivers/staging/greybus/bootrom.c
> > index a8efb86de140..79581457c4af 100644
> > --- a/drivers/staging/greybus/bootrom.c
> > +++ b/drivers/staging/greybus/bootrom.c
> > @@ -491,8 +491,6 @@ static void gb_bootrom_disconnect(struct gb_bundle *bundle)
> >   {
> >   	struct gb_bootrom *bootrom = greybus_get_drvdata(bundle);
> > -	dev_dbg(&bundle->dev, "%s\n", __func__);
> > -
> >   	gb_connection_disable(bootrom->connection);
> >   	/* Disable timeouts */
>

Thanks Alex for the review and feedback.

Regards,
Nandha Kumar
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
