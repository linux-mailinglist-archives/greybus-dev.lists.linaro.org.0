Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9627583FB
	for <lists+greybus-dev@lfdr.de>; Tue, 18 Jul 2023 20:00:31 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id CB58444138
	for <lists+greybus-dev@lfdr.de>; Tue, 18 Jul 2023 18:00:30 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id 5712744138
	for <greybus-dev@lists.linaro.org>; Tue, 18 Jul 2023 18:00:21 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=P2mCUpvS;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EBB28616A6;
	Tue, 18 Jul 2023 18:00:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01702C433C8;
	Tue, 18 Jul 2023 18:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1689703220;
	bh=8Nc0AmKrxIqr1+QDD400fQ9xkwfGBHpruR2Z8cAV67g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P2mCUpvS/+Wl+2vYFPyuGluo1unmosycKTb0zw++AA5xwPQ7NuNbXcA0ckxey4z/U
	 K1Odv6L0gg2WyH/BKD52aUFVS4Up6NRxEiXkKjoP19U0VC5Uikux+Gx2F5YwBEApHF
	 QTsgQ8OJhcb3Ueh9gV65zoL16MGv4azEznbf3xkE=
Date: Tue, 18 Jul 2023 20:00:17 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <2023071812-craving-droplet-5df7@gregkh>
References: <20230718141304.1032-1-tiwai@suse.de>
 <20230718141304.1032-8-tiwai@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230718141304.1032-8-tiwai@suse.de>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 5712744138
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.00 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:139.178.84.217];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MIME_GOOD(-0.10)[text/plain];
	NEURAL_HAM(-0.00)[-1.000];
	FREEMAIL_CC(0.00)[alsa-project.org,gmail.com,animalcreek.com,kernel.org,lists.linaro.org];
	ASN(0.00)[asn:54825, ipnet:139.178.80.0/21, country:US];
	FROM_EQ_ENVFROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_TLS_ALL(0.00)[];
	URIBL_BLOCKED(0.00)[suse.de:email,dfw.source.kernel.org:helo,dfw.source.kernel.org:rdns];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2]
Message-ID-Hash: HDIBJZGGY6DT4NHOFQSD5VLUJRXK3RNB
X-Message-ID-Hash: HDIBJZGGY6DT4NHOFQSD5VLUJRXK3RNB
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 07/11] staging: greybus: Avoid abusing controls_rwsem
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/HDIBJZGGY6DT4NHOFQSD5VLUJRXK3RNB/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jul 18, 2023 at 04:13:00PM +0200, Takashi Iwai wrote:
> The controls_rwsem of snd_card object is rather an internal lock, and
> not really meant to be used by others for its data protection.
> 
> This patch addresses it by replacing the controls_rwsem usages with
> the own (new) mutex.
> 
> Note that the up_write() and down_write() calls around
> gbaudio_remove_component_controls() are simply dropped without
> replacement.  These temporary up/down were a workaround since
> gbaudio_remove_component_controls() itself took the rwsem.  Now it was
> also gone, we can clean up the workaround, too.
> 
> Cc: Vaibhav Agarwal <vaibhav.sr@gmail.com>
> Cc: Mark Greer <mgreer@animalcreek.com>
> Cc: Johan Hovold <johan@kernel.org>
> Cc: Alex Elder <elder@kernel.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: greybus-dev@lists.linaro.org
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  drivers/staging/greybus/audio_codec.c | 18 +++++++-----------
>  drivers/staging/greybus/audio_codec.h |  1 +
>  2 files changed, 8 insertions(+), 11 deletions(-)

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
