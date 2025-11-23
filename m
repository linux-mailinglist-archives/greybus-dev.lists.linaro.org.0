Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id C1963C7DC0D
	for <lists+greybus-dev@lfdr.de>; Sun, 23 Nov 2025 07:21:38 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1982F3F815
	for <lists+greybus-dev@lfdr.de>; Sun, 23 Nov 2025 06:21:33 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by lists.linaro.org (Postfix) with ESMTPS id 889AC3F807
	for <greybus-dev@lists.linaro.org>; Sun, 23 Nov 2025 06:21:24 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=tUAQGagd;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 172.105.4.254 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1C59260154;
	Sun, 23 Nov 2025 06:21:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B4D6C116B1;
	Sun, 23 Nov 2025 06:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1763878883;
	bh=UddJElgBhS951bwKyOfoL+HcvT6Jhhot1LM8UHHiZkw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tUAQGagdPcJPlerRExnFaT9KRIOGzHtNSEHK/qnjqRrcJA1ohHkortwv6FX0GT1gw
	 NFD0XI9xwvUuWJ4s3iGhH9GoDJuUVKDXTomjZcE5s4+f4V3ETkP2kyV20mNNn+EWFe
	 YCvf7uv6GD3wLBr7zCHu5uQmSZATgxFgIrcUaSZc=
Date: Sun, 23 Nov 2025 07:21:19 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Dharanitharan R <dharanitharan725@gmail.com>
Message-ID: <2025112307-many-visibly-a7fd@gregkh>
References: <20251123054527.10163-1-dharanitharan725@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251123054527.10163-1-dharanitharan725@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.50 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.4.254];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MIME_GOOD(-0.10)[text/plain];
	DNSWL_BLOCKED(0.00)[100.75.92.58:received];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DWL_DNSWL_BLOCKED(0.00)[linuxfoundation.org:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[linuxfoundation.org:+]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 889AC3F807
X-Spamd-Bar: /
Message-ID-Hash: X3HHENOTTWBLSY22VNKCKVFVTGGBZ6WV
X-Message-ID-Hash: X3HHENOTTWBLSY22VNKCKVFVTGGBZ6WV
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v4] Replace all strncpy() calls with strscpy() and fix indentation issues.
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/X3HHENOTTWBLSY22VNKCKVFVTGGBZ6WV/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Nov 23, 2025 at 05:45:27AM +0000, Dharanitharan R wrote:
> The firmware_tag string comes from userspace and may not be NUL
> terminated. strlcpy() performs strlen() on the source buffer, which can
> read past the end and potentially cause an Oops.

There is no "oops" in userspace.

> strscpy() avoids this
> and guarantees NUL termination without overflowing the destination.

"NULL"

Also, what happened to the subject line prefix?

And finally, when you say "and", that means you should have multiple
patches, do not do different things in the same patch, this should be 2.
You also do not mention the coding style change in the body of the
changlog :(

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
