Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE50507B85
	for <lists+greybus-dev@lfdr.de>; Tue, 19 Apr 2022 22:58:08 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1E8F940435
	for <lists+greybus-dev@lfdr.de>; Tue, 19 Apr 2022 20:58:08 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	by lists.linaro.org (Postfix) with ESMTPS id 8753C3ED51
	for <greybus-dev@lists.linaro.org>; Wed, 13 Apr 2022 04:50:35 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id j6so565218qkp.9
        for <greybus-dev@lists.linaro.org>; Tue, 12 Apr 2022 21:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=SNrcfRE6HdOzXoCUILYeyPwHz9qMy++4j1/0BHKP8XY=;
        b=htaaJoxot6ne7hAx0KnKCHkv0Tt49PTBd51CvrGc25fVyx5e+psJvSzVG5wQqAbor/
         ozVzCwO0wYk6RXfyoQA/Mt5BFTE3nXmLA5elPH8HZknUI9qImFUSyEbEzV6swo1OZINo
         USA3K8Cp/U76hy4gG3zPDtKHqLQI9wTznS97kP9NDoaytbAxOg2jCitTSVGk80nVzA4n
         tik3993mg+mqHes2MLCyPLij0K+TL3XFMcS6o1adn09+HkIuGXeAIaPgwCvQ1UX5PcUo
         /Pcs9QrDZs+JXYGj/rFMdr95X/nhT+PirYHCajM07guCwC+OE+9oYow8UF7N7f5+6DEh
         4diQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SNrcfRE6HdOzXoCUILYeyPwHz9qMy++4j1/0BHKP8XY=;
        b=Ril+yC/IGvgTcd8Xnt90RsFjCy8eEY1/J4S1Rp2n8CFRI/D3ApF+s6YRmolf/c2gi9
         b58xuYfp1WpN9GPOBgLLppYXUZwxW4XplQEQpqshSNpfpkk6VtqRWfb5pjD8k6DPHIJV
         OCaZpgjrkKctaNdACENCZXod+8LEue1Rq4RpSitlEJNGvBMPOR+oXSoG5rVWOIHWx3z1
         YCs0v4ityITjY4YWML6AhOvY7y5Q8C2EgS20LLbcsCPZS/Q5in/wcRxtLb0uEVrbSh3+
         Jvw8JHM43zmyUzFnmhPEo6zu9BoT84CtFCSa/YL7p18d1GGhDEEr6YghE0dJBww0QqEz
         wGDw==
X-Gm-Message-State: AOAM532UC4QXrqqkUucdHisghq6QxI0PI3TeTn68kDSyfK7Nkq1jxyQb
	Tk4cIa/YZpC4HKlP9qc3pHE=
X-Google-Smtp-Source: ABdhPJzyciJssltn87XV2LoiVnxXmK1S0Q5FBlOrU/I3Ug0eVbn1LbT0yp9Ff7ISrLfXctXxBOOfwQ==
X-Received: by 2002:a37:9243:0:b0:699:9012:df43 with SMTP id u64-20020a379243000000b006999012df43mr5528039qkd.424.1649825435188;
        Tue, 12 Apr 2022 21:50:35 -0700 (PDT)
Received: from jaehee-ThinkPad-X1-Extreme ([2607:fb90:50fb:900e:5e57:caff:f44b:33f4])
        by smtp.gmail.com with ESMTPSA id p16-20020a05622a13d000b002e227782e9asm28287014qtk.14.2022.04.12.21.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 21:50:34 -0700 (PDT)
Date: Wed, 13 Apr 2022 00:50:31 -0400
From: Jaehee Park <jhpark1013@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <20220413045031.GC3357359@jaehee-ThinkPad-X1-Extreme>
References: <20220411211411.GA2796005@jaehee-ThinkPad-X1-Extreme>
 <YlUGbFs8oNikJCcv@kroah.com>
 <YlUGp+/BzMSm3oDC@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YlUGp+/BzMSm3oDC@kroah.com>
X-MailFrom: jhpark1013@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 4YBCHZ6KFDSXXJPRU4I5OYYXFAVJP7UZ
X-Message-ID-Hash: 4YBCHZ6KFDSXXJPRU4I5OYYXFAVJP7UZ
X-Mailman-Approved-At: Tue, 19 Apr 2022 20:58:04 +0000
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: replace zero-element array with flexible-array
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/4YBCHZ6KFDSXXJPRU4I5OYYXFAVJP7UZ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Apr 12, 2022 at 06:57:11AM +0200, Greg Kroah-Hartman wrote:
> On Tue, Apr 12, 2022 at 06:56:12AM +0200, Greg Kroah-Hartman wrote:
> > On Mon, Apr 11, 2022 at 05:14:11PM -0400, Jaehee Park wrote:
> > > Zero-length and one-element arrays are deprecated. Flexible-array
> > > members should be used instead. Flexible-array members are
> > > recommended because this is the way the kernel expects dynamically
> > > sized trailing elements to be declared.
> > > Refer to Documentation/process/deprecated.rst.
> > > 
> > > Change the zero-length array, buf, in the struct 
> > > gb_usb_hub_control_response to a flexible array. And add wLength as a 
> > > member of the struct so that the struct is not a zero-sized struct.
> > > 
> > > Issue found by flexible_array coccinelle script.
> > > 
> > > Signed-off-by: Jaehee Park <jhpark1013@gmail.com>
> > > ---
> > > 
> > > I have a question for the authors: 
> > > I saw a fixme comment in the hub_control function in usb.c:
> > > / FIXME: handle unspecified lengths /
> > > 
> > > I was wondering why this comment was left there?
> > > 
> > > In this patch, I'm using this struct:
> > > 
> > > struct gb_usb_hub_control_response {
> > >     __le16 wLength;
> > >     u8 buf[];
> > > };
> > > 
> > > And instead of using response_size, I'm doing this:
> > > 
> > > struct gb_usb_hub_control_response *response;
> > > And using sizeof(*response) as the input to gb_operation_create.
> > > 
> > > Would the flexible array address the handling of unspecified lengths 
> > > issue (in the fixme comment)?
> > 
> > No, you can not change the format of the data on the bus without also
> > changing the firmware in the device and usually the specification as
> > well.
> > 
> > >  drivers/staging/greybus/usb.c | 7 +++----
> > >  1 file changed, 3 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/staging/greybus/usb.c b/drivers/staging/greybus/usb.c
> > > index 8e9d9d59a357..d0b2422401df 100644
> > > --- a/drivers/staging/greybus/usb.c
> > > +++ b/drivers/staging/greybus/usb.c
> > > @@ -27,7 +27,8 @@ struct gb_usb_hub_control_request {
> > >  };
> > >  
> > >  struct gb_usb_hub_control_response {
> > > -	u8 buf[0];
> > > +	__le16 wLength;
> > > +	u8 buf[];
> > 
> > What is wrong with buf[0] here?
> > 
> > You can fix this in other ways if you really understand the difference
> > between [0] and [] in C.  Please look at many of the other conversions
> > if you wish to do this.
> 
> And I would not recommend this as an "outreachy introduction task"
> unless you understand this.  There are much easier first patch tasks you
> can accomplish instead.
> 

Hi Greg, 
I should've made this into a question for the maintainers instead of a
patch. Sorry about that. Dan's and your comments are well noted. 
Thank you,
Jaehee

> good luck!
> 
> greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
