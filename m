Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC286D43A7
	for <lists+greybus-dev@lfdr.de>; Mon,  3 Apr 2023 13:37:45 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id E50943ED7B
	for <lists+greybus-dev@lfdr.de>; Mon,  3 Apr 2023 11:37:44 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	by lists.linaro.org (Postfix) with ESMTPS id 25C533ED7B
	for <greybus-dev@lists.linaro.org>; Mon,  3 Apr 2023 06:24:01 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20210112 header.b=Gut8oqvT;
	spf=pass (lists.linaro.org: domain of error27@gmail.com designates 209.85.208.45 as permitted sender) smtp.mailfrom=error27@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id eg48so112695741edb.13
        for <greybus-dev@lists.linaro.org>; Sun, 02 Apr 2023 23:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680503040;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ElJuNUFsMwi5roY3yyQjQy4Z7CYKWDGQhJKFQymJzes=;
        b=Gut8oqvT/qTTCSw9tafkiGG4ANcTSTe9WKKbcS+OIQeFNEzv8PEkAGACUDo0vLkSvO
         mpoWxf0S+uPbwz+gIh7GBgNPKDLW0Jj5b7ej3mdCraL//CWZEiizZq+s6WIWFSw/qzbB
         Cqq289fNXw2UwlUKqZvX1KSpVVN1ork23LdwzrdjAjjFMCO4OvgFNp9PZzEUwLe8gmTr
         L+opyiHomo4VNaNBddzAwcpHpNnkQBbahQ7USHr3/0HuJMrmW7NJqFGtygOUSIiwSsTA
         UeK3D2TTjYrIflxoiaGQ0y/Ughn1Twnau3pJDmVcDP6CdQYNA6Uhg9gv5qWgtAox8NYi
         q5Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680503040;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ElJuNUFsMwi5roY3yyQjQy4Z7CYKWDGQhJKFQymJzes=;
        b=r/5amdSyCmDYEuTZ1Bq8sXfmUfCFgguz1ncfyC1lKxu6qdqcvMuM+Oo3/UEXkOl+5d
         9hiC6nPVER720/TVu4ssC8EI3+rC8HKaeriUZ8PRm8iKzR/XNq0ceTVO7RSc2bDBEWy7
         8ROSax5T65x7yC7sA9QK9SsFgW7Yopx08GuF6JW3ywauqw4QX7EH+nZNDBiZZqYmH6QY
         C/Q3cEy4rXU7TaW+sOH1+IbqHCXEQg1OaEOKF2NqmihOgCLqjuLlq+pl8jWZ+XNyZYfL
         U72qQOOMf8+y1XxfiYFnVZ2534RkouRdVcrFA/zWiG81Va6OI9xHbz9Tq6xqcqP//7T/
         Jfdg==
X-Gm-Message-State: AAQBX9e3YoxH8Pkx5HZIWmavffg1nGwcvIebYR95hW22uWJ9X/HxOaN5
	O5I2iPblN9fRHZ2+xYVDlLc=
X-Google-Smtp-Source: AKy350YcXj0yllddeu+1jsJraGt8twyveoS6qIyHUSlt3jrxCweF3OZruDJcTgVetha/Lpdr+rRVwA==
X-Received: by 2002:a17:906:7f1a:b0:8b1:29ed:e206 with SMTP id d26-20020a1709067f1a00b008b129ede206mr30080061ejr.28.1680503040092;
        Sun, 02 Apr 2023 23:24:00 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id a26-20020a50c31a000000b005027686918bsm3955881edb.11.2023.04.02.23.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Apr 2023 23:23:59 -0700 (PDT)
Date: Mon, 3 Apr 2023 09:23:55 +0300
From: Dan Carpenter <error27@gmail.com>
To: =?iso-8859-1?Q?=C1ngel?= Alberto Carretero <angelalbertoc.r@gmail.com>
Message-ID: <2cb170e2-3551-4f2a-9cd3-065d9bd4504b@kili.mountain>
References: <20230402122550.70682-1-angelalbertoc.r@gmail.com>
 <2023040252-racoon-daintily-3589@gregkh>
 <0af15115-9641-a1c8-f398-c4e8e77379a3@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0af15115-9641-a1c8-f398-c4e8e77379a3@gmail.com>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 25C533ED7B
X-Spamd-Bar: ------
X-Spamd-Result: default: False [-6.00 / 15.00];
	DWL_DNSWL_HI(-3.50)[gmail.com:dkim];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20210112];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.208.45:from];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TAGGED_RCPT(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_SEVEN(0.00)[8];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[]
X-MailFrom: error27@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 7S6NURUVNB4I63BL7M77DJ6UNUUE6V33
X-Message-ID-Hash: 7S6NURUVNB4I63BL7M77DJ6UNUUE6V33
X-Mailman-Approved-At: Mon, 03 Apr 2023 11:36:45 +0000
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: loopback: fix up checkpath macro do while error.
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/7S6NURUVNB4I63BL7M77DJ6UNUUE6V33/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 02, 2023 at 08:22:35PM +0200, =C1ngel Alberto Carretero wrote:
>=20
>=20
> On 02/04/2023 15:16, Greg Kroah-Hartman wrote:
> > On Sun, Apr 02, 2023 at 02:25:51PM +0200, Angel Alberto Carretero wrote:
> > > Wrap macro in a do-while statement.
> > >=20
> > > Signed-off-by: Angel Alberto Carretero <angelalbertoc.r@gmail.com>
> > > ---
> > >   drivers/staging/greybus/loopback.c | 8 +++++---
> > >   1 file changed, 5 insertions(+), 3 deletions(-)
> > >=20
> > > diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/gre=
ybus/loopback.c
> > > index d7b39f3bb652..371809770ed0 100644
> > > --- a/drivers/staging/greybus/loopback.c
> > > +++ b/drivers/staging/greybus/loopback.c
> > > @@ -162,9 +162,11 @@ static ssize_t name##_avg_show(struct device *de=
v,		\
> > >   static DEVICE_ATTR_RO(name##_avg)
> > >   #define gb_loopback_stats_attrs(field)				\
> > > -	gb_loopback_ro_stats_attr(field, min, u);		\
> > > -	gb_loopback_ro_stats_attr(field, max, u);		\
> > > -	gb_loopback_ro_avg_attr(field)
> > > +	do {		\
> > > +		gb_loopback_ro_stats_attr(field, min, u);		\
> > > +		gb_loopback_ro_stats_attr(field, max, u);		\
> > > +		gb_loopback_ro_avg_attr(field);		\
> > > +	} while (0)
> > >   #define gb_loopback_attr(field, type)					\
> > >   static ssize_t field##_show(struct device *dev,				\
> > > --=20
> > > 2.40.0
> > >=20
> > >=20
> >=20
> > Any specific reason why you did not test build your change before
> > submitting it?
> >=20
> > thanks,
> >=20
> > greg k-h
>=20
> Apologies, we can drop the patch. I was trying to find an error as part
> of the eudyptula challenge and thought I was compiling the driver
> correctly. Upon further examination, the macro cannot be written with a
> do-while because it is defining functions.

The "eudyptula challenge" and other first patch guides should be updated
to tell people to search for their code on lore.kernel.org before
sending a patch.

See if you can fix one of the howtos.

regards,
dan carpenter

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
