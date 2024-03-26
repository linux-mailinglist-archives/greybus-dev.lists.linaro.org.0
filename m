Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 1122188BC3E
	for <lists+greybus-dev@lfdr.de>; Tue, 26 Mar 2024 09:27:43 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1CE2643C39
	for <lists+greybus-dev@lfdr.de>; Tue, 26 Mar 2024 08:27:42 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	by lists.linaro.org (Postfix) with ESMTPS id 7EC643F376
	for <greybus-dev@lists.linaro.org>; Tue, 26 Mar 2024 08:27:39 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=hpDkKnWy;
	dmarc=pass (policy=none) header.from=linuxfoundation.org;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 145.40.73.55 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 2087ACE19AD;
	Tue, 26 Mar 2024 08:27:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 016F6C433F1;
	Tue, 26 Mar 2024 08:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1711441656;
	bh=w3Ty/YsSsNO3tEjCDtWhwWTUWzygmh5DpLVUk+4giVo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hpDkKnWy8TKoFcQbbYbw88m3t/rILt1NmR+mX6Lw+Q9ok4Ik83Dxd38RE8D89E4RB
	 kMuxPatXYjrW9J6tSPJ4swR+ISqZAvKUBc0rDQ2Ob7ilmceqKxdAlbbBDrWv+yJ6QO
	 7tEHRcnzPk4DLYpQpRPqb3SkP/swvHEk3mb2E6YQ=
Date: Tue, 26 Mar 2024 09:27:20 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Rui Miguel Silva <rmfrfs@gmail.com>
Message-ID: <2024032611-gallery-semicolon-2951@gregkh>
References: <20240325221549.2185265-1-rmfrfs@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240325221549.2185265-1-rmfrfs@gmail.com>
X-Rspamd-Queue-Id: 7EC643F376
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-3.50 / 15.00];
	REPLY(-4.00)[];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:145.40.73.55];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MIME_GOOD(-0.10)[text/plain];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:54825, ipnet:145.40.73.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[linuxfoundation.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: 453F6NVTLOOI6Y44XCYGOCI672SCKU6M
X-Message-ID-Hash: 453F6NVTLOOI6Y44XCYGOCI672SCKU6M
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, Mikhail Lobanov <m.lobanov@rosalinux.ru>, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2] greybus: lights: check return of get_channel_from_mode
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/453F6NVTLOOI6Y44XCYGOCI672SCKU6M/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Mar 25, 2024 at 10:09:55PM +0000, Rui Miguel Silva wrote:
> If channel for the given node is not found we return null from
> get_channel_from_mode. Make sure we validate the return pointer
> before using it in two of the missing places.
> 
> This was originally reported in [0]:
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> [0] https://lore.kernel.org/all/20240301190425.120605-1-m.lobanov@rosalinux.ru
> 
> Fixes: 2870b52bae4c ("greybus: lights: add lights implementation")
> Reported-by: Mikhail Lobanov <m.lobanov@rosalinux.ru>
> Suggested-by: Mikhail Lobanov <m.lobanov@rosalinux.ru>
> Suggested-by: Alex Elder <elder@ieee.org>
> Signed-off-by: Rui Miguel Silva <rmfrfs@gmail.com>
> ---
> v1[1] -> v2:
> GregKh:
>     - remove overkill WARN_ON and replace it for a dev_err

Thanks for the quick change, now queued up.

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
