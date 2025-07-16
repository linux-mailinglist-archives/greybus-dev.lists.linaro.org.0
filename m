Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id DCCC9B076D1
	for <lists+greybus-dev@lfdr.de>; Wed, 16 Jul 2025 15:23:52 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 080FE44B11
	for <lists+greybus-dev@lfdr.de>; Wed, 16 Jul 2025 13:23:52 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	by lists.linaro.org (Postfix) with ESMTPS id 6308A444B7
	for <greybus-dev@lists.linaro.org>; Wed, 16 Jul 2025 13:23:48 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=wGtIGk6n;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 147.75.193.91 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 39E98A4B9E4;
	Wed, 16 Jul 2025 13:23:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CDFFC4CEF4;
	Wed, 16 Jul 2025 13:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1752672227;
	bh=y4uHY0nhoT4ms+izjjab0IZOtoJ6ED45m1o373tDFXk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wGtIGk6n/XemCQ1odlP0xrP/8LByNUk5rA8auewYaSdebDKyvN0Sn0Y3aRR5OAr1E
	 c1n2E8xGA7sV3sx3GzRqoOcCxSnkMtMlWI6JXF6xjD0HGKnH+/51ItO58ZYRu1yQ/Z
	 PQFYNmNiAtyGSfcvdOJORjmKQf0XjpNwWY6PmwFg=
Date: Wed, 16 Jul 2025 15:23:45 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Damien =?iso-8859-1?Q?Ri=E9gel?= <damien.riegel@silabs.com>
Message-ID: <2025071617-plant-daytime-582a@gregkh>
References: <20250705004036.3828-1-damien.riegel@silabs.com>
 <20250705004036.3828-7-damien.riegel@silabs.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250705004036.3828-7-damien.riegel@silabs.com>
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 6308A444B7
X-Spamd-Bar: /
X-Spamd-Result: default: False [0.52 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	BAYES_HAM(-2.98)[99.91%];
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
	URIBL_BLOCKED(0.00)[linuxfoundation.org:dkim,nyc.source.kernel.org:rdns,nyc.source.kernel.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[linuxfoundation.org:+]
X-Rspamd-Action: no action
Message-ID-Hash: QLCS4MPCYBJR3OTL6EKEF7UAA63TN2CJ
X-Message-ID-Hash: QLCS4MPCYBJR3OTL6EKEF7UAA63TN2CJ
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org, linux-devel@silabs.com, Alex Elder <elder@kernel.org>, Johan Hovold <johan@kernel.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [RFC 6/6] greybus: add class driver for Silabs Bluetooth
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/QLCS4MPCYBJR3OTL6EKEF7UAA63TN2CJ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 04, 2025 at 08:40:36PM -0400, Damien Ri=E9gel wrote:
> +#include <linux/greybus.h>
> +#include <linux/skbuff.h>
> +#include <net/bluetooth/bluetooth.h>
> +#include <net/bluetooth/hci_core.h>
> +
> +#define GREYBUS_VENDOR_SILABS	0xBEEF
> +#define GREYBUS_PRODUCT_EFX	0xCAFE

Nice vendor ids :)

We really should make a file for all of the current ones, to keep track
of them.  At the least, the vendor ids should be made unique.

Overall this looks very good, a clean and small driver.  Would you have
other ones for this type of transport layer?

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
