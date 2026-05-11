Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2GZwKJGNAWqNdwEAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Mon, 11 May 2026 10:04:33 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F69509C69
	for <lists+greybus-dev@lfdr.de>; Mon, 11 May 2026 10:04:33 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 0D03D3F6C2
	for <lists+greybus-dev@lfdr.de>; Mon, 11 May 2026 08:04:32 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by lists.linaro.org (Postfix) with ESMTPS id 827F33EC66
	for <greybus-dev@lists.linaro.org>; Mon, 11 May 2026 08:04:18 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=RaEFWYgl;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 172.234.252.31 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1572943C45;
	Mon, 11 May 2026 07:53:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CAA0C2BCB0;
	Mon, 11 May 2026 07:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778486006;
	bh=ya5wG++x5DCGhG/9xVyIKPu4rBCIracriqRThSeH0Nw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RaEFWYglcPsMX/jiVJSxX+fBhrZf9wfocTMlGmxUhi7BWGjpzPdFOggzNZE0QT3O5
	 UtpEdSjgDCCx3uIJxXUNcDACy30pkusJmEjVDegU/D7SO3S7WQ8jlllCb+DpgcWW8O
	 7axlQp6EE/XWCMvsUO19ycF/mE9wBc4XSscsMkmo=
Date: Mon, 11 May 2026 09:53:23 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Muhammad Bilal <meatuni001@gmail.com>
Message-ID: <2026051156-hamster-plating-7ae7@gregkh>
References: <20260504233328.7409-1-meatuni001@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260504233328.7409-1-meatuni001@gmail.com>
X-Spamd-Bar: /
Message-ID-Hash: S7KXWT7OV5E4WOGRZLKQX6HYM3IN6GQP
X-Message-ID-Hash: S7KXWT7OV5E4WOGRZLKQX6HYM3IN6GQP
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, vireshk@kernel.org, johan@kernel.org, elder@kernel.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v1] greybus: authentication: validate CAP response payload size
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/S7KXWT7OV5E4WOGRZLKQX6HYM3IN6GQP/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 26F69509C69
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.09 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	R_DKIM_REJECT(1.00)[linuxfoundation.org:s=korg];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	DMARC_POLICY_SOFTFAIL(0.10)[linuxfoundation.org : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-0.961];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,greybus-dev-bounces@lists.linaro.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:-];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linaro.org:helo,lists.linaro.org:rdns]
X-Rspamd-Action: no action

On Mon, May 04, 2026 at 07:33:28PM -0400, Muhammad Bilal wrote:
> cap_get_ims_certificate() and cap_authenticate() copy variable-length
> response data directly into fixed-size UAPI buffers using the
> untrusted op->response->payload_size value without any bounds checks.
> 
> A malicious or compromised Greybus endpoint can return an oversized
> certificate or signature payload, causing a kernel heap overflow.
> 
> Fix both functions by:
>   - Rejecting responses shorter than sizeof(*response) with -EPROTO.
>   - Rejecting payloads exceeding CAP_CERTIFICATE_MAX_SIZE (1600) or
>     CAP_SIGNATURE_MAX_SIZE (320) with -EMSGSIZE.
>   - Copying only the validated size into the UAPI buffer.
> 
> Fixes: e3eda54d0b5f ("greybus: Add Component Authentication Protocol support")
> Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
> ---
>  drivers/staging/greybus/authentication.c | 34 +++++++++++++++++++++---
>  1 file changed, 30 insertions(+), 4 deletions(-)

Was this tested on any real greybus devices?

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
