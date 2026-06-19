Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OPLcHdjHNGpdgwYAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Fri, 19 Jun 2026 06:38:48 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3F76A3CD8
	for <lists+greybus-dev@lfdr.de>; Fri, 19 Jun 2026 06:38:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=linuxfoundation.org header.s=korg header.b=jiP29UFR;
	spf=pass (mail.lfdr.de: domain of "greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org" designates 44.210.186.118 as permitted sender) smtp.mailfrom="greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=linuxfoundation.org (policy=none)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 9D11140ABE
	for <lists+greybus-dev@lfdr.de>; Fri, 19 Jun 2026 04:38:46 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by lists.linaro.org (Postfix) with ESMTPS id 7707240A96
	for <greybus-dev@lists.linaro.org>; Fri, 19 Jun 2026 04:38:42 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EC151601E1;
	Fri, 19 Jun 2026 04:38:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 019501F000E9;
	Fri, 19 Jun 2026 04:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1781843921;
	bh=zCFQ+eDfHboVvZeFT2xZ8r0MnvPiiPD1gM/pDQCSrRs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jiP29UFR7GTsNluNwzmx2Bb7onwHPvUYc7/KBcQ7T2TYrWmpU68aoi35u0WRgeNn2
	 mNvjkQflA1kbJc15PvVAG7gyMdkW4jMzq8qMnhnDHygpqJmAwnGFtL52vFQXyCMLyR
	 v7E1E+SOzhsTf1O1jvd5fv6dt7xlS8F1USe3imBE=
Date: Fri, 19 Jun 2026 06:37:35 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Maoyi Xie <maoyixie.tju@gmail.com>
Message-ID: <2026061910-supply-jersey-bb24@gregkh>
References: <178183657058.3862365.12892304946786698397@maoyixie.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <178183657058.3862365.12892304946786698397@maoyixie.com>
X-Spamd-Bar: /
Message-ID-Hash: MFKE43T3FUAY6FYR63N2Y3KZ73LVCWEW
X-Message-ID-Hash: MFKE43T3FUAY6FYR63N2Y3KZ73LVCWEW
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: staging: greybus: audio: possible out of bounds read in the topology parser
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/MFKE43T3FUAY6FYR63N2Y3KZ73LVCWEW/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: add header
X-Spamd-Result: default: False [6.59 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[linuxfoundation.org:s=korg];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	DMARC_POLICY_SOFTFAIL(0.10)[linuxfoundation.org : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:maoyixie.tju@gmail.com,m:johan@kernel.org,m:elder@kernel.org,m:greybus-dev@lists.linaro.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:maoyixietju@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[gregkh@linuxfoundation.org,greybus-dev-bounces@lists.linaro.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,greybus-dev-bounces@lists.linaro.org];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DKIM_TRACE(0.00)[linuxfoundation.org:-];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linaro.org:helo,lists.linaro.org:rdns,lists.linaro.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EA3F76A3CD8
X-Spam: Yes

On Fri, Jun 19, 2026 at 10:36:10AM +0800, Maoyi Xie wrote:
> Hi all,
> 
> I think the Greybus audio topology parser in
> drivers/staging/greybus/audio_topology.c can read past the topology blob
> when a module reports inconsistent counts.

The kernel trusts the hardware, and the drivers have never been reviewed
or audited for if the hardware does not report the correct data.  I'm
sure there are lots of code paths that are buggy if the hardware starts
to do odd things.  If this is a threat model you worry about, and wish
to address, wonderful, there should be lots of code to change :)

But for now, Linux assumes that the hardware is trustworthy once a
driver is bound to a device.

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
