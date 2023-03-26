Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2626C92B2
	for <lists+greybus-dev@lfdr.de>; Sun, 26 Mar 2023 07:52:16 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 519A044233
	for <lists+greybus-dev@lfdr.de>; Sun, 26 Mar 2023 05:52:15 +0000 (UTC)
Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	by lists.linaro.org (Postfix) with ESMTPS id 574103E952
	for <greybus-dev@lists.linaro.org>; Sun, 26 Mar 2023 05:52:11 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=inria.fr header.s=dc header.b=QP12dvnz;
	spf=pass (lists.linaro.org: domain of julia.lawall@inria.fr designates 192.134.164.104 as permitted sender) smtp.mailfrom=julia.lawall@inria.fr;
	dmarc=pass (policy=none) header.from=inria.fr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=1dlb05qC1Np6VuLvDRnihXwqBP9eENNSLwWKReaC1EU=;
  b=QP12dvnzbU3TrxmksXnvsOEAUtebWmf66ldEk0EGiGuYMIBls/c7qdkc
   MyxwtXF2H3FyY/bogDxNlUpoGDp1p1iVIUb0A0DH4XzatlidDBkgOgT5j
   qMt43dIsvGh/r8J7akMT2AkI7CATJXq4OoMXo/JxK+c54BavMf0awjyoG
   Q=;
X-IronPort-AV: E=Sophos;i="5.98,292,1673910000";
   d="scan'208";a="51262119"
Received: from 231.85.89.92.rev.sfr.net (HELO hadrien) ([92.89.85.231])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2023 07:51:52 +0200
Date: Sun, 26 Mar 2023 07:51:50 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Sumitra Sharma <sumitraartsy@gmail.com>
In-Reply-To: <20230326052420.GA179105@sumitra.com>
Message-ID: <alpine.DEB.2.22.394.2303260751290.3294@hadrien>
References: <cover.1679732179.git.sumitraartsy@gmail.com> <f1ef1b643840e74f211264dda0c590f8458618f6.1679732179.git.sumitraartsy@gmail.com> <ZB63EVLK6/29UUi0@kroah.com> <20230326052420.GA179105@sumitra.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 574103E952
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-3.60 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[inria.fr,none];
	R_DKIM_ALLOW(-0.20)[inria.fr:s=dc];
	R_SPF_ALLOW(-0.20)[+ip4:192.134.164.0/24];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[192.134.164.104:from];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:2200, ipnet:192.134.164.0/24, country:FR];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_ONE(0.00)[1];
	DKIM_TRACE(0.00)[inria.fr:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	ARC_NA(0.00)[]
Message-ID-Hash: JINDOXF22Z3XTUL67J5W2W3XDNPYJCMU
X-Message-ID-Hash: JINDOXF22Z3XTUL67J5W2W3XDNPYJCMU
X-MailFrom: julia.lawall@inria.fr
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: outreachy@lists.linux.dev, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v3 3/3] staging: greybus: Inline pwm_chip_to_gb_pwm_chip()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/JINDOXF22Z3XTUL67J5W2W3XDNPYJCMU/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On Sat, 25 Mar 2023, Sumitra Sharma wrote:

> On Sat, Mar 25, 2023 at 09:55:45AM +0100, Greg KH wrote:
> > On Sat, Mar 25, 2023 at 01:31:10AM -0700, Sumitra Sharma wrote:
> > > Convert 'pwm_chip_to_gb_pwm_chip' from a macro to a static
> > > inline function, to make the relevant types apparent in the
> > > definition and to benefit from the type checking performed by
> > > the compiler at call sites.
> > >
> > > Signed-off-by: Sumitra Sharma <sumitraartsy@gmail.com>
> > > ---
> > >  drivers/staging/greybus/pwm.c | 6 ++++--
> > >  1 file changed, 4 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/staging/greybus/pwm.c b/drivers/staging/greybus/pwm.c
> > > index 3fda172239d2..88da1d796f13 100644
> > > --- a/drivers/staging/greybus/pwm.c
> > > +++ b/drivers/staging/greybus/pwm.c
> > > @@ -21,9 +21,11 @@ struct gb_pwm_chip {
> > >  	struct pwm_chip		chip;
> > >  	struct pwm_chip		*pwm;
> > >  };
> > > -#define pwm_chip_to_gb_pwm_chip(chip) \
> > > -	container_of(chip, struct gb_pwm_chip, chip)
> > >
> > > +static inline struct gb_pwm_chip *pwm_chip_to_gb_pwm_chip(struct pwm_chip *chip)
> > > +{
> > > +	return container_of(chip, struct gb_pwm_chip, chip);
> > > +}
> > >
> > >  static int gb_pwm_count_operation(struct gb_pwm_chip *pwmc)
> > >  {
> > > --
> > > 2.25.1
> > >
> > >
> >
> > This patch didn't apply due to changes made in my tree by a patch from
> > someone else before yours.  Can you rebase it and resend?
> >
>
> Hi greg,
>
> I am confused, will that be a totally new patch or a new version(v4 in
> this case)?

New version.

julia

>
> Regards,
>
> Sumitra
>
> > thanks,
> >
> > greg k-h
>
>
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
