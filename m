Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id F134993472C
	for <lists+greybus-dev@lfdr.de>; Thu, 18 Jul 2024 06:35:16 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 0560F4123F
	for <lists+greybus-dev@lfdr.de>; Thu, 18 Jul 2024 04:35:16 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	by lists.linaro.org (Postfix) with ESMTPS id 0EFD940D54
	for <greybus-dev@lists.linaro.org>; Thu, 18 Jul 2024 04:35:13 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=LEx7Srw9;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 145.40.73.55 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4AFD9CE12CB;
	Thu, 18 Jul 2024 04:35:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDBE6C116B1;
	Thu, 18 Jul 2024 04:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1721277309;
	bh=+EJ4ixSUyy459vNaFAELty0ievLu6B+c02XoqnGn0ck=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LEx7Srw9oyS8oNa0DeQILSJGudA4Q9HBjqx902NqSKldrqLYUVWdAxO9b+F9Kxo6g
	 CdQJAcFr4wAXEXpP6DBAX2WZJBoO0LxeDup7sxPzpt+k4YkUiQW4HumRBO7wT5At0+
	 NXgVugfF+adj5TAfKV4zwVN6fIHEUZcRArh2P6oY=
Date: Thu, 18 Jul 2024 06:35:06 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Juan =?iso-8859-1?Q?Jos=E9?= Arboleda <soyjuanarbol@gmail.com>
Message-ID: <2024071822-silver-sandblast-754f@gregkh>
References: <2024071723-nurture-magical-7817@gregkh>
 <20240718033207.333591-1-soyjuanarbol@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240718033207.333591-1-soyjuanarbol@gmail.com>
X-Rspamd-Queue-Id: 0EFD940D54
X-Spamd-Bar: /
X-Spamd-Result: default: False [0.50 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:145.40.73.55];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:54825, ipnet:145.40.73.0/24, country:US];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: GKCQBNADHWY4VA5EMQXYX3CKQTMBF2WJ
X-Message-ID-Hash: GKCQBNADHWY4VA5EMQXYX3CKQTMBF2WJ
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, johan@kernel.org, linux-staging@lists.linux.dev, trivial@kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2] staging: greybus: break multi statement macro into multiple lines
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/GKCQBNADHWY4VA5EMQXYX3CKQTMBF2WJ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 17, 2024 at 10:32:07PM -0500, Juan Jos=E9 Arboleda wrote:
> The macro `gb_loopback_stats_attrs` in the Greybus loopback driver
> contains multiple statements, which should be enclosed in a do-while
> loop to ensure proper execution and adhere to coding standards.
>=20
> The latter is not possible as the macro expansion will create invalid C
> syntax. Theres is not such thing like inner function definition inside a
> global scope do-while in C.
>=20
> This patch nukes the `gb_loopback_stats_attrs` macro to enclose,
> addressing the style error flagged by checkpatch.pl.

The style error here is just wrong, the original code is fine.
Remember, checkpatch provides hints, it isn't always correct, and many
times, like this one, it's completely incorrect.

>=20
> Signed-off-by: Juan Jos=E9 Arboleda <soyjuanarbol@gmail.com>
> ---
> Notes:
>=20
> This new version uses a bit different approach so the commit message
> will be a bit different as well.
>=20
> P.S: Thanks for being that patience and apologies for that false
> positive of building the non-included driver. Now it is tested-built.
>=20
>  drivers/staging/greybus/loopback.c | 29 +++++++++++++++++++----------
>  1 file changed, 19 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus=
/loopback.c
> index 4313d3bbc23a..88d86b084f28 100644
> --- a/drivers/staging/greybus/loopback.c
> +++ b/drivers/staging/greybus/loopback.c
> @@ -162,11 +162,6 @@ static ssize_t name##_avg_show(struct device *dev,		\
>  }									\
>  static DEVICE_ATTR_RO(name##_avg)
> =20
> -#define gb_loopback_stats_attrs(field)				\
> -	gb_loopback_ro_stats_attr(field, min, u);		\
> -	gb_loopback_ro_stats_attr(field, max, u);		\
> -	gb_loopback_ro_avg_attr(field)
> -
>  #define gb_loopback_attr(field, type)					\
>  static ssize_t field##_show(struct device *dev,				\
>  			    struct device_attribute *attr,		\
> @@ -268,15 +263,29 @@ static void gb_loopback_check_attr(struct gb_loopba=
ck *gb)
>  }
> =20
>  /* Time to send and receive one message */
> -gb_loopback_stats_attrs(latency);
> +gb_loopback_ro_stats_attr(latency, min, u);
> +gb_loopback_ro_stats_attr(latency, max, u);
> +gb_loopback_ro_avg_attr(latency);

Unrolling the macro like this does fix the warning, but at the expense
of more code size and manual work.  We write code first for us to
understand, and second for the compiler.  The original code is just
fine, no need for a change at all.

sorry,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
