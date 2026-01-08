Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 09BA5D02568
	for <lists+greybus-dev@lfdr.de>; Thu, 08 Jan 2026 12:17:26 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 0123D40164
	for <lists+greybus-dev@lfdr.de>; Thu,  8 Jan 2026 11:17:25 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by lists.linaro.org (Postfix) with ESMTPS id EA2143F80E
	for <greybus-dev@lists.linaro.org>; Thu,  8 Jan 2026 11:17:22 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=Bjwc2oVj;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 172.234.252.31 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5311140DD4;
	Thu,  8 Jan 2026 11:17:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82FAFC116C6;
	Thu,  8 Jan 2026 11:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1767871042;
	bh=8HmUY6jU1/tE0JqNSMsK4tHgMTYr3KfrhOzzyfGYcPI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bjwc2oVjojoN76nHdHUnXexW2yKCXvwiceNeK6vqlyp+9Wge8FtwXT1ZBTX9s0VZB
	 VdBBwNrCy/49NfA8OWtGnTwfagidS9mOb/SIq8IgeB5KcMYsgn4RTUS1AuNnOjU3U/
	 XQ0QqIqDWc1mGHcDEAhamvXbPRCfv0pkxaI6Xhww=
Date: Thu, 8 Jan 2026 12:17:18 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Chaitanya Mishra <chaitanyamishra.ai@gmail.com>
Message-ID: <2026010824-debtless-junior-4d18@gregkh>
References: <20260108104947.23767-1-chaitanyamishra.ai@gmail.com>
 <20260108110351.27771-1-chaitanyamishra.ai@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260108110351.27771-1-chaitanyamishra.ai@gmail.com>
X-Rspamd-Queue-Id: EA2143F80E
X-Spamd-Bar: /
X-Spamd-Result: default: False [0.50 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.252.31];
	MIME_GOOD(-0.10)[text/plain];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DNSWL_BLOCKED(0.00)[100.75.92.58:received];
	DWL_DNSWL_NONE(0.00)[linuxfoundation.org:dkim];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[linuxfoundation.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: S5EVKTFIPFWEY3FEJNMBLVBQV7IFHUET
X-Message-ID-Hash: S5EVKTFIPFWEY3FEJNMBLVBQV7IFHUET
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2] staging: greybus: lights: avoid NULL deref
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/S5EVKTFIPFWEY3FEJNMBLVBQV7IFHUET/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jan 08, 2026 at 04:33:51PM +0530, Chaitanya Mishra wrote:
> Hi Greg,
> 
> Found by manual code review while walking the error paths in
> Gb_lights_light_config(): channels_count is set before channels
> allocation, but cleanup uses channels_count to iterate and dereference
> light->channels. If kcalloc() fails, that becomes a NULL deref.

Might I ask why are you manually reviewing the error code paths of this
driver?  Do you have this hardware somewhere?

> Fix is simply deferring channels_count publication until after the
> allocation succeeds; v2 includes the requested comment.
> 
> Tested with:
>   ./scripts/checkpatch.pl --strict -g HEAD
>   ./scripts/checkpatch.pl outgoing/0001-staging-greybus-lights-avoid-NULL-deref.patch
> 
> I couldn't build-test locally on macOS due to missing <elf.h> for
> kernel host tools.

For obvious reasons, sending out patches that you didn't even build test
is probably not a good idea :)

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
