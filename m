Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id CECC7552E05
	for <lists+greybus-dev@lfdr.de>; Tue, 21 Jun 2022 11:14:06 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A464C3F2D4
	for <lists+greybus-dev@lfdr.de>; Tue, 21 Jun 2022 09:14:05 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id 741DE3EF6A
	for <greybus-dev@lists.linaro.org>; Tue, 21 Jun 2022 09:14:03 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0961960F50;
	Tue, 21 Jun 2022 09:14:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68B25C3411C;
	Tue, 21 Jun 2022 09:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655802842;
	bh=pL3F/GzW42CiWS3Yg7kxKAhUPHN0SvH5MN8TC9Ak5Ys=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MxZR/FXJDErptEmSt8w5bbP3lzcw8Pa0UN3pNctXJj6XoJvXKNRHYLFmLeAHT8Hne
	 Y/vk8BjMpi+WlbfYL86H4bdjt/F9w7JUoAOri+UriPenbf4hAsVTB25nDTGDumShI+
	 2DOqbBwF8z3abaBH9vr9PjQooQ9aP9RMYdHd/D665Ga/nlAcNu9J9eJByO1OMXIhuu
	 QaKhvfvg1Redd8RR4HPWUrNv2A9PrayetJotZPEAAad7nos1kPNyw4xuii2mXg3fYc
	 iO80v43tNR84DXygZxj7AFi7P2p7y6NDh8HLFA/OWa13KKl2rZ1RXWvZH6BAa1x3tp
	 r7C2oCfMU6Arg==
Received: from johan by xi.lan with local (Exim 4.94.2)
	(envelope-from <johan@kernel.org>)
	id 1o3ZxL-0001jL-LK; Tue, 21 Jun 2022 11:13:56 +0200
Date: Tue, 21 Jun 2022 11:13:55 +0200
From: Johan Hovold <johan@kernel.org>
To: keliu <liuke94@huawei.com>
Message-ID: <YrGL0zLpdzGbcWE4@hovoldconsulting.com>
References: <20220527063528.2356712-1-liuke94@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220527063528.2356712-1-liuke94@huawei.com>
Message-ID-Hash: D7TWZBH3Z4K5D7LKABSN3RB6H4DXWM6R
X-Message-ID-Hash: D7TWZBH3Z4K5D7LKABSN3RB6H4DXWM6R
X-MailFrom: johan@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: elder@kernel.org, vireshk@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: Directly use ida_alloc()/free()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/D7TWZBH3Z4K5D7LKABSN3RB6H4DXWM6R/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, May 27, 2022 at 06:35:28AM +0000, keliu wrote:
> Use ida_alloc()/ida_free() instead of deprecated
> ida_simple_get()/ida_simple_remove() .
> 
> Signed-off-by: keliu <liuke94@huawei.com>

Is "keliu" really your full legal name?

> ---
>  drivers/staging/greybus/audio_manager.c  |  8 ++++----
>  drivers/staging/greybus/authentication.c |  4 ++--
>  drivers/staging/greybus/fw-download.c    |  4 ++--
>  drivers/staging/greybus/fw-management.c  | 12 ++++++------
>  drivers/staging/greybus/gbphy.c          |  4 ++--
>  drivers/staging/greybus/loopback.c       |  6 +++---
>  drivers/staging/greybus/raw.c            |  6 +++---
>  drivers/staging/greybus/vibrator.c       |  6 +++---
>  8 files changed, 25 insertions(+), 25 deletions(-)
 
> diff --git a/drivers/staging/greybus/authentication.c b/drivers/staging/greybus/authentication.c
> index 297e69f011c7..01dd1cd958ea 100644
> --- a/drivers/staging/greybus/authentication.c
> +++ b/drivers/staging/greybus/authentication.c
> @@ -348,7 +348,7 @@ int gb_cap_connection_init(struct gb_connection *connection)
>  err_del_cdev:
>  	cdev_del(&cap->cdev);
>  err_remove_ida:
> -	ida_simple_remove(&cap_minors_map, minor);
> +	ida_free(&cap_minors_map, minor);
>  err_connection_disable:
>  	gb_connection_disable(connection);
>  err_list_del:
> @@ -372,7 +372,7 @@ void gb_cap_connection_exit(struct gb_connection *connection)
>  
>  	device_destroy(cap_class, cap->dev_num);
>  	cdev_del(&cap->cdev);
> -	ida_simple_remove(&cap_minors_map, MINOR(cap->dev_num));
> +	ida_free(&cap_minors_map, MINOR(cap->dev_num));
>  
>  	/*
>  	 * Disallow any new ioctl operations on the char device and wait for

The above looks incomplete since you do not change the ida_simple_get()
in gb_cap_connection_init().

Please check for any similar mistakes throughout.

Johan
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
