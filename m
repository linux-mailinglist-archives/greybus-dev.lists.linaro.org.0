Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Wnz3Lyu5SGoQtAAAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Sat, 04 Jul 2026 09:41:31 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C44A706F89
	for <lists+greybus-dev@lfdr.de>; Sat, 04 Jul 2026 09:41:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=linuxfoundation.org header.s=korg header.b=ASysBSNB;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=linuxfoundation.org (policy=none);
	spf=pass (mail.lfdr.de: domain of "greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org" designates 44.210.186.118 as permitted sender) smtp.mailfrom="greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org"
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 6092F40C9E
	for <lists+greybus-dev@lfdr.de>; Sat,  4 Jul 2026 07:36:12 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by lists.linaro.org (Postfix) with ESMTPS id 2CD4A401F2
	for <greybus-dev@lists.linaro.org>; Sat,  4 Jul 2026 07:36:05 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8995360120;
	Sat,  4 Jul 2026 07:36:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 871BC1F000E9;
	Sat,  4 Jul 2026 07:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783150564;
	bh=2jVfsUYzFjSV3nE6hbOu4X8mbvMXwhjiogCh2exy6oA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ASysBSNBRr83vpo4GRLjn55R/ODIjioIN5GeMcRva2w5dcgBX9axCP6RqTROPivFz
	 qHCBcRcFlhnXVklQueAFv8OEDVGSxMrOELxa0XpGeYcm6ILb+rwF36V6v6ocG/+DRe
	 f98IB5x/YDO8+pM0HHtLTIS18z4E+FV5bVIiTo9M=
Date: Sat, 4 Jul 2026 09:34:47 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: adi25charis@gmail.com
Message-ID: <2026070430-exclude-improve-f318@gregkh>
References: <20260704071926.6606-1-adi25charis@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260704071926.6606-1-adi25charis@gmail.com>
X-Spamd-Bar: /
Message-ID-Hash: 4KVQS3RBAVGTE2ATMZIWUYYWJ6BL72SR
X-Message-ID-Hash: 4KVQS3RBAVGTE2ATMZIWUYYWJ6BL72SR
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: vireshk@kernel.org, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: bootrom: power off module on timeout
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/4KVQS3RBAVGTE2ATMZIWUYYWJ6BL72SR/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [5.09 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	R_DKIM_REJECT(1.00)[linuxfoundation.org:s=korg];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	DMARC_POLICY_SOFTFAIL(0.10)[linuxfoundation.org : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:adi25charis@gmail.com,m:vireshk@kernel.org,m:johan@kernel.org,m:elder@kernel.org,m:greybus-dev@lists.linaro.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,body];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[gregkh@linuxfoundation.org,greybus-dev-bounces@lists.linaro.org];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,greybus-dev-bounces@lists.linaro.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:-];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[greybus-dev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,linuxfoundation.org:from_mime,lists.linaro.org:from_smtp,lists.linaro.org:helo,lists.linaro.org:rdns,gregkh:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4C44A706F89

On Sat, Jul 04, 2026 at 12:49:26PM +0530, adi25charis@gmail.com wrote:
> From: Aditya Chari S <adi25charis@gmail.com>
> 
> Previously, when a firmware size request, get firmware request, or
> ready-to-boot request from a module timed out, the driver would log
> an error and free any firmware buffer, but left the module powered
> on in a potentially inconsistent state.
> 
> Fix this by ejecting the module's interface via the SVC when a
> timeout occurs, forcing it to be power-cycled and re-detected rather
> than left in limbo.
> 
> Signed-off-by: Aditya Chari S <adi25charis@gmail.com>
> ---
>  drivers/staging/greybus/bootrom.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)

Cool, but how was this tested?  What hardware needs this?

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
