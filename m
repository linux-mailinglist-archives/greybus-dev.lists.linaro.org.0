Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id E37B2CC7B64
	for <lists+greybus-dev@lfdr.de>; Wed, 17 Dec 2025 13:56:59 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id BC3A63F9B5
	for <lists+greybus-dev@lfdr.de>; Wed, 17 Dec 2025 12:56:58 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by lists.linaro.org (Postfix) with ESMTPS id BC7EF3F952
	for <greybus-dev@lists.linaro.org>; Wed, 17 Dec 2025 12:56:55 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=ZVsWWJhF;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 172.105.4.254 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 335E76018E;
	Wed, 17 Dec 2025 12:56:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E4D0C4CEF5;
	Wed, 17 Dec 2025 12:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1765976214;
	bh=SPMVbbG83y/sljnp11jJ5Y7aQtxP1R5i5XEe1vLYmog=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZVsWWJhF9Aj/sxCjeSXcGlU/F5C6s7KrCbdzwHC4mItFySUrhVjBA2u7IcgFRBNnC
	 gM4A69C8oVO8n/b5juDoOijGeN+aZxnsneBpkURo0CmtHfq3V1DFVNVo1sczqp11VL
	 Qs9ykx1iMCC/9jH1Dof+flVHaiPflbjqbJifnoQE=
Date: Wed, 17 Dec 2025 13:56:51 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Sammy Malik <sammy@parkour.is>
Message-ID: <2025121732-brook-widely-dfc7@gregkh>
References: <20251129104407.145907-1-sammy@parkour.is>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251129104407.145907-1-sammy@parkour.is>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.66 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	BAYES_HAM(-2.84)[99.32%];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.4.254];
	MIME_GOOD(-0.10)[text/plain];
	MISSING_XM_UA(0.00)[];
	ARC_NA(0.00)[];
	BLOCKLISTDE_FAIL(0.00)[172.105.4.254:server fail,100.75.92.58:server fail];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	URIBL_BLOCKED(0.00)[gregkh:mid,linuxfoundation.org:dkim,linuxfoundation.org:from_smtp,linuxfoundation.org:from_mime,tor.source.kernel.org:rdns,tor.source.kernel.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: BC7EF3F952
X-Spamd-Bar: /
Message-ID-Hash: UBJFTKRXMYQI6MS3U5HADHLXOQVT4O7F
X-Message-ID-Hash: UBJFTKRXMYQI6MS3U5HADHLXOQVT4O7F
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: Remove completed PWN TODO item.
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/UBJFTKRXMYQI6MS3U5HADHLXOQVT4O7F/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Nov 29, 2025 at 10:44:36AM +0000, Sammy Malik wrote:
> The pwm.c driver already uses pwn_ops::apply. This item was completed
> but never removed.

What commit id fixed this up?  Please show that here in the changelog
text.

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
