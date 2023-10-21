Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 9338C7D1C45
	for <lists+greybus-dev@lfdr.de>; Sat, 21 Oct 2023 11:48:42 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 7111C3F006
	for <lists+greybus-dev@lfdr.de>; Sat, 21 Oct 2023 09:48:41 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id 33B013F006
	for <greybus-dev@lists.linaro.org>; Sat, 21 Oct 2023 09:48:36 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=Btu82OJj;
	dmarc=pass (policy=none) header.from=linuxfoundation.org;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C1CBB60E88;
	Sat, 21 Oct 2023 09:48:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF3BCC433C7;
	Sat, 21 Oct 2023 09:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697881715;
	bh=LWyKW1uK7K8s4xmPcXxHy2ZlSq7/79IXRHSU/lV9Cpk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Btu82OJjszJ0E63UkiKXGBlda/QUAuCXb4Fi/Af0AZj9mWjpB5gjxjfxGDOC3EgNz
	 u6Fc17Zaq1WLuuFE//XcYxJWR0+0NeB9rZ9eJv2FfaDh0YN15gYMw7EEYrc1ZWmn8I
	 15NIpJO2CKN/9gc2bckhrdn6veyKMETwxxzz+btA=
Date: Sat, 21 Oct 2023 11:48:32 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
Message-ID: <2023102131-slacker-lily-28ff@gregkh>
References: <20231019213949.GA2922@ubuntu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231019213949.GA2922@ubuntu>
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 33B013F006
X-Spamd-Bar: ++
X-Spamd-Result: default: False [2.00 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:139.178.84.217];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:54825, ipnet:139.178.80.0/21, country:US];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[linuxfoundation.org:+]
X-Rspamd-Action: no action
X-Spam-Level: **
Message-ID-Hash: 5WBYJXYX6VPED2PGA355HZBES52PYFPY
X-Message-ID-Hash: 5WBYJXYX6VPED2PGA355HZBES52PYFPY
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: Alignment should match open parenthesis
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/5WBYJXYX6VPED2PGA355HZBES52PYFPY/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Oct 19, 2023 at 02:39:49PM -0700, Nandha Kumar Singaram wrote:
> Adhere to linux coding style. Reported by checkpatch.pl:
> CHECK: Alignment should match open parenthesis
> 
> Signed-off-by: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
> ---
>  drivers/staging/greybus/camera.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/staging/greybus/camera.c b/drivers/staging/greybus/camera.c
> index cdbb42cd413b..405c8e78aa72 100644
> --- a/drivers/staging/greybus/camera.c
> +++ b/drivers/staging/greybus/camera.c
> @@ -220,7 +220,7 @@ static int gb_camera_operation_sync_flags(struct gb_connection *connection,
>  }
>  
>  static int gb_camera_get_max_pkt_size(struct gb_camera *gcam,
> -		struct gb_camera_configure_streams_response *resp)
> +				      struct gb_camera_configure_streams_response *resp)
>  {
>  	unsigned int max_pkt_size = 0;
>  	unsigned int i;
> @@ -267,8 +267,7 @@ static int gb_camera_get_max_pkt_size(struct gb_camera *gcam,
>   * Validate the stream configuration response verifying padding is correctly
>   * set and the returned number of streams is supported
>   */
> -static const int gb_camera_configure_streams_validate_response(
> -		struct gb_camera *gcam,
> +static const int gb_camera_configure_streams_validate_response(struct gb_camera *gcam,

Why change this line?

It's fine, but then:

>  		struct gb_camera_configure_streams_response *resp,
>  		unsigned int nstreams)

These lines are not fixed up?

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
