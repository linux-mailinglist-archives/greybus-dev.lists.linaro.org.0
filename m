Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E00CB076C4
	for <lists+greybus-dev@lfdr.de>; Wed, 16 Jul 2025 15:20:24 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id BAA4C45759
	for <lists+greybus-dev@lfdr.de>; Wed, 16 Jul 2025 13:20:23 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by lists.linaro.org (Postfix) with ESMTPS id 5D79744AA2
	for <greybus-dev@lists.linaro.org>; Wed, 16 Jul 2025 13:20:20 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=2A+4VlVM;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 172.234.252.31 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C5CBD43F66;
	Wed, 16 Jul 2025 13:20:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55D15C4CEF0;
	Wed, 16 Jul 2025 13:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1752672019;
	bh=DTtA1e73pK5YvYw6cEcPxn73u1AvhrWuciWj2jpkaOI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=2A+4VlVMrRMQyNIHfN7+ewP5vB4iefES5I953EUAy5FufPi/LvT49aaIT8z0lzFh7
	 fchve6zI7ddeM0d4ZaDQELybD32aIRWoPu5VSC8kZRU/1AheJsEJcCn8oubzgTmOTi
	 NFQHeFqn9suvJzBdNpKBNbyNQE785vwW9Q+7vwgU=
Date: Wed, 16 Jul 2025 15:20:17 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Damien =?iso-8859-1?Q?Ri=E9gel?= <damien.riegel@silabs.com>
Message-ID: <2025071604-plus-spoiled-3d39@gregkh>
References: <20250705004036.3828-1-damien.riegel@silabs.com>
 <20250705004036.3828-2-damien.riegel@silabs.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250705004036.3828-2-damien.riegel@silabs.com>
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 5D79744AA2
X-Spamd-Bar: /
X-Spamd-Result: default: False [0.50 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.252.31];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DWL_DNSWL_NONE(0.00)[linuxfoundation.org:dkim];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DNSWL_BLOCKED(0.00)[172.234.252.31:from];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+]
X-Rspamd-Action: no action
Message-ID-Hash: TABV2F27JIGEHYQHZGHBMB364KEMVSNK
X-Message-ID-Hash: TABV2F27JIGEHYQHZGHBMB364KEMVSNK
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org, linux-devel@silabs.com, Alex Elder <elder@kernel.org>, Johan Hovold <johan@kernel.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [RFC 1/6] greybus: move host controller drivers comment in Makefile
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/TABV2F27JIGEHYQHZGHBMB364KEMVSNK/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 04, 2025 at 08:40:31PM -0400, Damien Ri=E9gel wrote:
> gb-beagleplay is also a Greybus host controller driver, so move comment
> accordingly.
>=20
> Signed-off-by: Damien Ri=E9gel <damien.riegel@silabs.com>
> ---
>  drivers/greybus/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/greybus/Makefile b/drivers/greybus/Makefile
> index d986e94f889..c3564ad151f 100644
> --- a/drivers/greybus/Makefile
> +++ b/drivers/greybus/Makefile
> @@ -18,9 +18,9 @@ obj-$(CONFIG_GREYBUS)		+=3D greybus.o
>  # needed for trace events
>  ccflags-y +=3D -I$(src)
> =20
> +# Greybus Host controller drivers
>  obj-$(CONFIG_GREYBUS_BEAGLEPLAY)	+=3D gb-beagleplay.o
> =20

The blank line should be dropped here too, right?

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
