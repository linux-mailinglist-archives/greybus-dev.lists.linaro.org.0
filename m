Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 011DDA9C81B
	for <lists+greybus-dev@lfdr.de>; Fri, 25 Apr 2025 13:51:57 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 9E9064122D
	for <lists+greybus-dev@lfdr.de>; Fri, 25 Apr 2025 11:51:55 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by lists.linaro.org (Postfix) with ESMTPS id 2C9BF3F49E
	for <greybus-dev@lists.linaro.org>; Fri, 25 Apr 2025 11:51:51 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=0gAQqvwv;
	dmarc=pass (policy=none) header.from=linuxfoundation.org;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 172.105.4.254 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 364BC6845F;
	Fri, 25 Apr 2025 11:51:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2E19C4CEE4;
	Fri, 25 Apr 2025 11:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1745581910;
	bh=LUXrYjZVHEgsBdp2HP2c1CeQ9o3InPu5P70jXNk78eo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0gAQqvwvYYDi4pF93Vtf949BGBBOSxDsljdQHdWSnKImwpb7Oxks4YCiLLBxqhK5h
	 OrqWoeRVpKQtG8o/ZL4Zi2iE9/woJveAYyBTkSn9ZiqLE2WIhwZ22VwNFh4pcagJnA
	 gE6nBWAX7KfzQupfm1ZWmNcmdCYwzwtKwbs5+h6c=
Date: Fri, 25 Apr 2025 13:51:48 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Andreas Kleinbichler <andi.kleinbichler@gmail.com>
Message-ID: <2025042527-ligament-backlog-f512@gregkh>
References: <aApq_JPIBhnGqfiR@andreas-VirtualBox>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aApq_JPIBhnGqfiR@andreas-VirtualBox>
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 2C9BF3F49E
X-Spamd-Bar: +
X-Spamd-Result: default: False [1.00 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	RBL_SENDERSCORE_REPUT_9(-1.00)[172.105.4.254:from];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.4.254];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MIME_GOOD(-0.10)[text/plain];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.0.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	DNSWL_BLOCKED(0.00)[100.75.92.58:received,172.105.4.254:from];
	TAGGED_RCPT(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6]
X-Spam-Level: *
Message-ID-Hash: HRENQNM2QRDBYNH4BBS7C46K5MR57UJE
X-Message-ID-Hash: HRENQNM2QRDBYNH4BBS7C46K5MR57UJE
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] [Patch]: staging: greybus: camera: fix alignment should match open parentheses
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/HRENQNM2QRDBYNH4BBS7C46K5MR57UJE/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Apr 24, 2025 at 06:46:52PM +0200, Andreas Kleinbichler wrote:
> Correct the alignment of the parameters to match the open parenthesis.
> 
> Reported by checkpatch:
> 
>         CHECK: Alignment should match open parenthesis
> 
> Signed-off-by: Andreas Kleinbichler <andi.kleinbichler@gmail.com>
> ---
>  drivers/staging/greybus/camera.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/greybus/camera.c b/drivers/staging/greybus/camera.c
> index ec9fddfc0b14..a1b76df39a8f 100644
> --- a/drivers/staging/greybus/camera.c
> +++ b/drivers/staging/greybus/camera.c
> @@ -263,9 +263,10 @@ static int gb_camera_get_max_pkt_size(struct gb_camera *gcam,
>   * Validate the stream configuration response verifying padding is correctly
>   * set and the returned number of streams is supported
>   */
> -static const int gb_camera_configure_streams_validate_response(struct gb_camera *gcam,
> -		struct gb_camera_configure_streams_response *resp,
> -		unsigned int nstreams)
> +static const int gb_camera_configure_streams_validate_response
> +	(struct gb_camera *gcam,

But that's not right either :(

There is no real "fix" possible for this warning, sorry.

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
