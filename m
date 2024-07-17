Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id E0CF5933C32
	for <lists+greybus-dev@lfdr.de>; Wed, 17 Jul 2024 13:25:28 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id BC6F74416B
	for <lists+greybus-dev@lfdr.de>; Wed, 17 Jul 2024 11:25:27 +0000 (UTC)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	by lists.linaro.org (Postfix) with ESMTPS id 9478040CC8
	for <greybus-dev@lists.linaro.org>; Wed, 17 Jul 2024 08:28:36 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=IfXNfLXk;
	spf=pass (lists.linaro.org: domain of soyjuanarbol@gmail.com designates 209.85.217.45 as permitted sender) smtp.mailfrom=soyjuanarbol@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-48ffc762640so251945137.3
        for <greybus-dev@lists.linaro.org>; Wed, 17 Jul 2024 01:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721204916; x=1721809716; darn=lists.linaro.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4KZQTDZw2APXwMGxrPgybfDO9budQSIG/6b2Wcz5TM0=;
        b=IfXNfLXkN9V42hLTwkhobe975EzWIojKiczsKCN63RAA73SwuPtWvKewfsY9GSaIE5
         VyuNLMdm5p/1qTXNrTwHu6i6TLiftbDNKXh6kve/xo0xm5u9askDdnu+8ba8OLSBqp1T
         xR38omkwPLRViy+kweeOyAvZDdfoQShZ8QGr6D2ZdhX08n41ywEC+nYVVuhCHm5THWhx
         ryMD7V0f123yB1ZISBmPrnAFV9RLB0yBx8U87p6xGlOZFlIyfIETc/an7aCvr6Cormt/
         8A/TtVAst8ddX5zHm7O0n4YZDMV4JF61f1tuk8wGzkqK6CEuope2IyyZxy5zQNZeWVrG
         VypQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721204916; x=1721809716;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4KZQTDZw2APXwMGxrPgybfDO9budQSIG/6b2Wcz5TM0=;
        b=vrTqTfMd4M4EqkoJcA1WU0SLshy/ClrT5KnSwAh19m0UG5E6UGfEH0fqMyBWSdWGMd
         k3oU4aSfYw16W9rRlFHRRy7QCmHSUpn7WIkwCrjfY/oOv6wJvzO+IlseyF/l9Hoq/PlR
         edrzF50z4mW7yzO292RzY24ahM2OvHtPD8e7fN8WFCh8Jirb07NWeRnFJtVEY7/ypUVU
         j5jJMyG+WEMRCrXIswquEjN0amrqEZNng6cAlZaZ/iPrD2jN6m2GlsrAvYUmfYaHyB7/
         TVHsIqjGhg5XIjl2WmGcRYWHr4Jk+gr+cb2l/Y3zMA3ytTRq0M6nrz7sxZyqGV1DKoE0
         NJUg==
X-Forwarded-Encrypted: i=1; AJvYcCX93bjVvrYeoTlmsBse05gM/wxAGgW8hWqesnQYCGFFs7/IO5tV7erqHQPTtik4lb+SF2i/VGLPLGWakyj7XGxzRlSYJ9/FIjzo2h7A
X-Gm-Message-State: AOJu0YwgUq2pv5oHGYrvoc2U1uEx7kjTpn/pdzLB70S4QLmcnbUUvyaD
	vvk7JnRejkoemgX7PCcuKw25NziJLYzLx9lD85rHj9hA86d5Ow6g
X-Google-Smtp-Source: AGHT+IHgCN8xisAtX13jYv39e2u2Fon9PVVDbBr1QKAWQQF0y9O5fdXo2XrqCI/pG9oToa8Uzcu5hQ==
X-Received: by 2002:a05:6102:4bc3:b0:48f:e111:4ee1 with SMTP id ada2fe7eead31-49159a3fce8mr1213046137.28.1721204916050;
        Wed, 17 Jul 2024 01:28:36 -0700 (PDT)
Received: from fedora ([2800:e6:4000:47e:7c52:7bd4:cfe5:9874])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-81e64735e4fsm372012241.11.2024.07.17.01.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 01:28:35 -0700 (PDT)
Date: Wed, 17 Jul 2024 03:28:33 -0500
From: Juan =?iso-8859-1?Q?Jos=E9?= Arboleda <soyjuanarbol@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Message-ID: <ZpeAsakTE0ZL90kt@fedora>
References: <ZpdrmuzGgYDJ-Bb0@fedora>
 <2024071739-mollusk-uneaten-8dec@gregkh>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2024071739-mollusk-uneaten-8dec@gregkh>
X-Rspamd-Queue-Id: 9478040CC8
X-Spamd-Bar: -------
X-Spamd-Result: default: False [-7.50 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.217.45:from];
	RCVD_TLS_LAST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[6];
	DKIM_TRACE(0.00)[gmail.com:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-MailFrom: soyjuanarbol@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: ZM5RV5VJNGOCIAHYNUG676QHND52PCLU
X-Message-ID-Hash: ZM5RV5VJNGOCIAHYNUG676QHND52PCLU
X-Mailman-Approved-At: Wed, 17 Jul 2024 11:25:11 +0000
CC: johan@kernel.org, linux-staging@lists.linux.dev, trivial@kernel.org, greybus-dev@lists.linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: Enclose multi-statement macro in do-while loop
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/ZM5RV5VJNGOCIAHYNUG676QHND52PCLU/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 17, 2024 at 09:50:52AM +0200, Greg KH wrote:
> On Wed, Jul 17, 2024 at 01:58:34AM -0500, Juan Jos=E9 Arboleda wrote:
> > The macro `gb_loopback_stats_attrs` in the Greybus loopback driver
> > contains multiple statements, which should be enclosed in a do-while
> > loop to ensure proper execution and adhere to coding standards.
> >=20
> > This patch modifies the `gb_loopback_stats_attrs` macro to enclose
> > its statements in a do-while loop, addressing the style error flagged
> > by checkpatch.pl.
> >=20
> > Signed-off-by: Juan Jos=E9 Arboleda <soyjuanarbol@gmail.com>
> > ---
> >  drivers/staging/greybus/loopback.c | 8 +++++---
> >  1 file changed, 5 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greyb=
us/loopback.c
> > index 4313d3bbc23a..a97de86c67a5 100644
> > --- a/drivers/staging/greybus/loopback.c
> > +++ b/drivers/staging/greybus/loopback.c
> > @@ -163,9 +163,11 @@ static ssize_t name##_avg_show(struct device *dev,=
		\
> >  static DEVICE_ATTR_RO(name##_avg)
> > =20
> >  #define gb_loopback_stats_attrs(field)				\
> > -	gb_loopback_ro_stats_attr(field, min, u);		\
> > -	gb_loopback_ro_stats_attr(field, max, u);		\
> > -	gb_loopback_ro_avg_attr(field)
> > +	do {							\
> > +		gb_loopback_ro_stats_attr(field, min, u);	\
> > +		gb_loopback_ro_stats_attr(field, max, u);	\
> > +		gb_loopback_ro_avg_attr(field);			\
> > +	} while (0)
> > =20
> >  #define gb_loopback_attr(field, type)					\
> >  static ssize_t field##_show(struct device *dev,				\
>=20
> Are you sure you test-built this change?
>=20
> thanks,
>=20
> greg k-h

Yes! I build and clean and build and clean and build again, everything seems
fine from the compiler side and posttest task as well. Everything seems ok.

Thanks,
- Juan Jos=E9

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
