Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id E325BB076C9
	for <lists+greybus-dev@lfdr.de>; Wed, 16 Jul 2025 15:21:59 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 109B8459AA
	for <lists+greybus-dev@lfdr.de>; Wed, 16 Jul 2025 13:21:59 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	by lists.linaro.org (Postfix) with ESMTPS id 78368444B7
	for <greybus-dev@lists.linaro.org>; Wed, 16 Jul 2025 13:21:55 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=c0Al1cZu;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 147.75.193.91 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3A99FA57317;
	Wed, 16 Jul 2025 13:21:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BFE2C4CEF0;
	Wed, 16 Jul 2025 13:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1752672114;
	bh=I9mhJvZjmMLRfJhLtW+djnXSuVofN+f8i7sojOsj1w8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c0Al1cZu0E0E9IkwW/bcHr0VmaMg6wJbWS+eFOMNrLIWt2AURvkaM1EUmFEsfhRav
	 +Qccc54LJ9YpJrtA+EmKBUGaq+u2QG4yt5be7IOv6UeQByOe4IrrgyEae9D4si2wJx
	 8JNBvfXaGNR5DcZwTGNUMjRWKRSLQ4gzH5sHhAJI=
Date: Wed, 16 Jul 2025 15:21:52 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Damien =?iso-8859-1?Q?Ri=E9gel?= <damien.riegel@silabs.com>
Message-ID: <2025071626-doorknob-coastline-b85c@gregkh>
References: <20250705004036.3828-1-damien.riegel@silabs.com>
 <20250705004036.3828-5-damien.riegel@silabs.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250705004036.3828-5-damien.riegel@silabs.com>
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 78368444B7
X-Spamd-Bar: /
X-Spamd-Result: default: False [0.50 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:147.75.193.91];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	DWL_DNSWL_NONE(0.00)[linuxfoundation.org:dkim];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:15830, ipnet:147.75.193.0/24, country:NL];
	DNSWL_BLOCKED(0.00)[147.75.193.91:from];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	URIBL_BLOCKED(0.00)[silabs.com:email,linuxfoundation.org:dkim,nyc.source.kernel.org:rdns,nyc.source.kernel.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[linuxfoundation.org:+]
X-Rspamd-Action: no action
Message-ID-Hash: AGBPFWRO6EI2ODR33CSN45U27SSVH4DI
X-Message-ID-Hash: AGBPFWRO6EI2ODR33CSN45U27SSVH4DI
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org, linux-devel@silabs.com, Alex Elder <elder@kernel.org>, Johan Hovold <johan@kernel.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [RFC 4/6] greybus: add API for async unidirectional transfer
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/AGBPFWRO6EI2ODR33CSN45U27SSVH4DI/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 04, 2025 at 08:40:34PM -0400, Damien Ri=E9gel wrote:
> This adds a helper function for unidirectional asynchronous transfer.
> This is just for convenience as some drivers do these steps manually,
> like the loopback driver in gb_loopback_async_operation().
>=20
> Signed-off-by: Damien Ri=E9gel <damien.riegel@silabs.com>
> ---
>  drivers/greybus/operation.c       | 52 +++++++++++++++++++++++++++++++
>  include/linux/greybus/operation.h |  4 +++
>  2 files changed, 56 insertions(+)

Shouldn't you conver the loopback driver over to use this, so it's not
just increasing the overall code size, and we can see how it will be
used?

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
