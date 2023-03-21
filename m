Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 751286C3705
	for <lists+greybus-dev@lfdr.de>; Tue, 21 Mar 2023 17:36:02 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 7CBAB3EBA6
	for <lists+greybus-dev@lfdr.de>; Tue, 21 Mar 2023 16:36:01 +0000 (UTC)
Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	by lists.linaro.org (Postfix) with ESMTPS id 3F9E23EBA6
	for <greybus-dev@lists.linaro.org>; Tue, 21 Mar 2023 16:35:55 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=inria.fr header.s=dc header.b=QtQyHPr1;
	spf=pass (lists.linaro.org: domain of julia.lawall@inria.fr designates 192.134.164.83 as permitted sender) smtp.mailfrom=julia.lawall@inria.fr;
	dmarc=pass (policy=none) header.from=inria.fr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=PltMRGGsZfhtJPDUS38hoVLDdEs859D87NRW397FwYM=;
  b=QtQyHPr1eQVmpYQ71t7jnWNP4fMdOHEKjdVjsfZk1Ux7/IkSFZmmf4cP
   7xlSy6FOJwB22fAAX7JV18hu0bhtTrAYzUUkfXPeF57EXVVFpcMa08Z4z
   y748Q0HLNKw24X9s2dhp36LwCTTKusPpJoKmK3HFRvdCVQnSocyATO2T2
   A=;
X-IronPort-AV: E=Sophos;i="5.98,279,1673910000";
   d="scan'208";a="98351872"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2023 17:35:54 +0100
Date: Tue, 21 Mar 2023 17:35:54 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
To: =?ISO-8859-15?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230321162629.rjmivzhbdy4pcgii@pengutronix.de>
Message-ID: <9a775966-29d4-12b3-e67d-4327194f972@inria.fr>
References: <cover.1679352669.git.eng.mennamahmoud.mm@gmail.com> <1274302b52ae905dab6f75377d625598facbbdf1.1679352669.git.eng.mennamahmoud.mm@gmail.com> <20230321154728.3r7ut3rl2pccmo2e@pengutronix.de> <82a4e5f1-a1f2-c70-3645-9464ccb17bab@inria.fr>
 <20230321162629.rjmivzhbdy4pcgii@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1503685233-1679416554=:10740"
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 3F9E23EBA6
X-Spamd-Bar: -----
X-Spamd-Result: default: False [-5.50 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	CTYPE_MIXED_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[inria.fr,none];
	R_SPF_ALLOW(-0.20)[+ip4:192.134.164.0/24];
	R_DKIM_ALLOW(-0.20)[inria.fr:s=dc];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	ASN(0.00)[asn:2200, ipnet:192.134.164.0/24, country:FR];
	RCVD_COUNT_ONE(0.00)[1];
	RCVD_TLS_LAST(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[inria.fr:+];
	FREEMAIL_CC(0.00)[gmail.com,linuxfoundation.org,lists.linux.dev,kernel.org,lists.linaro.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	TAGGED_RCPT(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[]
Message-ID-Hash: 5NBLGBBB2EMVCIOBW4IVPLI4ZYKFEPOG
X-Message-ID-Hash: 5NBLGBBB2EMVCIOBW4IVPLI4ZYKFEPOG
X-MailFrom: julia.lawall@inria.fr
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>, outreachy@lists.linux.dev, johan@kernel.org, elder@kernel.org, vireshk@kernel.org, thierry.reding@gmail.com, greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, linux-pwm@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 2/3] staging: greybus: use inline function for macros
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/5NBLGBBB2EMVCIOBW4IVPLI4ZYKFEPOG/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1503685233-1679416554=:10740
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable



On Tue, 21 Mar 2023, Uwe Kleine-K=F6nig wrote:

> On Tue, Mar 21, 2023 at 04:59:49PM +0100, Julia Lawall wrote:
> >
> >
> > On Tue, 21 Mar 2023, Uwe Kleine-K=F6nig wrote:
> >
> > > Hello,
> > >
> > > just some nitpicks:
> > >
> > > On Tue, Mar 21, 2023 at 01:04:33AM +0200, Menna Mahmoud wrote:
> > > > Convert `to_gbphy_dev` and `to_gbphy_driver` macros into a
> > > > static inline function.
> > > >
> > > > it is not great to have macro that use `container_of` macro,
> > >
> > > s/it/It/; s/macro/macros/; s/use/use the/;
> > >
> > > > because from looking at the definition one cannot tell what type
> > > > it applies to.
> > > > [...]
> > > > -#define to_gbphy_dev(d) container_of(d, struct gbphy_device, dev)
> > > > +static inline struct gbphy_device *to_gbphy_dev(const struct devic=
e *d)
> > >
> > > drivers/staging/greybus/gbphy.c always passes a variable named
> > > "dev" to this macro. So I'd call the parameter "dev", too, instead of
> > > "d". This is also a more typical name for variables of that type.
> >
> > I argued against that.  Because then there are two uses of dev
> > in the argument of container_of, and they refer to completely different
> > things.  It's true that by the way container_of works, it's fine, but it
> > may be misleading.
>
> Hmm, that seems to be subjective, but I have less problems with that
> than with using "d" for a struct device (or a struct device_driver).
> I'd even go so far as to consider it nice if they are identical.
>
> Maybe that's because having the first and third argument identical is
> quite common:
>
> 	$ git grep -P 'container_of\((?<ident>[A-Za-z_0-9-]*)\s*,[^,]*,\s*\g{ide=
nt}\s*\)' | wc -l
> 	5940
>
> which is >44% of all the usages
>
> 	$ git grep -P 'container_of\((?<ident>[A-Za-z_0-9-]*)\s*,[^,]*,\s*(?&ide=
nt)\s*\)' | wc -l
> 	13362

OK, if people like that, then why not.  But it's dangerous if the call to
container_of is in a macro, rather than in a function.

julia
--8323329-1503685233-1679416554=:10740
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

--8323329-1503685233-1679416554=:10740--
