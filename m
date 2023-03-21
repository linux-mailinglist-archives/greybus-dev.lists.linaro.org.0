Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id D24A56C378F
	for <lists+greybus-dev@lfdr.de>; Tue, 21 Mar 2023 18:01:54 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id CFD1A441C5
	for <lists+greybus-dev@lfdr.de>; Tue, 21 Mar 2023 17:01:53 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	by lists.linaro.org (Postfix) with ESMTPS id 626283EC46
	for <greybus-dev@lists.linaro.org>; Tue, 21 Mar 2023 17:01:49 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b="yGJ/UGFA";
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 145.40.68.75 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 7F4A5B818F2;
	Tue, 21 Mar 2023 17:01:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDE2EC4339B;
	Tue, 21 Mar 2023 17:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1679418107;
	bh=wijKgZAZ2VxVg3wUlQIz/KBZ2VVi/2DuE5W458CNj8A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=yGJ/UGFAYSIcXhAnT6Z0C0YknK2+H4WD6fsHv3q8VzgO7xbBiUF7Ws5qbngCCfPEg
	 T4ZHHM2Hy18vtHmd36Erqn6lu0j+hPsZMyeK9YmR3Wp988n9/63MhTNwCLB6Q9uLwG
	 CWN8E8y8//3ONxeEYLtAh6CWvzlDTB0Ycix1QaGU=
Date: Tue, 21 Mar 2023 18:01:44 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Julia Lawall <julia.lawall@inria.fr>
Message-ID: <ZBni+Ho63jwZth9F@kroah.com>
References: <cover.1679352669.git.eng.mennamahmoud.mm@gmail.com>
 <1274302b52ae905dab6f75377d625598facbbdf1.1679352669.git.eng.mennamahmoud.mm@gmail.com>
 <20230321154728.3r7ut3rl2pccmo2e@pengutronix.de>
 <82a4e5f1-a1f2-c70-3645-9464ccb17bab@inria.fr>
 <20230321162629.rjmivzhbdy4pcgii@pengutronix.de>
 <9a775966-29d4-12b3-e67d-4327194f972@inria.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9a775966-29d4-12b3-e67d-4327194f972@inria.fr>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 626283EC46
X-Spamd-Bar: ------
X-Spamd-Result: default: False [-6.50 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:145.40.68.75];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_CC(0.00)[pengutronix.de,gmail.com,lists.linux.dev,kernel.org,lists.linaro.org,vger.kernel.org];
	ASN(0.00)[asn:54825, ipnet:145.40.68.0/24, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2]
Message-ID-Hash: FOWO4ZN5AD6B256KEVM4QBFNT6VVPH5A
X-Message-ID-Hash: FOWO4ZN5AD6B256KEVM4QBFNT6VVPH5A
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>, outreachy@lists.linux.dev, johan@kernel.org, elder@kernel.org, vireshk@kernel.org, thierry.reding@gmail.com, greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, linux-pwm@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 2/3] staging: greybus: use inline function for macros
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/FOWO4ZN5AD6B256KEVM4QBFNT6VVPH5A/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 21, 2023 at 05:35:54PM +0100, Julia Lawall wrote:
>=20
>=20
> On Tue, 21 Mar 2023, Uwe Kleine-K=F6nig wrote:
>=20
> > On Tue, Mar 21, 2023 at 04:59:49PM +0100, Julia Lawall wrote:
> > >
> > >
> > > On Tue, 21 Mar 2023, Uwe Kleine-K=F6nig wrote:
> > >
> > > > Hello,
> > > >
> > > > just some nitpicks:
> > > >
> > > > On Tue, Mar 21, 2023 at 01:04:33AM +0200, Menna Mahmoud wrote:
> > > > > Convert `to_gbphy_dev` and `to_gbphy_driver` macros into a
> > > > > static inline function.
> > > > >
> > > > > it is not great to have macro that use `container_of` macro,
> > > >
> > > > s/it/It/; s/macro/macros/; s/use/use the/;
> > > >
> > > > > because from looking at the definition one cannot tell what type
> > > > > it applies to.
> > > > > [...]
> > > > > -#define to_gbphy_dev(d) container_of(d, struct gbphy_device, dev)
> > > > > +static inline struct gbphy_device *to_gbphy_dev(const struct dev=
ice *d)
> > > >
> > > > drivers/staging/greybus/gbphy.c always passes a variable named
> > > > "dev" to this macro. So I'd call the parameter "dev", too, instead =
of
> > > > "d". This is also a more typical name for variables of that type.
> > >
> > > I argued against that.  Because then there are two uses of dev
> > > in the argument of container_of, and they refer to completely differe=
nt
> > > things.  It's true that by the way container_of works, it's fine, but=
 it
> > > may be misleading.
> >
> > Hmm, that seems to be subjective, but I have less problems with that
> > than with using "d" for a struct device (or a struct device_driver).
> > I'd even go so far as to consider it nice if they are identical.
> >
> > Maybe that's because having the first and third argument identical is
> > quite common:
> >
> > 	$ git grep -P 'container_of\((?<ident>[A-Za-z_0-9-]*)\s*,[^,]*,\s*\g{i=
dent}\s*\)' | wc -l
> > 	5940
> >
> > which is >44% of all the usages
> >
> > 	$ git grep -P 'container_of\((?<ident>[A-Za-z_0-9-]*)\s*,[^,]*,\s*(?&i=
dent)\s*\)' | wc -l
> > 	13362
>=20
> OK, if people like that, then why not.  But it's dangerous if the call to
> container_of is in a macro, rather than in a function.

It's not "dangerous" at all, as the macro will enforce type-safety, you
can't get it wrong when using it.

Ideally this is best as a macro as it's just doing pointer math, worst
case, the compiler turns a function like this into a real function and
you have a call/subtract/return for every time you make this call.

So this conversion to functions feels odd to me, as you potentially are
making all of this worse overall.

Wait until people realize that when we eventually turn these into
container_of_const() you HAVE to go back to using it as a macro instead
of in a function call wrapper like this...

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
