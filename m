Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id D37A347358B
	for <lists+greybus-dev@lfdr.de>; Mon, 13 Dec 2021 21:02:03 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8B7AC61E5C
	for <lists+greybus-dev@lfdr.de>; Mon, 13 Dec 2021 20:02:01 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 35FAF60BAA; Mon, 13 Dec 2021 20:02:01 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 85A9560BAA;
	Mon, 13 Dec 2021 20:01:58 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id AFA7860504
 for <greybus-dev@lists.linaro.org>; Mon, 13 Dec 2021 20:01:57 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id A942960B9D; Mon, 13 Dec 2021 20:01:57 +0000 (UTC)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com
 [209.85.166.44])
 by lists.linaro.org (Postfix) with ESMTPS id A1F7E60504
 for <greybus-dev@lists.linaro.org>; Mon, 13 Dec 2021 20:01:55 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id z18so20081753iof.5
 for <greybus-dev@lists.linaro.org>; Mon, 13 Dec 2021 12:01:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ieee.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=3iSNR3ejvooF9vq0Obv4fgL6xUSCQ0TFvXQZX/GtFkc=;
 b=SVHjXXfQaaDzN7wXth1wyGOaMQxNfL1z0B+Chg1iOUIWWUcxNx2pFt5vFlYrgEp1yy
 xOZ/Zqoc7U992FYO4cRVGWJyiataCj0GfX3IuBrfxdN6uG10ojbadbWW4uDmFy1Gu3Yd
 rXGi7PVF+o8oMfIZ7wWXjqiSmCKCDXF3EMDGs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3iSNR3ejvooF9vq0Obv4fgL6xUSCQ0TFvXQZX/GtFkc=;
 b=yCxJ4OKdcgpJTu9eC+k0Nza3PXgn6ZfViGZxFtLEVC1G29Bb5pP6zB024CUFlBlpc3
 qPgFEKpERUiRzCuzyRI1iiFddklWU28Uzj1FjbioHu3WcU+3PWVD/1SuEConbryHH6Tq
 jc3Zsnmm3GmelsMU3VNb9SzFwHFf3XbUa9bZfLBM6cD4ELNESHpHtTeuI3+98zPVT2j6
 jXrBxMnDir3yzu3iFFkuMHRC1wo94Wib7LWONyzLY3JK1qWfM6/qfXmuZwq7lUh2zwug
 3xFamUF5qn3BfDJqe1MZBWI9H2hywARiHdsXK21bhBOrO/NUBy45Hmqd9ljD3B/eJpEf
 JsFw==
X-Gm-Message-State: AOAM533kVT0QuQWhunRb5d6VZ1NdU9R2cWI3WLbjO+Gv/Vn/raJ1+72n
 cbKNuRBzxCy+1rd+2s1DOJEGtg==
X-Google-Smtp-Source: ABdhPJyFBMFxUOUIPIbjlZyG/ZSu4VqoYZES+FW9ZhxkEwdbgUXjZCkFd37nP9KY24vozOVaiaCCqQ==
X-Received: by 2002:a05:6602:2c83:: with SMTP id
 i3mr682865iow.54.1639425714638; 
 Mon, 13 Dec 2021 12:01:54 -0800 (PST)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net.
 [73.185.129.58]) by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-2faa6b4da5dsm42295173.96.2021.12.13.12.01.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Dec 2021 12:01:48 -0800 (PST)
Message-ID: <bf148212-3030-9ed9-2ff0-5cff0b2e727e@ieee.org>
Date: Mon, 13 Dec 2021 14:01:46 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Content-Language: en-US
To: Jason Wang <wangborong@cdjrlc.com>, elder@kernel.org
References: <20211212031657.41169-1-wangborong@cdjrlc.com>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20211212031657.41169-1-wangborong@cdjrlc.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: [greybus-dev] [PATCH] greybus: es2: fix typo in a comment
X-BeenThere: greybus-dev@lists.linaro.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
List-Unsubscribe: <https://lists.linaro.org/mailman/options/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/greybus-dev/>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Subscribe: <https://lists.linaro.org/mailman/listinfo/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=subscribe>
Cc: johan@kernel.org, linux-kernel@vger.kernel.org,
 greybus-dev@lists.linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

On 12/11/21 9:16 PM, Jason Wang wrote:
> The double `for' in the comment in line 81 is repeated. Remove one
> of them from the comment.

This looks fine.  But it's so trivial...  Are you aware
of *any* other similar trivial problems in comments that
could be fixed together with this?  If so, I would prefer
that.

If you've looked, and there are no others:

Reviewed-by: Alex Elder <elder@linaro.org>


> Signed-off-by: Jason Wang <wangborong@cdjrlc.com>
> ---
>   drivers/greybus/es2.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/greybus/es2.c b/drivers/greybus/es2.c
> index 15661c7f3633..e89cca015095 100644
> --- a/drivers/greybus/es2.c
> +++ b/drivers/greybus/es2.c
> @@ -78,7 +78,7 @@ struct es2_cport_in {
>    * @hd: pointer to our gb_host_device structure
>    *
>    * @cport_in: endpoint, urbs and buffer for cport in messages
> - * @cport_out_endpoint: endpoint for for cport out messages
> + * @cport_out_endpoint: endpoint for cport out messages
>    * @cport_out_urb: array of urbs for the CPort out messages
>    * @cport_out_urb_busy: array of flags to see if the @cport_out_urb is busy or
>    *			not.
> 

_______________________________________________
greybus-dev mailing list
greybus-dev@lists.linaro.org
https://lists.linaro.org/mailman/listinfo/greybus-dev
